using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
//using System.Data.SqlClient;
//using System.Data;
using System.IO;
using Microsoft.Office.Interop.Excel;


namespace LC3_Prog
{
    public partial class F_AU_List : Form
    {

        Form_Main gOwnerForm;

        private void TextLog(string aLogStr, params object[] aParams)
        {
            tb_Log.AppendText(string.Format(aLogStr, aParams) + "\r\n");
        }

        public F_AU_List(Form_Main aFM)
        {
            gOwnerForm = aFM;
            InitializeComponent();
        }

        private void Cancel(object sender, EventArgs e)
        {
            //
            this.Hide();
        }

        private void F_AU_List_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'lC3_devDataSet1.AU_ListStocks' table. You can move, or remove it, as needed.
            // this.aU_ListStocksTableAdapter.Fill(this.lC3_devDataSet1.AU_ListStocks);
            //this.aU_ListBondsTableAdapter.Fill(this.lC3_devDataSet.AU_ListBonds);
            l_Sheet.Text = String.Format("{0} || {1} || {2} || {3}",
                LC3_Prog.Properties.Settings.Default.AUSheet, LC3_Prog.Properties.Settings.Default.AUTemplate,
                LC3_Prog.Properties.Settings.Default.AUBonds, LC3_Prog.Properties.Settings.Default.AUStocks);
        }

        private void FillGrids(object sender, EventArgs e)
        {
            this.aU_ListBondsTableAdapter.FillBy_Ord(this.lC3_devDataSet.AU_ListBonds);
            this.aU_ListStocksTableAdapter.FillBy_Ordered(this.lC3_devDataSet1.AU_ListStocks);
        }


        private void Export(object sender, EventArgs e)
        {
            if (OFD.ShowDialog()    ==  DialogResult.OK)
            {
                string vFileName = OFD.FileName;
                Microsoft.Office.Interop.Excel.Application vExcelApp = new Microsoft.Office.Interop.Excel.Application();
                Microsoft.Office.Interop.Excel._Workbook vEWB;
                Microsoft.Office.Interop.Excel.Worksheet vEWS;
                Microsoft.Office.Interop.Excel.Range vER;

                string vSheetName = LC3_Prog.Properties.Settings.Default.AUSheet; //"Общий лист";
                string[] vExTempl = LC3_Prog.Properties.Settings.Default.AUTemplate.Split(';');
                int vBondBegin = LC3_Prog.Properties.Settings.Default.AUBonds;
                int vStockBegin = LC3_Prog.Properties.Settings.Default.AUStocks;

               // for (int i = 0; i < vExTempl.Length; i++) TextLog("{0} {1}", i, vExTempl[i]);


                try {
                    TextLog("Opening Excel {0}", vFileName);
                    vEWB = vExcelApp.Workbooks.Open(vFileName, 0, false, 5, "", "", true, Microsoft.Office.Interop.Excel.XlPlatform.xlWindows, "\t", true,
    false, 0, true, 1, 0);
                    int vIdx = 0;
                    for (int i = 1; i <= vEWB.Worksheets.Count; i++)
                        if (((Microsoft.Office.Interop.Excel.Worksheet)vEWB.Worksheets.get_Item(i)).Name == vSheetName) vIdx = i;
                    if (vIdx > 0) {
                        TextLog("Sheet {0} found. Idx = {1}", vSheetName, vIdx);
                        vEWS = (Microsoft.Office.Interop.Excel.Worksheet)vEWB.Worksheets.get_Item(vIdx);  
                        
                        for (int y = 0; y < dgv_AU_Bonds.RowCount; y++)
                        {
                            TextLog("Writing bond line {0}", y + 1);
                            for (int x = 0; x < Math.Min(dgv_AU_Bonds.ColumnCount, vExTempl.Length); x++)
                            {
                                vER = vEWS.get_Range(String.Format("{0}{1}", vExTempl[x], vBondBegin + y), Type.Missing);
                                vER.Value2 = dgv_AU_Bonds.Rows[y].Cells[x].Value.ToString();
                            }
                        }

                        for (int y = 0; y < dgv_AU_Stocks.RowCount; y++)
                        {
                            TextLog("Writing stock line {0}", y + 1);
                            for (int x = 0; x < Math.Min(dgv_AU_Stocks.ColumnCount, vExTempl.Length); x++)
                            {
                                vER = vEWS.get_Range(String.Format("{0}{1}", vExTempl[x], vStockBegin + y), Type.Missing);
                                vER.Value2 = dgv_AU_Stocks.Rows[y].Cells[x].Value.ToString();
                            }
                        }

                        vEWB.Save();
                        TextLog("Saved {0} bonds and {1} stocks", dgv_AU_Bonds.RowCount, dgv_AU_Stocks.RowCount);

                    } else TextLog("Sheet {0} not found.", vSheetName);

                }
                catch (Exception ex)
                {
                    TextLog("EXCEPTION {0}", ex.ToString());
                }

                vExcelApp.Quit();

            }
        }
    }






}

