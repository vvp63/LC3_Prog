using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace LC3_Prog
{
    public partial class F_RL_AddDElUpd : Form
    {

        char gAction = 'A';         //  A - add, U - update, D - delete
        Form_Main gOwnerForm;
        string gClientId  = "1";
        string gRestrType = "G";
        bool gAllowRid = false;


        public F_RL_AddDElUpd(Form_Main aFM)
        {
            gOwnerForm = aFM;
            InitializeComponent();
            // TODO: данная строка кода позволяет загрузить данные в таблицу "lC3_devDataSet.RL_Types". При необходимости она может быть перемещена или удалена.
            this.rL_TypesTableAdapter.FillBy_NoN(this.lC3_devDataSet.RL_Types);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "lC3_devDataSet._CL_Clients". При необходимости она может быть перемещена или удалена.
            this._CL_ClientsTableAdapter.FillBy_NoAll(this.lC3_devDataSet._CL_Clients);
        }

        private void F_RL_AddDElUpd_Load(object sender, EventArgs e)
        {
            //
        }

        public void Prepare(string aTitle, char aAction, int aClientId, string aRestrType, string aRestrFT, float aLimitValue, string aLimitType, string aEchelon, string aRid)
        {
            this.Text = aTitle;
            gAction = aAction;
            bt_Action.Text = (aAction == 'D' ? "Delete" : (aAction == 'U' ? "Update" : "Add"));
            gClientId = aClientId.ToString();
            gRestrType = aRestrType;
            tb_Find.Text = aRestrFT;
            if (aRestrFT != "") cb_RestrictName.Text = aRestrFT;
            tb_LimitValue.Text = aLimitValue.ToString();
            cb_LimitType.SelectedIndex = (aLimitType == "P" ? 0 : 1);
            tb_Echelon.Text = aEchelon;
            cb_Clients.SelectedValue = gClientId;
            cb_RestrType.SelectedValue = gRestrType;
            cb_RestrType.SelectedValueChanged += RestrTypeChanged;
            SelectRestrictObject(gRestrType, tb_Find.Text);
            l_rid.Text = aRid;
        }

        private void RestrTypeChanged(object sender, EventArgs e)
        {
            tb_Find.Text = "";
            SelectRestrictObject(cb_RestrType.SelectedValue.ToString(), tb_Find.Text);
            
        }

        private void TryFound(object sender, KeyEventArgs e)
        {
            SelectRestrictObject(cb_RestrType.SelectedValue.ToString(), tb_Find.Text);
        }

        private void SelectRestrictObject(string aSV, string aFT)
        {
            string vSV = "C";
            if (gOwnerForm.gConn.State == ConnectionState.Open)
            {
                SqlCommand vSqlCommand = new SqlCommand(string.Format("exec RL_GetShowCode '{0}'", aSV), gOwnerForm.gConn);           
                SqlDataReader vReader = vSqlCommand.ExecuteReader();
                while (vReader.Read()) vSV = vReader[0].ToString();
                vReader.Close();
            }


            gAllowRid = false;
            if (vSV == "I")
            {
                l_RL_Name.Text = "Выпуск";
                this._CL_ContragentsTableAdapter.FillBy_Issues(this.lC3_devDataSet._CL_Contragents, aFT);
            }

            if (vSV == "C") 
            {
                l_RL_Name.Text = "Эмитент";
                this._CL_ContragentsTableAdapter.FillBy_Contr(this.lC3_devDataSet._CL_Contragents, aFT);
            }

            if (vSV == "G")
            {
                l_RL_Name.Text = "Группа";
                this._CL_ContragentsTableAdapter.FillBy_Groups(this.lC3_devDataSet._CL_Contragents, aFT);
            }

            if (vSV == "IG")
            {
                l_RL_Name.Text = "Группа выпусков";
                this._CL_ContragentsTableAdapter.FillBy_IssueGroups(this.lC3_devDataSet._CL_Contragents, aFT);
            }

            l_rid.Text = "";
            gAllowRid = true;
        }

        private void RestrRid_changed(object sender, EventArgs e)
        {
            if (gAllowRid && (cb_RestrictName.SelectedIndex < cb_RestrictName.Items.Count)) l_rid.Text = cb_RestrictName.SelectedValue.ToString();
        }

        private void bt_Action_Click(object sender, EventArgs e)
        {
            int vClientId = 0;
            int.TryParse(cb_Clients.SelectedValue.ToString(), out vClientId);
            float vLimitValue = 0;
            float.TryParse(tb_LimitValue.Text, out vLimitValue);
            if ((vClientId > 0) && (l_rid.Text.Length > 0))
            {
                gOwnerForm.AddUpdateDelRL(vClientId, cb_RestrType.SelectedValue.ToString(), cb_RestrictName.SelectedValue.ToString(),
                    (cb_LimitType.Text == "%" ? 'P' : 'A'), vLimitValue, tb_Echelon.Text);
                this.Hide();
            }
        }

        private void bt_Cncl_Click(object sender, EventArgs e)
        {
            this.Hide();
        }


    }
}
