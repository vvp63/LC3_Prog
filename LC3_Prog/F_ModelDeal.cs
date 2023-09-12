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
    public partial class F_ModelDeal : Form
    {

        Form_Main gOwnerForm;
        int gClientId = 0;


        public F_ModelDeal(Form_Main aFM)
        {
            gOwnerForm = aFM;
            InitializeComponent();
        }

        private void F_ModelDeal_Load(object sender, EventArgs e)
        {
            this.model_ToolsTableAdapter.FillBy_Find(this.lC3_devDataSet.Model_Tools, "");
            this._CL_ClientsTableAdapter.Fill(this.lC3_devDataSet._CL_Clients);
        }


        public void PrepareAndShow(int aClientId)
        {
            gClientId = aClientId;     
            this.Show();
            l_rid.Text = ""; tb_Find.Text = ""; tb_Quantity.Text = "";  tb_Value.Text = "";
            cb_Clients.SelectedValue = gClientId.ToString();
        }


        private void FindTools(object sender, EventArgs e)
        {
            this.model_ToolsTableAdapter.FillBy_Find(this.lC3_devDataSet.Model_Tools, tb_Find.Text);
        }

        private void ValueChanged(object sender, EventArgs e)
        {
            l_rid.Text = Convert.ToString(((ComboBox)sender).SelectedValue);
        }

        private void AddDeal(object sender, EventArgs e)
        {
            if ((cb_Clients.SelectedValue.ToString() == "0") || (l_rid.Text == "")) MessageBox.Show("Не задан клиент или инструмент");
            else
            {
                int vQty = 0;   int.TryParse(tb_Quantity.Text, out vQty);
                float vValue = 0;   float.TryParse(tb_Value.Text, out vValue);
                gOwnerForm.AddFromForm(cb_Clients.SelectedValue.ToString(), l_rid.Text, vQty, vValue);
                this.Hide();
            }

        }



        private void ClosingForm(object sender, FormClosingEventArgs e)
        {
            this.Hide();
            e.Cancel = true;
        }


    }
}
