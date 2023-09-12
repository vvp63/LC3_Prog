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
    public partial class F_RepoDeals : Form
    {

        Form_Main gOwnerForm;
        public F_RepoDeals(Form_Main aFM)
        {
            gOwnerForm = aFM;
            InitializeComponent();
    }

        private void F_RepoDeals_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'lC3_devDataSet.REPODeals' table. You can move, or remove it, as needed.
           // this.rEPODealsTableAdapter.Fill(this.lC3_devDataSet.REPODeals);
        }

        public void ShowRepoDeals()
        {
            this.rEPODealsTableAdapter.FillBy_Ordered(this.lC3_devDataSet.REPODeals);
        }


        private void b_Repo_close_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

    }
}
