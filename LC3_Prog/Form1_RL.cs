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
        //      -------         RESTRICT LIST
        //

        string gRL_RT = "N";
        int gRL_ClientId = 0;
        int gRL_Index = -1;

        private void RL_Enter(object sender, EventArgs e)
        {
            RL_Filter_Changed(sender, e);
        }

        private void bt_Add_RL(object sender, EventArgs e)
        {
            gFormRLAUD.Prepare("Добавить ограничение", 'A', vRL_ClientId, vRL_Type, "", 0, "P", "", "");
            gFormRLAUD.Show();
        }


        private void bt_Edit_RL(object sender, EventArgs e)
        {
            gFormRLAUD.Prepare("Изменить ограничение", 'U', vRL_ClientId, vRL_Type, vRL_RN, vRL_LimitValue, vRL_LimitType, vRL_Echelon, vRL_Rid);
            gFormRLAUD.Show();
        }

        private void ShowFilteredRL(int aClientid, string aRT)
        {
            if (aClientid != 0)
            {
                if (aRT != "N")
                {
                    this._CL_RestrictionsTableAdapter.FillBy_ClientIdRT(this.lC3_devDataSet._CL_Restrictions, aClientid, aRT);
                }
                else
                {
                    this._CL_RestrictionsTableAdapter.FillBy_Clients(this.lC3_devDataSet._CL_Restrictions, aClientid);
                }
            }
            else
            {
                if (aRT != "N")
                {
                    this._CL_RestrictionsTableAdapter.FillBy_RT(this.lC3_devDataSet._CL_Restrictions, aRT);
                }
                else
                {
                    this._CL_RestrictionsTableAdapter.FillBy_Ordered(this.lC3_devDataSet._CL_Restrictions);
                }
            }
        }

        private void b_Filter_Click(object sender, EventArgs e)
        {
            RL_Filter_Changed(sender, e);
        }

        private void RL_Filter_Changed(object sender, EventArgs e)
        {
            int.TryParse(cb_F_Client.SelectedValue.ToString(), out gRL_ClientId);
            gRL_RT = cb_F_RestrictType.SelectedValue.ToString();
            TextLog(gRL_RT);
            ShowFilteredRL(gRL_ClientId, gRL_RT);
            gRL_Index = -1;
        }

        private void SetActiveRL(object sender, DataGridViewCellEventArgs e)
        {
            gRL_Index = e.RowIndex;
            int.TryParse(dgv_Restr.Rows[gRL_Index].Cells[0].Value.ToString(), out vRL_ClientId);
            vRL_Type = dgv_Restr.Rows[gRL_Index].Cells[2].Value.ToString();
            vRL_Rid = dgv_Restr.Rows[gRL_Index].Cells[4].Value.ToString();
            vRL_RN = dgv_Restr.Rows[gRL_Index].Cells[5].Value.ToString();
            vRL_Echelon = dgv_Restr.Rows[gRL_Index].Cells[6].Value.ToString();
            vRL_LimitType = dgv_Restr.Rows[gRL_Index].Cells[7].Value.ToString();
            float.TryParse(dgv_Restr.Rows[gRL_Index].Cells[8].Value.ToString(), out vRL_LimitValue);
        }


        public void AddUpdateDelRL(int aClientId, string aType, string aRid, char aLimitType, 
                                    float aLimitValue, string aEchelon, bool aTableEdit =   false)
        {
            if (gConn.State == ConnectionState.Open)
            {
                string vCommTxt = string.Format("exec CL_AddUpdateRestriction {0}, '{1}', '{2}', '{3}', {4}, '{5}'", 
                                            aClientId, aType, aRid, aLimitType, aLimitValue.ToString().Replace(',', '.'), aEchelon);
                SqlCommand vComm = new SqlCommand(vCommTxt, gConn);
                vComm.ExecuteNonQuery();
            }
            if (!aTableEdit) ShowFilteredRL(gRL_ClientId, gRL_RT);
        }


        private void bt_RL_delete(object sender, EventArgs e)
        {
            if ((gRL_Index >= 0) && (MessageBox.Show(string.Format("Удалить ограничение на {0} {1} по клиенту {2}({3})?",
                    dgv_Restr.Rows[gRL_Index].Cells[3].Value.ToString(), vRL_RN,
                    dgv_Restr.Rows[gRL_Index].Cells[1].Value.ToString(), vRL_ClientId.ToString()),
    "Подтверждение удаления", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes) && (gConn.State == ConnectionState.Open))
            {
                string vCommTxt = string.Format("exec CL_AddUpdateRestriction {0}, '{1}', '{2}', 'D', 0, ''", vRL_ClientId, vRL_Type, vRL_Rid);
                SqlCommand vComm = new SqlCommand(vCommTxt, gConn);
                vComm.ExecuteNonQuery();
                ShowFilteredRL(gRL_ClientId, gRL_RT);
            }
        }


        private void RLValueEdited(object sender, DataGridViewCellEventArgs e)
        {
            //
            DataGridViewRow vDGVR = dgv_Restr.Rows[e.RowIndex];
            int vClId = 0; int.TryParse(vDGVR.Cells[0].Value.ToString(), out vClId);
            float vLimValue = 0; float.TryParse(vDGVR.Cells[8].Value.ToString(), out vLimValue);
            string vType = vDGVR.Cells[2].Value.ToString();
            string vRid = vDGVR.Cells[4].Value.ToString();
            char vLimType = (vDGVR.Cells[7].Value.ToString())[0];
            string vEchelon = vDGVR.Cells[6].Value.ToString();
            //           TextLog("{0}  {1} {2}  {3} {4}   {5} {6}", e.RowIndex, vClId, vLimValue, vType, vRid, vLimType, vEchelon);
            AddUpdateDelRL(vClId, vType, vRid, vLimType, vLimValue, vEchelon, true);

        }


        //
        //      -------         RESTRICT LIST
        //




    }
}
