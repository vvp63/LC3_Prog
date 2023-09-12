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
    public partial class F_Groups : Form
    {

        int lGroupId    =   0;
        Form_Main gOwnerForm;

        public F_Groups(Form_Main aFM)
        {
            gOwnerForm = aFM;
            InitializeComponent();
        }

        public void PrepareToOpen(string vHeader, int vId, string vName)
        {
            this.Text = vHeader;
            lGroupId = vId;
            tb_name.Text = vName;
        }

        private void b_Cancel_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void b_ok_Click(object sender, EventArgs e)
        {
            gOwnerForm.AddUpdateGroup(lGroupId, tb_name.Text);
            this.Hide();
        }


    }
}
