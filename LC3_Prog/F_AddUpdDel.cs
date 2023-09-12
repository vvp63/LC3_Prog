using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace LC3_Prog
{
    public partial class F_AddUpdDel : Form
    {

        char gAction = 'A';         //  A - add, U - update, D - delete
        char gWorkWith = 'L';       //  L - limit, O - object
        Form_Main gOwnerForm;

        public F_AddUpdDel(Form_Main aFM)
        {
            gOwnerForm = aFM;
            InitializeComponent();
        }

        public void Prepare(string aTitle, char aAction, char aWorkWith, int aId, string aName, bool aGroup = false, bool aInstr = false, bool aIsComplex = true, string aQuery = "", int aFTid =   1)
        {
            this.cL_queries_listTableAdapter.FillBy_Ordered(this.lC3_devDataSet.CL_queries_list);
            this.factTablesListTableAdapter.Fill(this.lC3_devDataSet.FactTablesList);
            this.Text = aTitle;
            gAction = aAction;
            gWorkWith = aWorkWith;
            bt_Action.Text = (aAction == 'D' ? "Delete" : (aAction == 'U' ? "Update" : "Add") );
            tb_Id.Text = aId.ToString();
            tb_Id.Enabled = false;
            tb_Name.Text = aName;
            cb_groupByEmit.Checked = aGroup;
            cb_groupByInstr.Checked = aInstr;
            cb_IsComplex.Checked = aIsComplex;
            cb_IsComplex.CheckStateChanged += cb_IsComplex_Click;
            cb_QueryView.SelectedValue = aQuery;
            cb_QueryView.Enabled = !aIsComplex;
            if (aAction == 'D') tb_Name.Enabled = false; else tb_Name.Enabled = true;
            cb_groupByEmit.Visible = (gWorkWith == 'L');
            cb_groupByInstr.Visible = (gWorkWith == 'L');
            cb_IsComplex.Visible = (gWorkWith == 'L');
            cb_QueryView.Visible = (gWorkWith == 'L');
            l_FTId.Visible = (gWorkWith == 'L');
            cb_FtIds.Visible = (gWorkWith == 'L');
            this.Height = 145 + 80 * (gWorkWith == 'L' ? 1 : 0);
            bt_Action.Top = this.Height - 68; bt_Cncl.Top = this.Height - 68;
            cb_FtIds.SelectedValue = aFTid;
        }


        private void bt_Cncl_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void bt_Action_Click(object sender, EventArgs e)
        {
            int vId = 0; int.TryParse(tb_Id.Text, out vId);
            if (gWorkWith == 'L') gOwnerForm.AddUpdateDelCL(gAction, vId, tb_Name.Text, cb_groupByEmit.Checked, cb_groupByInstr.Checked, cb_IsComplex.Checked, cb_QueryView.Text, cb_FtIds.SelectedValue.ToString());
            if (gWorkWith == 'O') gOwnerForm.AddUpdateDelObj(gAction, vId, tb_Name.Text);
            this.Hide();
        }

        private void cb_IsComplex_Click(object sender, EventArgs e)
        {
            cb_QueryView.Enabled = !cb_IsComplex.Checked;
        }

        private void F_AddUpdDel_Load(object sender, EventArgs e)
        {
            
        }



    }
}
