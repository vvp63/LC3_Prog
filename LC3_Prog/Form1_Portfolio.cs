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

        //      PORTFOLIO

        private void Click_Reload_Portf(object sender, EventArgs e)
        {

            if (gConn.State == ConnectionState.Open)
            {
                TextLog("Portfolio refresh started...");
                SqlCommand vSqlCommand = new SqlCommand("exec Caching_ALL", gConn);
                vSqlCommand.CommandTimeout = 300;
                vSqlCommand.ExecuteNonQuery();
                TextLog("Portfolio refresh finished");
            }

            gFCheckResults.ClearForm();
            CheckLimit(-1, -1, false, "Предупреждения по портфелю", -1, true);
            gFCheckResults.Show();
            gFCheckResults.BringToFront();

        }

        private void PortfolioOfClient(object sender, EventArgs e)
        {
            SelectedPortf();
        }

        private void SelectedPortf()
        {
            int vClientCode = 0;
            int.TryParse(cb_PortfClient.SelectedValue.ToString(), out vClientCode);

            if (vClientCode == 0)
            {
                switch (cb_FTTypes.SelectedValue.ToString())
                {
                    case "2": this.fT_ViewTableAdapter.FillBy_NoRepo(this.lC3_devDataSet.FT_View); break;
                    case "3": this.fT_ViewTableAdapter.FillBy_Model(this.lC3_devDataSet.FT_View); break;
                    default: this.fT_ViewTableAdapter.FillBy_Ordered(this.lC3_devDataSet.FT_View); break;

                }
            }
            else
            {

                switch (cb_FTTypes.SelectedValue.ToString())
                {
                    case "2": this.fT_ViewTableAdapter.FillBy_ClientNoRepo(this.lC3_devDataSet.FT_View, vClientCode); break;
                    case "3": this.fT_ViewTableAdapter.FillBy_ClientModel(this.lC3_devDataSet.FT_View, vClientCode); break;
                    default: this.fT_ViewTableAdapter.FillBy_Client(this.lC3_devDataSet.FT_View, vClientCode); break;
                }
            }

            if (cb_FTTypes.SelectedValue.ToString() == "3")  bt_Model_Deal.Enabled = true; else bt_Model_Deal.Enabled = false;
        }




        private void b_ShowRepo_Click(object sender, EventArgs e)
        {
            gFormRepoDeals.ShowRepoDeals();
            gFormRepoDeals.Show();
        }

        private void PortfolioToModel(object sender, EventArgs e)
        {
            //
            if (gConn.State == ConnectionState.Open)
            {
                SqlCommand vSqlCommand = new SqlCommand("exec Model_CopyFromFT", gConn);
                //vSqlCommand.CommandTimeout = 300;
                vSqlCommand.ExecuteNonQuery();
                TextLog("Model portfolio copied");
                PortfolioOfClient(sender, e);
            }
        }

        private void AddModelDeal(object sender, EventArgs e)
        {
            int vClientId = 0;
            int.TryParse(cb_PortfClient.SelectedValue.ToString(), out vClientId);
            gFormModelDeal.PrepareAndShow(vClientId);
        }

        public void AddFromForm(string aClientCode, string aRid, int aQty, float aMarket)
        {
            if (gConn.State == ConnectionState.Open)
            {
                var sql = string.Format("exec Model_AddDeal {0}, '{1}', {2}, {3:F0}", aClientCode, aRid, aQty, aMarket);
                SqlCommand vComm = new SqlCommand(sql, gConn);
                vComm.ExecuteNonQuery();
                TextLog(vComm.CommandText);
                SelectedPortf();
            }

        }

       /*
        private void PortfolioSettingsSaving()
        {
            //  Сохраняем настройки таблицы портфеля
            string vPortfState = "";
            for (int i = 0; i < dgv_Portf.ColumnCount; i++)
            {
                vPortfState = vPortfState + string.Format("{0};{1};{2};{3}%",
                        dgv_Portf.Columns[i].Index, dgv_Portf.Columns[i].DisplayIndex, dgv_Portf.Columns[i].Width, dgv_Portf.Columns[i].Visible);
            }
            LC3_Prog.Properties.Settings.Default.PortfolioState = vPortfState;
            LC3_Prog.Properties.Settings.Default.Save();
        }

        private void PortfolioSettingsLoad()
        {
           // TextLog("Load state {0}", LC3_Prog.Properties.Settings.Default.PortfolioState);
            string[] vSettArr = LC3_Prog.Properties.Settings.Default.PortfolioState.Split('%');
            if (vSettArr.Length > 1)
            {
                for (int i = 0; i < Math.Min(vSettArr.Length, dgv_Portf.ColumnCount); i++) {
                   // TextLog("Load state {0}", vSettArr[i]);
                    string[] vColSett = vSettArr[i].Split(';');
                    if (vColSett.Length >= 3) {
                        int vIdx = -1;  int.TryParse(vColSett[0], out vIdx);
                        int vDispIdx = -1; int.TryParse(vColSett[1], out vDispIdx);
                        int vWidth = -1; int.TryParse(vColSett[2], out vWidth);
                        bool vVisible = (vColSett[3]    ==  "True"  ?   true    :   false);
                        if (vIdx >= 0)
                        {
                            dgv_Portf.Columns[vIdx].DisplayIndex = vDispIdx;
                            dgv_Portf.Columns[vIdx].Width   = vWidth;
                            dgv_Portf.Columns[vIdx].Visible = vVisible;
                        }
                    }
                }
            }

            ToolStripMenuItem[] vTSI = new ToolStripMenuItem[dgv_Portf.ColumnCount];

            for (int i = 0; i < dgv_Portf.ColumnCount; i++)
            {
                vTSI[i] = new ToolStripMenuItem();
                vTSI[i].CheckOnClick = true;
                vTSI[i].Text = dgv_Portf.Columns[i].HeaderText;
                vTSI[i].Checked = dgv_Portf.Columns[i].Visible;
                vTSI[i].CheckStateChanged += cms_Portf_Checked;
                cms_Portf.Items.Add(vTSI[i]);
            }
        }

        private void cms_Portf_Checked(object sender, EventArgs e)
        {
            for (int i = 0; i < cms_Portf.Items.Count; i++)
                if (i < dgv_Portf.ColumnCount) dgv_Portf.Columns[i].Visible = ((ToolStripMenuItem)cms_Portf.Items[i]).Checked;
        }
        */


        struct IerarchyLine
        {
            public char Type;  //  G, E, I
            public string rid;
            public string Name;
            public string CurrValue;
            public string Limit;
        }

        List<IerarchyLine> vILines = new List<IerarchyLine>();

        private void Draw_Ierarchy(object sender, EventArgs e)
        {
            dgv_Ierarchy.RowCount = 0; vILines.Clear();
            if (cb_IerarchyClient.SelectedIndex > 0)
            {                       
                if (gConn.State == ConnectionState.Open)
                {
                    string vClid = cb_IerarchyClient.SelectedValue.ToString();
                    TextLog("Ierarchy for client {0}", vClid);
                    IerarchyReadGroups(vClid);
                    IerarchyReadClients(vClid);
                    IerarchyShow();
                }
            }
        }

        private void IerarchyReadGroups(string aClientId)
        {
            if (gConn.State == ConnectionState.Open)
            {
                string vComm = string.Format("SELECT rid, GroupName, LimitValue, SUM([Percent]) FROM Group_Ierarchy WHERE ClientId = {0} GROUP BY rid, GroupName, LimitValue ORDER BY GroupName",
                                                aClientId);
                SqlCommand vSqlCommand = new SqlCommand(vComm, gConn);
                SqlDataReader vReader = vSqlCommand.ExecuteReader();
                while (vReader.Read())
                {
                    IerarchyLine vCurrLine = new IerarchyLine();
                    vCurrLine.Type = 'G';
                    vCurrLine.rid = vReader[0].ToString();
                    vCurrLine.Name = vReader[1].ToString();
                    vCurrLine.CurrValue = vReader[3].ToString();
                    vCurrLine.Limit = vReader[2].ToString();
                    vILines.Add(vCurrLine);
                }
                vReader.Close();
            }
        }

        private void IerarchyReadClients(string aClientId)
        {
            if (gConn.State == ConnectionState.Open)
            {
                for (int i = 0; i < vILines.Count; i++)
                {
                    if (vILines[i].Type == 'G')
                    {
                        string vCommEm = string.Format("SELECT contrid, Issuer, '', SUM([Percent]) FROM Group_Ierarchy WHERE ClientId = {0} AND rid = '{1}' GROUP BY contrid, Issuer ORDER BY Issuer",
                                                        aClientId, vILines[i].rid);
                        SqlCommand vSqlCommandEm = new SqlCommand(vCommEm, gConn);
                        SqlDataReader vReaderEm = vSqlCommandEm.ExecuteReader();

                        int vCurrAdd = 0;

                        while (vReaderEm.Read())
                        {
                            IerarchyLine vCurrLine = new IerarchyLine();
                            vCurrLine.Type = 'E';
                            vCurrLine.rid = vReaderEm[0].ToString();
                            vCurrLine.Name = vReaderEm[1].ToString();
                            vCurrLine.CurrValue = vReaderEm[3].ToString();
                            vCurrLine.Limit = vReaderEm[2].ToString();

                            if ((i + 1 + vCurrAdd) < vILines.Count) vILines.Insert(i + 1 + (vCurrAdd++), vCurrLine);
                            else
                            {
                                vILines.Add(vCurrLine);
                                vCurrAdd++;
                            }
                        }
                        vReaderEm.Close();
                    }
                }
            }
        }

        private void IerarchyShow()
        {
            dgv_Ierarchy.RowCount = vILines.Count;
            for (int i = 0; i < vILines.Count; i++)
            {
                float vCuuVal = 0; float.TryParse(vILines[i].CurrValue, out vCuuVal);
                float vLimitVal = 0; float.TryParse(vILines[i].Limit, out vLimitVal);
                int vFL = (vCuuVal > vLimitVal) ? 2  :   ((vCuuVal > 0.8 * vLimitVal) ? 1 : 0);

                if (vILines[i].Type == 'G')
                {
                    dgv_Ierarchy.Rows[i].DefaultCellStyle.BackColor = 
                                (vFL == 2) ? Color.FromArgb(0xFF, 0x90, 0x90) : ( (vFL == 1) ? Color.FromArgb(0xD0, 0xD0, 0x60) : Color.FromArgb(0x90, 0xFF, 0x90));
                    dgv_Ierarchy.Rows[i].Cells[0].Value = vILines[i].Name;
                    dgv_Ierarchy.Rows[i].Cells[1].Value = string.Format("{0:G4}", vCuuVal);
                }
                if (vILines[i].Type == 'E')
                {
                    dgv_Ierarchy.Rows[i].DefaultCellStyle.BackColor = Color.FromArgb(0xC0, 0xFF, 0xC0);
                    dgv_Ierarchy.Rows[i].Cells[0].Value = "        " + vILines[i].Name;
                    dgv_Ierarchy.Rows[i].Cells[1].Value = "    " + string.Format("{0:G4}", vCuuVal);
                }
                dgv_Ierarchy.Rows[i].Cells[2].Value = vILines[i].Limit;
            }
        }


    }

}
