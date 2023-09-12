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
        //      -------         LIMITS AND OBJECTS
        //


        //  Лимиты

        int l_CL_Id = 0;
        string l_CL_Name = "";
        bool l_CL_GroupEmit = false;
        bool l_CL_GroupInstr = false;
        bool l_CL_IsComplex = true;
        string l_CL_query = "";
        int l_CL_FTId = 1;

        private void bt_Add_Click(object sender, EventArgs e)
        {
            gFormAUD.Prepare("Add Limit", 'A', 'L', 0, "");
            gFormAUD.Show();
        }

        private void bt_Edit_Click(object sender, EventArgs e)
        {
            if (l_CL_Id > 0) gFormAUD.Prepare("Update Limit", 'U', 'L', l_CL_Id, l_CL_Name, l_CL_GroupEmit, l_CL_GroupInstr, l_CL_IsComplex, l_CL_query, l_CL_FTId);
            gFormAUD.Show();
        }

        private void bt_Delete_Click(object sender, EventArgs e)
        {
            if (l_CL_Id > 0) gFormAUD.Prepare("WARNING!!! Delete Limit?", 'D', 'L', l_CL_Id, l_CL_Name, l_CL_GroupEmit, l_CL_GroupInstr, l_CL_IsComplex, l_CL_query);
            gFormAUD.Show();
        }

        private void SetActiveCL(object sender, DataGridViewCellEventArgs e)
        {
            int.TryParse(dg_CL.Rows[e.RowIndex].Cells[0].Value.ToString(), out l_CL_Id);
            l_CL_Name = dg_CL.Rows[e.RowIndex].Cells[1].Value.ToString();
            l_CL_GroupEmit = ((bool)dg_CL.Rows[e.RowIndex].Cells[3].Value);
            l_CL_GroupInstr = ((bool)dg_CL.Rows[e.RowIndex].Cells[4].Value);
            l_CL_IsComplex = ((bool)dg_CL.Rows[e.RowIndex].Cells[5].Value);
            l_CL_query = dg_CL.Rows[e.RowIndex].Cells[6].Value.ToString();
            int.TryParse(dg_CL.Rows[e.RowIndex].Cells[7].Value.ToString(), out l_CL_FTId);

            l_Limit_Head.Text = String.Format("Лимит {0}.  \"{1}\"", l_CL_Id, l_CL_Name);


            if (!l_CL_IsComplex)
            {
                l_NOT_Complex.Visible = true;
                bt_AddObj.Enabled = false;
                bt_DeleteObj.Enabled = false;
                bt_EditObj.Enabled = false;
            }
            else
            {
                l_NOT_Complex.Visible = false;
                bt_AddObj.Enabled = true;
                bt_DeleteObj.Enabled = true;
                bt_EditObj.Enabled = true;
            }
            ShowCLObjects(l_CL_Id);
        }

        public void AddUpdateDelCL(char aAction, int aId, string aName, bool aGroup, bool aInstr, bool aIsComplex, string aQuery, string aFtId = "1")
        {
            if (gConn.State == ConnectionState.Open)
            {
                string vCommTxt = (aAction == 'D' ? string.Format("exec CL_DeleteLimit {0}", aId) :
                                                    string.Format("exec CL_UpdateLimit {0}, '{1}', {2}, {3}, {4}, '{5}', {6}", 
                                                            aId, aName, aGroup, aInstr, aIsComplex, aQuery, aFtId));
                SqlCommand vComm = new SqlCommand(vCommTxt, gConn);
                vComm.ExecuteNonQuery();
                l_CL_Id = 0; l_CL_Name = "";
            }
            this.cLTableAdapter.Fill(this.lC3_devDataSet.CL);
        }



        //  Объекты

        int l_Obj_Id = 0;
        string l_Obj_Name = "";

        private void ShowCLObjects(int aCLId)
        {
            l_Obj_Id = 0; l_Obj_Name = "";
            this.cL_ObjectsTableAdapter.FillBy_CL(this.lC3_devDataSet.CL_Objects, aCLId);
            ShowObjSelected();
        }

        private void ShowObjSelected()
        {
            l_Object_Head.Text = String.Format("Объект {0}.  \"{1}\"", l_Obj_Id, (l_Obj_Id > 0 ? l_Obj_Name : "Не выбран"));
            if (l_Obj_Id > 0) GetObjectConditions(l_Obj_Id);
            bSaveCond.Enabled = (l_Obj_Id > 0) ? true : false;
            foreach (ParamForm vP in gParamFormList) if (l_Obj_Id > 0) vP.SetActive();
                else vP.SetUnActive();
        }

        private void bt_AddObj_Click(object sender, EventArgs e)
        {
            gFormAUD.Prepare(String.Format("Add Object to limit {0}", l_CL_Id), 'A', 'O', 0, "");
            gFormAUD.Show();
        }

        private void bt_EditObj_Click(object sender, EventArgs e)
        {
            if (l_Obj_Id > 0) gFormAUD.Prepare("Update Object", 'U', 'O', l_Obj_Id, l_Obj_Name);
            gFormAUD.Show();
        }

        private void bt_DeleteObj_Click(object sender, EventArgs e)
        {
            if (l_Obj_Id > 0) gFormAUD.Prepare("WARNING!!! Delete Object?", 'D', 'O', l_Obj_Id, l_Obj_Name);
            gFormAUD.Show();
        }

        private void SetActiveObj(object sender, DataGridViewCellEventArgs e)
        {
            int.TryParse(dg_Objects.Rows[e.RowIndex].Cells[0].Value.ToString(), out l_Obj_Id);
            l_Obj_Name = dg_Objects.Rows[e.RowIndex].Cells[1].Value.ToString();
            ShowObjSelected();
        }

        public void AddUpdateDelObj(char aAction, int aId, string aName)
        {
            if (gConn.State == ConnectionState.Open)
            {
                string vCommTxt = (aAction == 'D' ? string.Format("exec CL_DeleteObject {0}", aId) : string.Format("exec CL_UpdateObject {0}, '{1}', {2}", aId, aName, l_CL_Id));
                SqlCommand vComm = new SqlCommand(vCommTxt, gConn);
                vComm.ExecuteNonQuery();
                l_Obj_Id = 0; l_Obj_Name = "";
            }
            ShowCLObjects(l_CL_Id);
        }

        public void GetObjectConditions(int aObjectId = 0)
        {
            foreach (ParamForm vPF in gParamFormList) vPF.FillValues("", "", false);
            if ((aObjectId > 0) && (gConn.State == ConnectionState.Open))
            {
                SqlCommand vSqlCommand = new SqlCommand(string.Format("exec CL_SelectObjectConditions '{0}'", aObjectId), gConn);
                SqlDataReader vReader = vSqlCommand.ExecuteReader();
                while (vReader.Read())
                {
                    int vParamId = Convert.ToInt32(vReader[0]);
                    foreach (ParamForm vPF in gParamFormList)
                        if (vPF.ParamId == vParamId) vPF.FillValues(vReader[1].ToString(), vReader[2].ToString(), Convert.ToBoolean(vReader[3]));
                }
                vReader.Close();
            }
        }

        private void bSaveCond_Click(object sender, EventArgs e)
        {
            foreach (ParamForm vPF in gParamFormList)
            {
                string vCond;
                string vValues;
                bool vIsNull;
                vPF.ReturnValues(out vCond, out vValues, out vIsNull);
                if ((l_Obj_Id > 0) && (gConn.State == ConnectionState.Open))
                {
                    SqlCommand vSqlCommand = new SqlCommand(string.Format("exec CL_SaveObjectParam {0}, {1}, '{2}', '{3}', {4}",
                                l_Obj_Id, vPF.ParamId, vCond.Replace("'", "''"), vValues.Replace("'", "''"), (vIsNull ? 1 : 0)), gConn);
                    vSqlCommand.ExecuteNonQuery();
                }
            }
        }

        //
        //      -------         LIMITS AND OBJECTS
        //



    }
}
