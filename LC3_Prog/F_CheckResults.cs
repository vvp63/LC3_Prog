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
    public partial class F_CheckResults : Form
    {

        List<Label> fLabels = new List<Label>();
        List<DataGridView> fDGV = new List<DataGridView>();
        int fTop    =   0;
        Form_Main gOwnerForm;

        public F_CheckResults(Form_Main aFM)
        {
            gOwnerForm = aFM;
            InitializeComponent();
        }

        private void F_CheckResults_Load(object sender, EventArgs e)
        {
            //
        }

        public void ClearForm()
        {
            pResults.Controls.Clear(); fLabels.Clear(); fDGV.Clear(); fTop = 0;
        }

        public void AddLabel(string aText, string aId)
        {
            Label vL = new Label();
            vL.Name = "lLimit_" + aId;
            vL.Location = new System.Drawing.Point(10, fTop + 3);
            vL.Size = new System.Drawing.Size(800, 18);
            vL.MaximumSize = new System.Drawing.Size(800, 0);
           // vL.MaximumSize = new System.Drawing.Size(this.Width - 10, 18);
            vL.AutoSize = true;
            vL.Text = aText;
            vL.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular);
            vL.ForeColor = System.Drawing.Color.FromArgb(0, 64, 0);
            fLabels.Add(vL);
            if (fLabels.Count > 0) pResults.Controls.Add(fLabels[fLabels.Count - 1]);
            fTop += 25;         
        }


        public void AddDGV(List<LC3_Prog.Form_Main.sReaderHead> aHeads, List<LC3_Prog.Form_Main.sReaderRow> aRows, string aId)
        {
            DataGridView vDGV = new DataGridView();
            vDGV.Name = "dgv_Result_" + aId;
            vDGV.Location = new System.Drawing.Point(10, fTop + 3);
            vDGV.Size = new System.Drawing.Size(500, 50);
            vDGV.AutoSize = true;
            vDGV.MaximumSize = new System.Drawing.Size(1000, 500);
            vDGV.ColumnCount = aHeads.Count + 1;
            vDGV.DefaultCellStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular);
            vDGV.AllowUserToAddRows = false;
            vDGV.AllowUserToDeleteRows = false;
            int vFLidx = -1;
            for (int i = 0; i < aHeads.Count; i++)
            {
                vDGV.Columns[i].Name = aHeads[i].Name;
                vDGV.Columns[i].MinimumWidth = 40;
                vDGV.Columns[i].Width = 40;
                vDGV.Columns[i].AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                if (aHeads[i].Name == "LimitValue") vDGV.Columns[i].Visible = false;
                if (aHeads[i].Name == "FailLevel")
                {
                    vDGV.Columns[i].Visible = false; vFLidx = i;
                }
            }
            vDGV.Columns[vDGV.ColumnCount - 1].Width = 40; vDGV.Columns[vDGV.ColumnCount - 1].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            vDGV.RowCount = aRows.Count;
            for (int i = 0; i < aRows.Count; i++)
            {
                for (int j = 0; j < aRows[i].Values.Count; j++)
                {
                    vDGV.Rows[i].Cells[j].Value = aRows[i].Values[j];
                    if (j == vFLidx)
                    {
                        int vFL = 0; int.TryParse(aRows[i].Values[j].ToString(), out vFL);
                        Color vClr = Color.FromArgb(0x40, 0xCF, 0x40); string vTxt = "OK";
                        if ((vFL > 0) && (vFL < 10)) { vClr = Color.FromArgb(0xC0, 0xC0, 0x40); vTxt = "!"; }
                        if (vFL > 10) { vClr = Color.FromArgb(0xCF, 0x40, 0x40); vTxt = "X"; }
                        vDGV.Rows[i].Cells[aHeads.Count].Style.BackColor = vClr;
                        vDGV.Rows[i].Cells[aHeads.Count].Value = vTxt;
                    }
                }
            }
            fDGV.Add(vDGV);
            if (fDGV.Count > 0)
            {
                pResults.Controls.Add(fDGV[fDGV.Count - 1]);
                fTop += vDGV.Height + 12;
            }
        }


        private void ClosingForm(object sender, FormClosingEventArgs e)
        {
            this.Hide();
            e.Cancel = true;           
        }




    }
}
