using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data;

namespace LC3_Prog
{
    public partial class Form_Main : Form
    {

        //
        //      -------         Groups
        //

        int lGroupId = 0;
        string lGroupName = "";

        private void Groups_enter(object sender, EventArgs e)
        {
            //  this.cb_GontrFind.DataSource = this.cLContragentsBindingSource;
            this.cb_GontrFind.DataSource = this.cLContragentsBindingSource;
            this.cb_GontrFind.DisplayMember = "name";
            this.cb_GontrFind.ValueMember = "rid";
            l_contrid.Text = "";
            lGroupId = 0; lGroupName = "";
            ShowSelectedGroup();
            this.cL_GroupsTableAdapter.Fill(this.lC3_devDataSet.CL_Groups);
        }

        private void SelectActiveId(object sender, DataGridViewCellEventArgs e)
        {
            int.TryParse(dgv_groups.Rows[e.RowIndex].Cells[0].Value.ToString(), out lGroupId);
            lGroupName = dgv_groups.Rows[e.RowIndex].Cells[2].Value.ToString();
            ShowSelectedGroup();
        }

        private void AddingGroup(object sender, EventArgs e)
        {
            gFormGroups.PrepareToOpen("Добавление группы", 0, "");
            gFormGroups.Show();
        }

        private void EditingGroup(object sender, EventArgs e)
        {
            if (lGroupId > 0)
            {
                gFormGroups.PrepareToOpen(string.Format("Редактирование группы № {0}", lGroupId), lGroupId, lGroupName);
                gFormGroups.Show();
            }
        }

        public void AddUpdateGroup(int aId, string aName)
        {
            if (gConn.State == ConnectionState.Open)
            {
                SqlCommand vComm = new SqlCommand(string.Format("exec CL_AddUpdate_Group '{0}', {1}", aName, aId), gConn);
                vComm.ExecuteNonQuery();
            }
            this.cL_GroupsTableAdapter.Fill(this.lC3_devDataSet.CL_Groups);
        }


        private void DeletingGroup(object sender, EventArgs e)
        {
            if ((lGroupId > 0) && (MessageBox.Show(string.Format("Удалить группу {0} ({1})?", lGroupId, lGroupName),
                "Подтверждение удаления", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes))
            {
                SqlCommand vSQLComm = new SqlCommand(string.Format("exec CL_Delete_Group {0}", lGroupId), gConn);
                vSQLComm.ExecuteNonQuery();
                lGroupId = 0; lGroupName = "";
                ShowSelectedGroup();
                this.cL_GroupsTableAdapter.Fill(this.lC3_devDataSet.CL_Groups);
            }
        }

        private void ShowSelectedGroup()
        {
            if (lGroupId == 0) l_SelectedGroup.Text = "Группа не выбрана";
            else l_SelectedGroup.Text = string.Format("Выбрана группа №{0} ({1})", lGroupId, lGroupName);
            this._CL_GroupContentTableAdapter.FillBy_Group(this.lC3_devDataSet._CL_GroupContent, lGroupId);
            this._CL_SubGroupTableAdapter.FillBy_Group(this.lC3_devDataSet._CL_SubGroup, lGroupId);

            //   this._CL_SubGroupTableAdapter.FillBy_Group(this.limitControlSimple_devDataSet._CL_SubGroup, lGroupId);
        }

        private void FindContrToGroup(object sender, EventArgs e)
        {
            l_contrid.Text = "";
            this._CL_ContragentsTableAdapter.FillBy_Found(this.lC3_devDataSet._CL_Contragents, tb_ContrFind.Text);
            //    this._CL_ContragentsTableAdapter.FillBy_Found(this.limitControlSimple_devDataSet._CL_Contragents, tb_ContrFind.Text);
        }

        private void Select_Contr(object sender, EventArgs e)
        {
            l_contrid.Text = Convert.ToString(((ComboBox)sender).SelectedValue);
        }

        private void b_AddToGroup_Click(object sender, EventArgs e)
        {
            if ((lGroupId > 0) && (l_contrid.Text != ""))
            {
                if (gConn.State == ConnectionState.Open)
                {
                    SqlCommand vComm = new SqlCommand(string.Format("exec CL_AddGroupContent {0}, '{1}'", lGroupId, l_contrid.Text), gConn);
                    vComm.ExecuteNonQuery();
                    ShowSelectedGroup();
                }
            }
            else MessageBox.Show("Не выбрана группа или контрагент", "Невозможно выполнить сохранение", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        private void ClickAddSub(object sender, EventArgs e)
        {
            int vSubId = 0;
            int.TryParse(t_SubId.Text, out vSubId);
            if ((lGroupId > 0) && (vSubId > 0))
            {
                if (gConn.State == ConnectionState.Open)
                {
                    SqlCommand vComm = new SqlCommand(string.Format("exec CL_AddSubGroup {0}, '{1}'", lGroupId, vSubId), gConn);
                    vComm.ExecuteNonQuery();
                    ShowSelectedGroup();
                }
            }
            else MessageBox.Show("Не выбрана группа или № подгруппы задан некорректно", "Невозможно выполнить сохранение", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        private void Click_Delete(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 2)
            {
                if ((lGroupId > 0) && (MessageBox.Show(string.Format("Удалить контрагента {0} из группы №{1} ({2})?",
                    dgv_GroupContent.Rows[e.RowIndex].Cells[0].Value, lGroupId, lGroupName),
                    "Подтверждение удаления", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes))
                {
                    if (gConn.State == ConnectionState.Open)
                    {
                        SqlCommand vComm = new SqlCommand(string.Format("exec CL_DeleteGroupContent {0}, '{1}'",
                                                                        lGroupId, dgv_GroupContent.Rows[e.RowIndex].Cells[1].Value), gConn);
                        vComm.ExecuteNonQuery();
                        ShowSelectedGroup();
                    }
                }
            }
        }

        private void Click_DeleteSub(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 3)
            {
                if ((lGroupId > 0) && (MessageBox.Show(string.Format("Удалить подгруппу {0} из группы №{1} ({2})?",
                    dgv_SubGroups.Rows[e.RowIndex].Cells[1].Value, lGroupId, lGroupName),
                    "Подтверждение удаления", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes))
                {
                    if (gConn.State == ConnectionState.Open)
                    {
                        SqlCommand vComm = new SqlCommand(string.Format("exec CL_DeleteSubGroup {0}, '{1}'",
                                                                        lGroupId, dgv_SubGroups.Rows[e.RowIndex].Cells[1].Value), gConn);
                        vComm.ExecuteNonQuery();
                        ShowSelectedGroup();
                    }
                }
            }
        }



        //
        //      -------         Groups
        //




    }
}
