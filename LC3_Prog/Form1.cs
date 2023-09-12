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

        string gConnStr = "";
        string gLogFileName = ".\\log.txt";
        public SqlConnection gConn = new SqlConnection();
        F_AddUpdDel gFormAUD;
        F_RL_AddDElUpd gFormRLAUD;
        F_Groups gFormGroups;
        F_ClLimitEdit gFClLimitEdit;
        F_CheckResults gFCheckResults;
        F_RepoDeals gFormRepoDeals;
        F_AU_List gFormAUList;
        F_ModelDeal gFormModelDeal;
        F_SL_5Percent gFormSL_5Percent;
        List<ParamForm> gParamFormList = new List<ParamForm>();

        int vRL_ClientId = 0;
        string vRL_Type = "G";
        string vRL_RN = "";
        string vRL_Rid = "";
        string vRL_Echelon = "";
        string vRL_LimitType = "";
        float vRL_LimitValue = 0;

        int gCL_ClientCode = 0;
        int gCL_LimitId = 0;
        int gCL_Idx = -1;
        int gCL_ClientCode_Curr = 0;
        int gCL_LimitId_Curr = 0;
        int gCL_AccessMode = 0;

        bool g_AU_AllowRid = false;


        //
        //      -------         Common components and functions
        //

        public Form_Main(string[] args)
        {
            InitializeComponent();
        }

        //  Logging
        public void TextLog(string aLogStr)
        {
            tbLog.AppendText(aLogStr + "\r\n");
        }

        private void TextLog(string aLogStr, params object[] aParams)
        {
            tbLog.AppendText(string.Format(aLogStr, aParams) + "\r\n");
           
        }

        private void TextLogTest(string aLogStr, params object[] aParams)
        {
            System.IO.File.AppendAllText(gLogFileName,
                    string.Format("{0}  {1}\r\n", DateTime.Now.ToString("dd.MM.yyyy h:mm:ss.ff"), string.Format(aLogStr, aParams)));
        }

        private void Form_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'lC3_devDataSet.FT_View' table. You can move, or remove it, as needed.
            
            // TODO: This line of code loads data into the 'lC3_devDataSet1.FactTable' table. You can move, or remove it, as needed.
            this.lC3_devDataSet.EnforceConstraints = false;

            this.cLlst_SubtypesTableAdapter.Fill(this.lC3_devDataSet.CLlst_Subtypes);
            this.aU_ListWithParamsTableAdapter.Fill(this.lC3_devDataSet.AU_ListWithParams);
            this.factTablesListTableAdapter.Fill(this.lC3_devDataSet.FactTablesList);
            this.factTableTableAdapter.FillBy_Ordered(this.lC3_devDataSet.FactTable);
            this.fT_ViewTableAdapter.FillBy_Ordered(this.lC3_devDataSet.FT_View);
            this._CL_CLTableAdapter.FillBy_Ordered(this.lC3_devDataSet._CL_CL);
            cbCL.SelectedValue = 0;          
            this.rL_TypesTableAdapter.Fill(this.lC3_devDataSet.RL_Types);
             cb_F_RestrictType.SelectedValue = 'N';
            this._CL_ClientsTableAdapter.Fill(this.lC3_devDataSet._CL_Clients);
            cb_F_Client.SelectedValue = 0;
            cbClients.SelectedValue = 0;
            this.cLTableAdapter.Fill(this.lC3_devDataSet.CL);


            gFormAUD = new F_AddUpdDel(this);
            gFormRLAUD = new F_RL_AddDElUpd(this);
            gFormGroups = new F_Groups(this);
            gFClLimitEdit = new F_ClLimitEdit(this);
            gFCheckResults = new F_CheckResults(this);
            gFormRepoDeals = new F_RepoDeals(this);
            gFormAUList = new F_AU_List(this);
            gFormModelDeal = new F_ModelDeal(this);
            gFormSL_5Percent = new F_SL_5Percent(this);

            gConnStr = LC3_Prog.Properties.Settings.Default.LC3_devConnectionString;
            gConn.ConnectionString = gConnStr;
            gConn.Open();
            TextLog("Connection status " + gConn.State.ToString());

            if (gConn.State == ConnectionState.Open)
            {
                SqlCommand vSqlCommand = new SqlCommand("exec GetUserAcess", gConn);
                SqlDataReader vReader = vSqlCommand.ExecuteReader();
                while (vReader.Read()) gCL_AccessMode = Convert.ToInt32(vReader[0]);
                vReader.Close();
            }

            TextLog("Acess mode {0}");
            if (gCL_AccessMode < 128)
            {
                OnlyToView();
                if ((gCL_AccessMode & 64) > 0) ShowTrader();
                if ((gCL_AccessMode & 32) > 0) ShowAU();
            }

            ParamFormsLoad();
            if ((gCL_AccessMode > 127)||((gCL_AccessMode & 64) > 0)) ShowClLimits();

            //PortfolioSettingsLoad();
            SL_ButtonSize();
        }


        private void SL_ButtonSize()
        {
            bool vHasUnreaded = false;
            if (gConn.State == ConnectionState.Open)
            {
                SqlCommand vSqlCommand = new SqlCommand("exec SL_GetUnreaded", gConn);
                SqlDataReader vReader = vSqlCommand.ExecuteReader();
                while (vReader.Read()) vHasUnreaded = true;
                vReader.Close();
            }
            if (vHasUnreaded)
            {
                btSL5Perc.Width = 42;
                btSL5Perc.Height = 42;
                btSL5Perc.BackColor = Color.Red;
            } else
            {
                btSL5Perc.Width = 36;
                btSL5Perc.Height = 36;
                btSL5Perc.BackColor = Color.White;
            }
        }


        private void OnlyToView()
         {
                tp_LimitSettings.Parent = null;
                tp_groups.Parent = null;
                tp_Restrictions.Parent = null;
                tp_Portfolio.Parent = null;
                tp_RL.Parent = null;
                tp_AUList.Parent = null;
                tp_Ierarchy.Parent = null;
        }

        private void ShowTrader()
        {
            tp_Restrictions.Parent = tc_Main;
            tp_Portfolio.Parent = tc_Main;
            tp_RL.Parent = tc_Main;
            tp_groups.Parent = tc_Main;
            tp_Ierarchy.Parent = tc_Main;

            bt_ClLimit_edit.Enabled = false;
            dgv_ClLimits.ReadOnly = true;
            bt_RL_Add.Enabled = false;
            bt_RL_Edit.Enabled = false;
            bt_RL_Del.Enabled = false;
            dgv_Restr.ReadOnly = true;

            //  Вкладка группы
            b_add.Enabled = false;
            b_edit.Enabled = false;
            b_delete.Enabled = false;
            b_AddToGroup.Enabled = false;
            b_AddSub.Enabled = false;
            tb_ContrFind.Enabled = false;
            dgv_GroupContent.Columns[2].Visible = false;
            dgv_SubGroups.Columns[3].Visible = false;

        }

        private void ShowAU()
        {
            tp_AUList.Parent = tc_Main;
        }


        private void ParamFormsLoad()
        {
            if (gConn.State == ConnectionState.Open)
            {
                SqlCommand vSqlCommand = new SqlCommand("exec CL_SelectParams", gConn);
                SqlDataReader vReader = vSqlCommand.ExecuteReader();
                int vYtop = 38;
                gParamFormList.Clear();
                while (vReader.Read())
                {
                    int vParamId = Convert.ToInt32(vReader[0]);
                    ParamForm vPF = new ParamForm(this.pParams, vParamId, vReader[2].ToString(), vReader[1].ToString(), vReader[3].ToString(), 10, vYtop);
                    gParamFormList.Add(vPF);
                    vYtop += 21;
                }
                bSaveCond.Top = vYtop + 10;
                bSaveCond.Enabled = false;
                vReader.Close();
                foreach (ParamForm vP in gParamFormList)
                {
                    vP.FillChCmb(gConn);
                    vP.SetUnActive();
                }
            }
        }

        private void Form_Closing(object sender, FormClosingEventArgs e)
        {
            g_AU_AllowRid = false;
            //PortfolioSettingsSaving();
        }



        //      ClientsLimits - Main page

        private void CancelCurrValues()
        {
            gCL_Idx = -1;
            gCL_ClientCode_Curr = 0;
            gCL_LimitId_Curr = 0;
        }


        private void FilterCL(object sender, EventArgs e)
        {
            ShowClLimits();
            if (gCL_ClientCode > 0) cb_Model.Enabled = true;
            else
            {
                cb_Model.Checked = false;
                cb_Model.Enabled = false;
            }
        }

        private void ClientLimits_Enter(object sender, EventArgs e)
        {
            CancelCurrValues();
            this._CL_CLTableAdapter.FillBy_Ordered(this.lC3_devDataSet._CL_CL);
            this._CL_ClientsTableAdapter.Fill(this.lC3_devDataSet._CL_Clients);
        }

        private void ShowClLimits()
        {
            CancelCurrValues();
            int.TryParse(cbCL.SelectedValue.ToString(), out gCL_LimitId);
            int.TryParse(cbClients.SelectedValue.ToString(), out gCL_ClientCode);
            ShowFilteredCL(gCL_ClientCode, gCL_LimitId, cb_OnlyActive.Checked);
        }

        private void ShowFilteredCL(int aClientid, int aLimitId, bool aOnlyActive)
        {
            if (aClientid != 0)
            {
                if (aLimitId != 0)
                {
                    this._CL_ClientLimitsTableAdapter.FillBy_CL(this.lC3_devDataSet._CL_ClientLimits, aClientid, aLimitId);
                }
                else
                {
                    this._CL_ClientLimitsTableAdapter.FillBy_Client(this.lC3_devDataSet._CL_ClientLimits, aClientid, aOnlyActive);
                }
            }
            else
            {
                if (aLimitId != 0)
                {
                    this._CL_ClientLimitsTableAdapter.FillBy_Limit(this.lC3_devDataSet._CL_ClientLimits, aLimitId, aOnlyActive);
                }
                else
                {
                   this._CL_ClientLimitsTableAdapter.Fill(this.lC3_devDataSet._CL_ClientLimits, aOnlyActive);
                }
            }
        }

        private void SetActive_(int aIdx)
        {
            gCL_Idx = aIdx;
            int.TryParse(dgv_ClLimits.Rows[gCL_Idx].Cells[1].Value.ToString(), out gCL_LimitId_Curr);
            int.TryParse(dgv_ClLimits.Rows[gCL_Idx].Cells[3].Value.ToString(), out gCL_ClientCode_Curr);
        }

        private void SetActive_CL(object sender, DataGridViewCellEventArgs e)
        {
            SetActive_(e.RowIndex);
        }

        private void bt_ClLimit_edit_Click(object sender, EventArgs e)
        {
            bt_ClLimit_edit_();
        }

        private void bt_ClLimit_edit_()
        {
            if (gCL_Idx >= 0)
            {
                gFClLimitEdit.Prepare(gCL_ClientCode_Curr, gCL_LimitId_Curr, dgv_ClLimits.Rows[gCL_Idx].Cells[2].Value.ToString(),
                    dgv_ClLimits.Rows[gCL_Idx].Cells[4].Value.ToString(), (bool)dgv_ClLimits.Rows[gCL_Idx].Cells[5].EditedFormattedValue,
                    dgv_ClLimits.Rows[gCL_Idx].Cells[9].Value.ToString(), dgv_ClLimits.Rows[gCL_Idx].Cells[6].Value.ToString(),
                    dgv_ClLimits.Rows[gCL_Idx].Cells[8].Value.ToString(), dgv_ClLimits.Rows[gCL_Idx].Cells[7].Value.ToString()
                    ); 
                gFClLimitEdit.Show();
            }
        }

        public void SaveNewClLimits(int aClientCode, int aLimitId, bool aIsActive, string aMax, string aMin, string aUpper, string aLower)
        {
            if (gConn.State == ConnectionState.Open)
            {
                float aOutVal   =   0;
                SqlCommand vSqlCommand = new SqlCommand(string.Format("exec CL_AddUpdateCL {0}, {1}, {2}, {3}, {4}, {5}, {6}",
                            aLimitId, aClientCode, (aIsActive ? 1 : 0),
                            (float.TryParse(aMin, out aOutVal) ? aOutVal : 0).ToString().Replace(',', '.'), (float.TryParse(aMax, out aOutVal) ? aOutVal : 0).ToString().Replace(',', '.'),
                            (float.TryParse(aLower, out aOutVal) ? aOutVal.ToString().Replace(',', '.') : "NULL"), (float.TryParse(aUpper, out aOutVal) ? aOutVal.ToString().Replace(',', '.') : "NULL")),
                                gConn);
                vSqlCommand.ExecuteNonQuery();        
                ShowClLimits();
            }
        }

        private void ClickCheckLimit(object sender, EventArgs e)
        {
            CheckSingleLimit();
        }

        private void EnterAndCheck(object sender, DataGridViewCellEventArgs e)
        {
            SetActive_(e.RowIndex);
            if (e.ColumnIndex > 9) CheckSingleLimit();

        }

        private void CheckSingleLimit()
        {
            if (gCL_Idx >= 0)
            {
                gFCheckResults.ClearForm();
                CheckLimit(gCL_LimitId_Curr, gCL_ClientCode_Curr, cb_Model.Checked,
                    dgv_ClLimits.Rows[gCL_Idx].Cells[4].Value.ToString() + "   Клиент: " + dgv_ClLimits.Rows[gCL_Idx].Cells[2].Value.ToString(), gCL_Idx, true);
                OpenLimitByInstrument(gCL_LimitId_Curr, gCL_ClientCode_Curr, cb_Model.Checked, "Список бумаг, попадающих под условие нарушения", gCL_Idx);

                gFCheckResults.Show();
                gFCheckResults.BringToFront();
            }
        }

        private void ClickCheckAll(object sender, EventArgs e)
        {
            if (dgv_ClLimits.RowCount > 0)
            {
                gFCheckResults.ClearForm();
                bool vToShow = false;
                for (int i = 0; i < Math.Min(dgv_ClLimits.RowCount, 2000); i++)
                {
                    if ((bool)dgv_ClLimits.Rows[i].Cells[5].EditedFormattedValue)
                    {
                        int vLimitId = 0; int vClientCode = 0;
                        int.TryParse(dgv_ClLimits.Rows[i].Cells[1].Value.ToString(), out vLimitId);
                        int.TryParse(dgv_ClLimits.Rows[i].Cells[3].Value.ToString(), out vClientCode);
                        if ((vLimitId > 0) && (vClientCode > 0))
                        {
                            TextLog("Checking limit {0} {1} {2} {3}", i, DateTime.Now, vLimitId, vClientCode);
                            if (CheckLimit(vLimitId, vClientCode, cb_Model.Checked,
                                        dgv_ClLimits.Rows[i].Cells[4].Value.ToString() + "   Клиент: " + dgv_ClLimits.Rows[i].Cells[2].Value.ToString(), i))
                                vToShow = true;
                        }
                    }
                }
                if (vToShow)
                {
                    gFCheckResults.Show();
                    gFCheckResults.BringToFront();
                }
            }
        }

        public struct sReaderHead
        {
            public int Num;
            public string Name;
            public bool IsString;
        }

        public struct sReaderRow
        {
            public int Num;
            public List<string> Values;
        }

        private bool CheckLimit(int aLimitId, int aClientCode, bool aIsModel, string aLimitText, int aDGVidx, bool aSingle = false)
        {
            int vResult = 0;
            int vFailLevelNum = -1;
            int vLimitValueNum = -1;
            float vLimitValue = 0;

            //  Делаем данные для DataGridView 

            List<sReaderHead> vHead = new List<sReaderHead>();
            List<sReaderRow> vRows = new List<sReaderRow>();

            if (gConn.State == ConnectionState.Open)
            {

                SqlCommand vSqlCommand = new SqlCommand((aLimitId > 0 ? 
                    (aIsModel ? String.Format("exec CheckLimitOnTable 'My_Model_FT', {0}, {1}", aLimitId, aClientCode) : String.Format("exec CheckLimit {0}, {1}", aLimitId, aClientCode)) 
                    : "exec CheckWarning"), gConn);
                SqlDataReader vReader = vSqlCommand.ExecuteReader();

                System.Data.DataTable vST = vReader.GetSchemaTable();
                int vColNum = vST.Rows.Count;
                

                for (int i = 0; i < vColNum; i++)
                {
                    sReaderHead vRH = new sReaderHead();
                    vRH.Num = i;
                    foreach (DataColumn vC in vST.Columns)
                    {
                        if (vC.ColumnName == "ColumnName") vRH.Name = (vST.Rows[i])[vC].ToString();
                        if (vC.ColumnName == "DataType") vRH.IsString = ((vST.Rows[i])[vC].ToString() == "System.String" ? true : false);
                        if (vRH.Name == "FailLevel") vFailLevelNum = i;
                        if (vRH.Name == "LimitValue") vLimitValueNum = i;
                    }
                    vHead.Add(vRH);
                }

                int vRowCount = 0;
                while (vReader.Read())
                {
                    sReaderRow vCurrRow;
                    vCurrRow.Num = vRowCount++;
                    vCurrRow.Values = new List<string>();
                    int vFL = 0;
                    float vLV = 0;
                    for (int i = 0; i < vColNum; i++)
                    {
                        vCurrRow.Values.Add(vReader[i].ToString());
                        if (i == vFailLevelNum)
                        {
                            int.TryParse(vReader[i].ToString(), out vFL); vResult = Math.Max(vResult, vFL);
                        }
                        if (i == vLimitValueNum)
                        {
                            float.TryParse(vReader[i].ToString(), out vLV); vLimitValue = Math.Max(vLimitValue, vLV);
                        }
                    }
                    if (aSingle || (vFL > 0) ) vRows.Add(vCurrRow);
                }
                vReader.Close();               
            }
            //  Добавляем Label

            if ((aSingle) || (vResult > 0)) {
                gFCheckResults.AddLabel(aLimitText, aLimitId.ToString() + "_" + aClientCode.ToString());
                gFCheckResults.AddDGV(vHead, vRows, aLimitId.ToString() + "_" + aClientCode.ToString());
            }
            if (aDGVidx >= 0) ResultInList(vResult, vLimitValue, aDGVidx);
            return (vResult > 0);
        }

        private void OpenLimitByInstrument(int aLimitId, int aClientCode, bool aIsModel, string aLimitText, int aDGVidx)
        {

            List<sReaderHead> vHead = new List<sReaderHead>();
            List<sReaderRow> vRows = new List<sReaderRow>();

            if (gConn.State == ConnectionState.Open)
            {

                SqlCommand vSqlCommand = new SqlCommand(String.Format("exec OpenLimitByInstruments {0}, {1}, {2}", aLimitId, aClientCode, (aIsModel ? 1 : 0)), gConn);
                SqlDataReader vReader = vSqlCommand.ExecuteReader();

                System.Data.DataTable vST = vReader.GetSchemaTable();
                int vColNum = vST.Rows.Count;


                for (int i = 0; i < vColNum; i++)
                {
                    sReaderHead vRH = new sReaderHead();
                    vRH.Num = i;
                    foreach (DataColumn vC in vST.Columns)
                    {
                        if (vC.ColumnName == "ColumnName") vRH.Name = (vST.Rows[i])[vC].ToString();
                        if (vC.ColumnName == "DataType") vRH.IsString = ((vST.Rows[i])[vC].ToString() == "System.String" ? true : false);
                    }
                    vHead.Add(vRH);
                }

                int vRowCount = 0;
                while (vReader.Read())
                {
                    sReaderRow vCurrRow;
                    vCurrRow.Num = vRowCount++;
                    vCurrRow.Values = new List<string>();
                    for (int i = 0; i < vColNum; i++) vCurrRow.Values.Add(vReader[i].ToString());
                    vRows.Add(vCurrRow);
                }
                vReader.Close();
            }
            //  Добавляем Label
            gFCheckResults.AddLabel(aLimitText, aLimitId.ToString() + "_" + aClientCode.ToString() + "_");
            gFCheckResults.AddDGV(vHead, vRows, aLimitId.ToString() + "_" + aClientCode.ToString() + "_");
        }

        private void ResultInList(int aResult, float aLimitValue, int aDGVidx)
        {
            Color vClr = Color.FromArgb(0x40, 0xCF, 0x40); string vTxt = "OK";
            if ((aResult > 0) && (aResult < 10)) { vClr = Color.FromArgb(0xC0, 0xC0, 0x40); vTxt = "!"; }
            if (aResult > 10) { vClr = Color.FromArgb(0xCF, 0x40, 0x40); vTxt = "X"; }
            dgv_ClLimits.Rows[aDGVidx].Cells[11].Style.BackColor = vClr;
            dgv_ClLimits.Rows[aDGVidx].Cells[11].Value = vTxt;
            dgv_ClLimits.Rows[aDGVidx].Cells[10].Style.BackColor = vClr;
            dgv_ClLimits.Rows[aDGVidx].Cells[10].Value =    String.Format("{0:G4}", aLimitValue);
        }


        //      ONLINE-редактирование таблиц

        private void CLValueEdited(object sender, DataGridViewCellEventArgs e)
        {

            int vRI = e.RowIndex; int vCI = e.ColumnIndex;
            int vClCode = 0; int.TryParse(dgv_ClLimits.Rows[vRI].Cells[3].Value.ToString(), out vClCode);
            int vLimitId = 0; int.TryParse(dgv_ClLimits.Rows[vRI].Cells[1].Value.ToString(), out vLimitId);
            SaveNewClLimits(vClCode, vLimitId, (bool)dgv_ClLimits.Rows[vRI].Cells[5].Value,
                            dgv_ClLimits.Rows[vRI].Cells[9].Value.ToString(), dgv_ClLimits.Rows[vRI].Cells[6].Value.ToString(),
                            dgv_ClLimits.Rows[vRI].Cells[8].Value.ToString(), dgv_ClLimits.Rows[vRI].Cells[7].Value.ToString());
            if ((dgv_ClLimits.RowCount > 0) && (dgv_ClLimits.CurrentCell.RowIndex != vRI))
                dgv_ClLimits.CurrentCell = dgv_ClLimits[vCI, dgv_ClLimits.CurrentCell.RowIndex];

        }


        //      Интерфейс аналитического управления
        
        private void AU_FindContr(object sender, KeyEventArgs e)
        {
            g_AU_AllowRid = false;
            this._CL_ContragentsTableAdapter.FillBy_Contr(this.lC3_devDataSet._CL_Contragents, tb_AU_FindContr.Text);
            g_AU_AllowRid = true;
        }

        private void AU_Contr_Changed(object sender, EventArgs e)
        {
            if (g_AU_AllowRid && (cb_AU_contr.SelectedIndex < cb_AU_contr.Items.Count)) l_AU_rid.Text = cb_AU_contr.SelectedValue.ToString();
        }

        private void AU_ListEnter(object sender, DataGridViewCellEventArgs e)
        {
            int vIdx = e.RowIndex;
            l_AU_rid.Text = dgv_AUList.Rows[vIdx].Cells[0].Value.ToString();
            tb_AU_FindContr.Text = dgv_AUList.Rows[vIdx].Cells[1].Value.ToString();
            tb_AU_InnerName.Text = dgv_AUList.Rows[vIdx].Cells[2].Value.ToString();
            cb_AU_SubTypes.SelectedValue = dgv_AUList.Rows[vIdx].Cells[3].Value.ToString();
            tb_AU_Comment.Text = dgv_AUList.Rows[vIdx].Cells[9].Value.ToString();

            //  Удаление

            if ((vIdx > 0) &&  (e.ColumnIndex == 10) && (MessageBox.Show(string.Format("Удалить строку {0} ({1})?",
                    dgv_AUList.Rows[vIdx].Cells[1].Value.ToString(), dgv_AUList.Rows[vIdx].Cells[3].Value.ToString()),
                    "Подтверждение удаления", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes))
            {
                string vSQLQuery = string.Format("exec AU_Delete '{0}', '{1}'",
                            dgv_AUList.Rows[vIdx].Cells[0].Value.ToString(), dgv_AUList.Rows[vIdx].Cells[3].Value.ToString());
                SqlCommand vSQLComm = new SqlCommand(vSQLQuery, gConn);
                vSQLComm.ExecuteNonQuery();
                this.aU_ListWithParamsTableAdapter.Fill(this.lC3_devDataSet.AU_ListWithParams);
            }
        }

        private void AU_AddUpdateList(object sender, EventArgs e)
        {
            if (gConn.State == ConnectionState.Open)
            {
                string vSQLQuery = string.Format("exec AU_AddUpdate '{0}', '{1}', '{2}', '{3}'",
                            l_AU_rid.Text, cb_AU_SubTypes.SelectedValue.ToString(), tb_AU_Comment.Text.Replace("'", ""), tb_AU_InnerName.Text.Replace("'", ""));
                SqlCommand vSqlCommand = new SqlCommand(vSQLQuery, gConn);
                vSqlCommand.ExecuteNonQuery();
                this.aU_ListWithParamsTableAdapter.Fill(this.lC3_devDataSet.AU_ListWithParams);
            }
        }

        private void AU_FormList(object sender, EventArgs e)
        {
            gFormAUList.Show();
        }




        //  Процедуры, относящиеся к проверке листа акций (5% барьер)


        private void ClickShowSL(object sender, EventArgs e)
        {
            gFormSL_5Percent.PrepareForm();
            gFormSL_5Percent.Show();
        }

        private void b_P_Click(object sender, EventArgs e)
        {
            factTableTableAdapter.Fill(this.lC3_devDataSet.FactTable);
        }


    }
}
