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
    public partial class F_ClLimitEdit : Form
    {

        Form_Main gOwnerForm;
        int gCurr_LimitId = 0;
        int gCurr_ClientCode = 0;

        public F_ClLimitEdit(Form_Main aFM)
        {
            gOwnerForm = aFM;
            InitializeComponent();
        }




        public void Prepare(int aClientCode, int aLimitId, string aClientName, string aLimitName,
                            bool aIsActive, string aMax, string aMin, string aUpper, string aLower)
        {
            gCurr_ClientCode = aClientCode;
            gCurr_LimitId = aLimitId;
            l_CurrClient.Text = aClientName;
            l_CurrLimit.Text = aLimitName;
            cb_IsActive.Checked = aIsActive;
            tb_MaxValue.Text = aMax;
            tb_MinValue.Text = aMin;
            tb_LowerThreshold.Text = aLower;
            tb_UpperThreshold.Text = aUpper;
        }


        private void bt_Save_Click(object sender, EventArgs e)
        {
            gOwnerForm.SaveNewClLimits(gCurr_ClientCode, gCurr_LimitId, cb_IsActive.Checked, 
                                        tb_MaxValue.Text, tb_MinValue.Text, tb_UpperThreshold.Text, tb_LowerThreshold.Text);
            LeaveForm();
        }


        private void b_Cancel_Click(object sender, EventArgs e)
        {
            LeaveForm();
        }

        public void LeaveForm()
        {
            this.Hide();
            gCurr_LimitId = 0;
            gCurr_ClientCode = 0;
        }



    }
}
