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
    public partial class F_SL_5Percent : Form
    {

        Form_Main gOwnerForm;
        public F_SL_5Percent(Form_Main aFM)
        {
            gOwnerForm = aFM;
            InitializeComponent();
        }

        private void btClose_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void F_SL_5Percent_Load(object sender, EventArgs e)
        {
            PrepareForm();
        }



        public void PrepareForm()
        {
            FillEvents();
            this.sL_DatesTableAdapter.FillBy_Ordered(this.lC3_devDataSet.SL_Dates);
            cb_Date.SelectedIndex = 0;
            this.sL_DataTableAdapter.FillBy_Date(this.lC3_devDataSet.SL_Data, 1);
        }


        private void FillEvents()
        {
            this.sL_EventsTableAdapter.FillBy_Ordered(this.lC3_devDataSet.SL_Events);
            for (int i = 0; i < dgvEvents.RowCount; i++)
                if (dgvEvents.Rows[i].Cells[6].Value.ToString() != "1") dgvEvents.Rows[i].DefaultCellStyle.BackColor = Color.Red;
            else dgvEvents.Rows[i].DefaultCellStyle.BackColor = Color.White;
        }

        private void DateChanged(object sender, EventArgs e)
        {
            FillByDate();
        }


        private void FillByDate()
        {
            int vDateNum = cb_Date.SelectedIndex + 1;
            this.sL_DataTableAdapter.FillBy_Date(this.lC3_devDataSet.SL_Data, vDateNum);
        }

        private void dgvEvents_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (gOwnerForm.gConn.State == ConnectionState.Open)
            {
                string[] vDatesArr = dgvEvents.Rows[e.RowIndex].Cells[0].Value.ToString().Split('.');
                string vSQLdt = String.Format("{0}.{1}.{2}", vDatesArr[1], vDatesArr[0], vDatesArr[2]);
                SqlCommand vSqlCommand = new SqlCommand(String.Format("exec SL_ReadEvent '{0}', '{1}'", 
                                                            dgvEvents.Rows[e.RowIndex].Cells[2].Value.ToString(), vSQLdt), gOwnerForm.gConn);
                vSqlCommand.ExecuteNonQuery();
            }
            FillEvents();
        }


    }
}
