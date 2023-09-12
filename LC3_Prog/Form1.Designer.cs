namespace LC3_Prog
{
    partial class Form_Main
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form_Main));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            this.cLBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.lC3_devDataSet = new LC3_Prog.LC3_devDataSet();
            this.tbLog = new System.Windows.Forms.TextBox();
            this.cLObjectsBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.cLSubGroupBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.cLGroupContentBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.cLContragentsBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.cLGroupsBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.rLTypesBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.cLClientsBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.cLRestrictionsBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.cLTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters.CLTableAdapter();
            this.cL_ObjectsTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters.CL_ObjectsTableAdapter();
            this.cL_GroupsTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters.CL_GroupsTableAdapter();
            this._CL_GroupContentTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters._CL_GroupContentTableAdapter();
            this._CL_ContragentsTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters._CL_ContragentsTableAdapter();
            this.cLGroupsWithSubBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this._CL_SubGroupTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters._CL_SubGroupTableAdapter();
            this._CL_RestrictionsTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters._CL_RestrictionsTableAdapter();
            this._CL_ClientsTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters._CL_ClientsTableAdapter();
            this.rL_TypesTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters.RL_TypesTableAdapter();
            this.tp_RL = new System.Windows.Forms.TabPage();
            this.l_restrict_to = new System.Windows.Forms.Label();
            this.b_Filter = new System.Windows.Forms.Button();
            this.bt_RL_Add = new System.Windows.Forms.Button();
            this.bt_RL_Edit = new System.Windows.Forms.Button();
            this.bt_RL_Del = new System.Windows.Forms.Button();
            this.cb_F_RestrictType = new System.Windows.Forms.ComboBox();
            this.cb_F_Client = new System.Windows.Forms.ComboBox();
            this.l_Filter_cl = new System.Windows.Forms.Label();
            this.dgv_Restr = new System.Windows.Forms.DataGridView();
            this.clientIdDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clientNameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.typeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.restrictTypeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ridDataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.restrictNameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.echelonDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.limitTypeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.limitValueDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.unitsDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tp_groups = new System.Windows.Forms.TabPage();
            this.b_AddSub = new System.Windows.Forms.Button();
            this.t_SubId = new System.Windows.Forms.TextBox();
            this.dgv_SubGroups = new System.Windows.Forms.DataGridView();
            this.parentIdDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.childIdDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.groupNameDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ColumnDelete = new System.Windows.Forms.DataGridViewImageColumn();
            this.dgv_GroupContent = new System.Windows.Forms.DataGridView();
            this.nameDataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ridDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column_Delete = new System.Windows.Forms.DataGridViewImageColumn();
            this.tb_ContrFind = new System.Windows.Forms.TextBox();
            this.dgv_groups = new System.Windows.Forms.DataGridView();
            this.idDataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ridDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.groupNameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.l_AddSub = new System.Windows.Forms.Label();
            this.l_SubGroups = new System.Windows.Forms.Label();
            this.b_AddToGroup = new System.Windows.Forms.Button();
            this.l_contrid = new System.Windows.Forms.Label();
            this.l_SelectedGroup = new System.Windows.Forms.Label();
            this.l_contrFind = new System.Windows.Forms.Label();
            this.cb_GontrFind = new System.Windows.Forms.ComboBox();
            this.b_delete = new System.Windows.Forms.Button();
            this.b_edit = new System.Windows.Forms.Button();
            this.b_add = new System.Windows.Forms.Button();
            this.tp_Portfolio = new System.Windows.Forms.TabPage();
            this.dgv_FTView = new System.Windows.Forms.DataGridView();
            this.fTViewBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.bt_Model_Deal = new System.Windows.Forms.Button();
            this.bt_Portf_Model = new System.Windows.Forms.Button();
            this.b_ShowRepo = new System.Windows.Forms.Button();
            this.cb_FTTypes = new System.Windows.Forms.ComboBox();
            this.factTablesListBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.l_PortfolioType = new System.Windows.Forms.Label();
            this.l_client2 = new System.Windows.Forms.Label();
            this.cb_PortfClient = new System.Windows.Forms.ComboBox();
            this.cLClientsBindingSource3 = new System.Windows.Forms.BindingSource(this.components);
            this.cms_Portf = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.factTableBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.bt_ReloadPortf = new System.Windows.Forms.Button();
            this.tp_Restrictions = new System.Windows.Forms.TabPage();
            this.btSL5Perc = new System.Windows.Forms.Button();
            this.cb_Model = new System.Windows.Forms.CheckBox();
            this.l_client = new System.Windows.Forms.Label();
            this.l_Limit = new System.Windows.Forms.Label();
            this.bCheckAll = new System.Windows.Forms.Button();
            this.bCheck = new System.Windows.Forms.Button();
            this.bt_ClLimit_edit = new System.Windows.Forms.Button();
            this.cb_OnlyActive = new System.Windows.Forms.CheckBox();
            this.dgv_ClLimits = new System.Windows.Forms.DataGridView();
            this.Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.limitIdDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clientNameDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clientCodeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nameDataGridViewTextBoxColumn3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.isActiveDataGridViewCheckBoxColumn = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.minValueDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.lowerWarningDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.upperWarningDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.maxValueDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Current = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.CheckResult = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cLClientLimitsBindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.cbClients = new System.Windows.Forms.ComboBox();
            this.cLClientsBindingSource2 = new System.Windows.Forms.BindingSource(this.components);
            this.cbCL = new System.Windows.Forms.ComboBox();
            this.cLCLBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.cLClientsBindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.cLClientLimitsBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.tp_LimitSettings = new System.Windows.Forms.TabPage();
            this.pCL = new System.Windows.Forms.Panel();
            this.l_NOT_Complex = new System.Windows.Forms.Label();
            this.dg_CL = new System.Windows.Forms.DataGridView();
            this.idDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.conditionDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.GroupByEmit = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.GroupByInstr = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.IsComplex = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.LimitQuery = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.FTId = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.bt_Add = new System.Windows.Forms.Button();
            this.bt_DeleteObj = new System.Windows.Forms.Button();
            this.bt_Edit = new System.Windows.Forms.Button();
            this.bt_EditObj = new System.Windows.Forms.Button();
            this.bt_Delete = new System.Windows.Forms.Button();
            this.bt_AddObj = new System.Windows.Forms.Button();
            this.dg_Objects = new System.Windows.Forms.DataGridView();
            this.idDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nameDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.l_Limit_Head = new System.Windows.Forms.Label();
            this.pParams = new System.Windows.Forms.Panel();
            this.bSaveCond = new System.Windows.Forms.Button();
            this.l_Object_Head = new System.Windows.Forms.Label();
            this.tc_Main = new System.Windows.Forms.TabControl();
            this.tp_Ierarchy = new System.Windows.Forms.TabPage();
            this.dgv_Ierarchy = new System.Windows.Forms.DataGridView();
            this.С2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.C3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.C4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cb_IerarchyClient = new System.Windows.Forms.ComboBox();
            this.l_Client3 = new System.Windows.Forms.Label();
            this.tp_AUList = new System.Windows.Forms.TabPage();
            this.tb_AU_InnerName = new System.Windows.Forms.TextBox();
            this.l_AU_InnerName = new System.Windows.Forms.Label();
            this.b_Form = new System.Windows.Forms.Button();
            this.b_AU_AddUpdate = new System.Windows.Forms.Button();
            this.tb_AU_Comment = new System.Windows.Forms.TextBox();
            this.l_AU_Comment = new System.Windows.Forms.Label();
            this.l_AU_SubType = new System.Windows.Forms.Label();
            this.cb_AU_SubTypes = new System.Windows.Forms.ComboBox();
            this.cLlstSubtypesBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.l_AU_rid = new System.Windows.Forms.Label();
            this.l_Find = new System.Windows.Forms.Label();
            this.tb_AU_FindContr = new System.Windows.Forms.TextBox();
            this.cb_AU_contr = new System.Windows.Forms.ComboBox();
            this.dgv_AUList = new System.Windows.Forms.DataGridView();
            this.contridDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nameDataGridViewTextBoxColumn4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.InnerName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.typeDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ratingDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ownRatingDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ownCommentDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.qsheetDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.inIndexDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.remarkDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column2 = new System.Windows.Forms.DataGridViewImageColumn();
            this.aUListWithParamsBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this._CL_CLTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters._CL_CLTableAdapter();
            this._CL_ClientLimitsTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters._CL_ClientLimitsTableAdapter();
            this.factTableTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters.FactTableTableAdapter();
            this.factTablesListTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters.FactTablesListTableAdapter();
            this.aU_ListWithParamsTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters.AU_ListWithParamsTableAdapter();
            this.cLlst_SubtypesTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters.CLlst_SubtypesTableAdapter();
            this.lC3_devDataSet1 = new LC3_Prog.LC3_devDataSet1();
            this.factTableBindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.fT_ViewTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters.FT_ViewTableAdapter();
            this.clientCodeDataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.instrumentNameDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.issuerDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clientAccountDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.summAssetDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.instrumentDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.quantityDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.marketValueDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.percentDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.instrumentTypeDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.instrumentSubtypeDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.secTypeBrDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.countryDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.quoteSheetDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ownTypeDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.bondsIssueSummDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.quoteSDHDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.quoteSDHAgoDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.volCirculationDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.contridDataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.capitalizationDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.redemptionDateDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.securityIdDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.issueNumDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.announcedVolDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dateStartPlacingDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dateEndPlacingDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.currencyDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cBCodeDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.iDCBSDHDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.stateRegNumDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.monthAvgVolDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.fRatingDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.mRatingDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sPRatingDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.eRatingDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.aRatingDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.contrFRatingDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.contrMRatingDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.contrSPRatingDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.contrERatingDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.contrARatingDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn5 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.enddateDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.isInIndexDataGridViewCheckBoxColumn1 = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.isVariableCouponDataGridViewCheckBoxColumn1 = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.isQuantityGrowsDataGridViewCheckBoxColumn = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.dataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.isbankDataGridViewCheckBoxColumn = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.forqualinvestorsDataGridViewCheckBoxColumn = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.isSubordinatedDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.cLBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.lC3_devDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLObjectsBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLSubGroupBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLGroupContentBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLContragentsBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLGroupsBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.rLTypesBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLClientsBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLRestrictionsBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLGroupsWithSubBindingSource)).BeginInit();
            this.tp_RL.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_Restr)).BeginInit();
            this.tp_groups.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_SubGroups)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_GroupContent)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_groups)).BeginInit();
            this.tp_Portfolio.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_FTView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.fTViewBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.factTablesListBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLClientsBindingSource3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.factTableBindingSource)).BeginInit();
            this.tp_Restrictions.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_ClLimits)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLClientLimitsBindingSource1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLClientsBindingSource2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLCLBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLClientsBindingSource1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLClientLimitsBindingSource)).BeginInit();
            this.tp_LimitSettings.SuspendLayout();
            this.pCL.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dg_CL)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dg_Objects)).BeginInit();
            this.pParams.SuspendLayout();
            this.tc_Main.SuspendLayout();
            this.tp_Ierarchy.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_Ierarchy)).BeginInit();
            this.tp_AUList.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.cLlstSubtypesBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_AUList)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.aUListWithParamsBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.lC3_devDataSet1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.factTableBindingSource1)).BeginInit();
            this.SuspendLayout();
            // 
            // cLBindingSource
            // 
            this.cLBindingSource.DataMember = "CL";
            this.cLBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // lC3_devDataSet
            // 
            this.lC3_devDataSet.DataSetName = "LC3_devDataSet";
            this.lC3_devDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // tbLog
            // 
            this.tbLog.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.tbLog.Location = new System.Drawing.Point(0, 947);
            this.tbLog.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.tbLog.Multiline = true;
            this.tbLog.Name = "tbLog";
            this.tbLog.Size = new System.Drawing.Size(1478, 61);
            this.tbLog.TabIndex = 2;
            // 
            // cLObjectsBindingSource
            // 
            this.cLObjectsBindingSource.DataMember = "CL_Objects";
            this.cLObjectsBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // cLSubGroupBindingSource
            // 
            this.cLSubGroupBindingSource.DataMember = "_CL_SubGroup";
            this.cLSubGroupBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // cLGroupContentBindingSource
            // 
            this.cLGroupContentBindingSource.DataMember = "_CL_GroupContent";
            this.cLGroupContentBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // cLContragentsBindingSource
            // 
            this.cLContragentsBindingSource.DataMember = "_CL_Contragents";
            this.cLContragentsBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // cLGroupsBindingSource
            // 
            this.cLGroupsBindingSource.DataMember = "CL_Groups";
            this.cLGroupsBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // rLTypesBindingSource
            // 
            this.rLTypesBindingSource.DataMember = "RL_Types";
            this.rLTypesBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // cLClientsBindingSource
            // 
            this.cLClientsBindingSource.DataMember = "_CL_Clients";
            this.cLClientsBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // cLRestrictionsBindingSource
            // 
            this.cLRestrictionsBindingSource.DataMember = "_CL_Restrictions";
            this.cLRestrictionsBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // cLTableAdapter
            // 
            this.cLTableAdapter.ClearBeforeFill = true;
            // 
            // cL_ObjectsTableAdapter
            // 
            this.cL_ObjectsTableAdapter.ClearBeforeFill = true;
            // 
            // cL_GroupsTableAdapter
            // 
            this.cL_GroupsTableAdapter.ClearBeforeFill = true;
            // 
            // _CL_GroupContentTableAdapter
            // 
            this._CL_GroupContentTableAdapter.ClearBeforeFill = true;
            // 
            // _CL_ContragentsTableAdapter
            // 
            this._CL_ContragentsTableAdapter.ClearBeforeFill = true;
            // 
            // _CL_SubGroupTableAdapter
            // 
            this._CL_SubGroupTableAdapter.ClearBeforeFill = true;
            // 
            // _CL_RestrictionsTableAdapter
            // 
            this._CL_RestrictionsTableAdapter.ClearBeforeFill = true;
            // 
            // _CL_ClientsTableAdapter
            // 
            this._CL_ClientsTableAdapter.ClearBeforeFill = true;
            // 
            // rL_TypesTableAdapter
            // 
            this.rL_TypesTableAdapter.ClearBeforeFill = true;
            // 
            // tp_RL
            // 
            this.tp_RL.AutoScroll = true;
            this.tp_RL.Controls.Add(this.l_restrict_to);
            this.tp_RL.Controls.Add(this.b_Filter);
            this.tp_RL.Controls.Add(this.bt_RL_Add);
            this.tp_RL.Controls.Add(this.bt_RL_Edit);
            this.tp_RL.Controls.Add(this.bt_RL_Del);
            this.tp_RL.Controls.Add(this.cb_F_RestrictType);
            this.tp_RL.Controls.Add(this.cb_F_Client);
            this.tp_RL.Controls.Add(this.l_Filter_cl);
            this.tp_RL.Controls.Add(this.dgv_Restr);
            this.tp_RL.Location = new System.Drawing.Point(4, 22);
            this.tp_RL.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.tp_RL.Name = "tp_RL";
            this.tp_RL.Padding = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.tp_RL.Size = new System.Drawing.Size(1470, 921);
            this.tp_RL.TabIndex = 4;
            this.tp_RL.Text = "Лимитные ведомости";
            this.tp_RL.UseVisualStyleBackColor = true;
            this.tp_RL.Enter += new System.EventHandler(this.RL_Enter);
            // 
            // l_restrict_to
            // 
            this.l_restrict_to.AutoSize = true;
            this.l_restrict_to.Location = new System.Drawing.Point(500, 15);
            this.l_restrict_to.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.l_restrict_to.Name = "l_restrict_to";
            this.l_restrict_to.Size = new System.Drawing.Size(88, 13);
            this.l_restrict_to.TabIndex = 9;
            this.l_restrict_to.Text = "Ограничение на";
            // 
            // b_Filter
            // 
            this.b_Filter.Location = new System.Drawing.Point(1000, 4);
            this.b_Filter.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.b_Filter.Name = "b_Filter";
            this.b_Filter.Size = new System.Drawing.Size(112, 20);
            this.b_Filter.TabIndex = 8;
            this.b_Filter.Text = "OK";
            this.b_Filter.UseVisualStyleBackColor = true;
            this.b_Filter.Visible = false;
            this.b_Filter.Click += new System.EventHandler(this.b_Filter_Click);
            // 
            // bt_RL_Add
            // 
            this.bt_RL_Add.AccessibleDescription = "";
            this.bt_RL_Add.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("bt_RL_Add.BackgroundImage")));
            this.bt_RL_Add.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.bt_RL_Add.Location = new System.Drawing.Point(10, 40);
            this.bt_RL_Add.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.bt_RL_Add.Name = "bt_RL_Add";
            this.bt_RL_Add.Size = new System.Drawing.Size(36, 36);
            this.bt_RL_Add.TabIndex = 5;
            this.bt_RL_Add.Tag = "Add new Limit";
            this.bt_RL_Add.UseVisualStyleBackColor = true;
            this.bt_RL_Add.Click += new System.EventHandler(this.bt_Add_RL);
            // 
            // bt_RL_Edit
            // 
            this.bt_RL_Edit.AccessibleDescription = "";
            this.bt_RL_Edit.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("bt_RL_Edit.BackgroundImage")));
            this.bt_RL_Edit.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.bt_RL_Edit.Location = new System.Drawing.Point(10, 90);
            this.bt_RL_Edit.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.bt_RL_Edit.Name = "bt_RL_Edit";
            this.bt_RL_Edit.Size = new System.Drawing.Size(36, 36);
            this.bt_RL_Edit.TabIndex = 6;
            this.bt_RL_Edit.Tag = "Add new Limit";
            this.bt_RL_Edit.UseVisualStyleBackColor = true;
            this.bt_RL_Edit.Click += new System.EventHandler(this.bt_Edit_RL);
            // 
            // bt_RL_Del
            // 
            this.bt_RL_Del.AccessibleDescription = "";
            this.bt_RL_Del.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("bt_RL_Del.BackgroundImage")));
            this.bt_RL_Del.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.bt_RL_Del.Location = new System.Drawing.Point(10, 140);
            this.bt_RL_Del.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.bt_RL_Del.Name = "bt_RL_Del";
            this.bt_RL_Del.Size = new System.Drawing.Size(36, 36);
            this.bt_RL_Del.TabIndex = 7;
            this.bt_RL_Del.Tag = "Add new Limit";
            this.bt_RL_Del.UseVisualStyleBackColor = true;
            this.bt_RL_Del.Click += new System.EventHandler(this.bt_RL_delete);
            // 
            // cb_F_RestrictType
            // 
            this.cb_F_RestrictType.DataSource = this.rLTypesBindingSource;
            this.cb_F_RestrictType.DisplayMember = "TypeName";
            this.cb_F_RestrictType.FormattingEnabled = true;
            this.cb_F_RestrictType.Location = new System.Drawing.Point(620, 11);
            this.cb_F_RestrictType.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cb_F_RestrictType.Name = "cb_F_RestrictType";
            this.cb_F_RestrictType.Size = new System.Drawing.Size(341, 21);
            this.cb_F_RestrictType.TabIndex = 3;
            this.cb_F_RestrictType.ValueMember = "Code";
            this.cb_F_RestrictType.SelectionChangeCommitted += new System.EventHandler(this.RL_Filter_Changed);
            // 
            // cb_F_Client
            // 
            this.cb_F_Client.DataSource = this.cLClientsBindingSource;
            this.cb_F_Client.DisplayMember = "ПолноеНаименование";
            this.cb_F_Client.FormattingEnabled = true;
            this.cb_F_Client.Location = new System.Drawing.Point(115, 11);
            this.cb_F_Client.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cb_F_Client.Name = "cb_F_Client";
            this.cb_F_Client.Size = new System.Drawing.Size(342, 21);
            this.cb_F_Client.TabIndex = 2;
            this.cb_F_Client.ValueMember = "КодКлиента";
            this.cb_F_Client.SelectionChangeCommitted += new System.EventHandler(this.RL_Filter_Changed);
            // 
            // l_Filter_cl
            // 
            this.l_Filter_cl.AutoSize = true;
            this.l_Filter_cl.Location = new System.Drawing.Point(60, 15);
            this.l_Filter_cl.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.l_Filter_cl.Name = "l_Filter_cl";
            this.l_Filter_cl.Size = new System.Drawing.Size(43, 13);
            this.l_Filter_cl.TabIndex = 1;
            this.l_Filter_cl.Text = "Клиент";
            // 
            // dgv_Restr
            // 
            this.dgv_Restr.AllowUserToAddRows = false;
            this.dgv_Restr.AllowUserToDeleteRows = false;
            this.dgv_Restr.AutoGenerateColumns = false;
            this.dgv_Restr.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_Restr.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.clientIdDataGridViewTextBoxColumn,
            this.clientNameDataGridViewTextBoxColumn,
            this.typeDataGridViewTextBoxColumn,
            this.restrictTypeDataGridViewTextBoxColumn,
            this.ridDataGridViewTextBoxColumn2,
            this.restrictNameDataGridViewTextBoxColumn,
            this.echelonDataGridViewTextBoxColumn,
            this.limitTypeDataGridViewTextBoxColumn,
            this.limitValueDataGridViewTextBoxColumn,
            this.unitsDataGridViewTextBoxColumn});
            this.dgv_Restr.DataSource = this.cLRestrictionsBindingSource;
            this.dgv_Restr.Location = new System.Drawing.Point(60, 40);
            this.dgv_Restr.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.dgv_Restr.Name = "dgv_Restr";
            this.dgv_Restr.RowHeadersWidth = 5;
            this.dgv_Restr.Size = new System.Drawing.Size(1052, 864);
            this.dgv_Restr.TabIndex = 0;
            this.dgv_Restr.CellEndEdit += new System.Windows.Forms.DataGridViewCellEventHandler(this.RLValueEdited);
            this.dgv_Restr.CellEnter += new System.Windows.Forms.DataGridViewCellEventHandler(this.SetActiveRL);
            // 
            // clientIdDataGridViewTextBoxColumn
            // 
            this.clientIdDataGridViewTextBoxColumn.DataPropertyName = "ClientId";
            this.clientIdDataGridViewTextBoxColumn.HeaderText = "ClientId";
            this.clientIdDataGridViewTextBoxColumn.MinimumWidth = 50;
            this.clientIdDataGridViewTextBoxColumn.Name = "clientIdDataGridViewTextBoxColumn";
            this.clientIdDataGridViewTextBoxColumn.ReadOnly = true;
            this.clientIdDataGridViewTextBoxColumn.Width = 50;
            // 
            // clientNameDataGridViewTextBoxColumn
            // 
            this.clientNameDataGridViewTextBoxColumn.DataPropertyName = "ClientName";
            this.clientNameDataGridViewTextBoxColumn.HeaderText = "ClientName";
            this.clientNameDataGridViewTextBoxColumn.MinimumWidth = 200;
            this.clientNameDataGridViewTextBoxColumn.Name = "clientNameDataGridViewTextBoxColumn";
            this.clientNameDataGridViewTextBoxColumn.ReadOnly = true;
            this.clientNameDataGridViewTextBoxColumn.Width = 200;
            // 
            // typeDataGridViewTextBoxColumn
            // 
            this.typeDataGridViewTextBoxColumn.DataPropertyName = "Type";
            this.typeDataGridViewTextBoxColumn.HeaderText = "Type";
            this.typeDataGridViewTextBoxColumn.Name = "typeDataGridViewTextBoxColumn";
            this.typeDataGridViewTextBoxColumn.ReadOnly = true;
            this.typeDataGridViewTextBoxColumn.Visible = false;
            // 
            // restrictTypeDataGridViewTextBoxColumn
            // 
            this.restrictTypeDataGridViewTextBoxColumn.DataPropertyName = "RestrictType";
            this.restrictTypeDataGridViewTextBoxColumn.HeaderText = "RestrictType";
            this.restrictTypeDataGridViewTextBoxColumn.MinimumWidth = 250;
            this.restrictTypeDataGridViewTextBoxColumn.Name = "restrictTypeDataGridViewTextBoxColumn";
            this.restrictTypeDataGridViewTextBoxColumn.ReadOnly = true;
            this.restrictTypeDataGridViewTextBoxColumn.Width = 250;
            // 
            // ridDataGridViewTextBoxColumn2
            // 
            this.ridDataGridViewTextBoxColumn2.DataPropertyName = "rid";
            this.ridDataGridViewTextBoxColumn2.HeaderText = "rid";
            this.ridDataGridViewTextBoxColumn2.Name = "ridDataGridViewTextBoxColumn2";
            this.ridDataGridViewTextBoxColumn2.ReadOnly = true;
            this.ridDataGridViewTextBoxColumn2.Visible = false;
            // 
            // restrictNameDataGridViewTextBoxColumn
            // 
            this.restrictNameDataGridViewTextBoxColumn.DataPropertyName = "RestrictName";
            this.restrictNameDataGridViewTextBoxColumn.HeaderText = "RestrictName";
            this.restrictNameDataGridViewTextBoxColumn.MinimumWidth = 300;
            this.restrictNameDataGridViewTextBoxColumn.Name = "restrictNameDataGridViewTextBoxColumn";
            this.restrictNameDataGridViewTextBoxColumn.ReadOnly = true;
            this.restrictNameDataGridViewTextBoxColumn.Width = 300;
            // 
            // echelonDataGridViewTextBoxColumn
            // 
            this.echelonDataGridViewTextBoxColumn.DataPropertyName = "Echelon";
            this.echelonDataGridViewTextBoxColumn.HeaderText = "Echelon";
            this.echelonDataGridViewTextBoxColumn.MinimumWidth = 50;
            this.echelonDataGridViewTextBoxColumn.Name = "echelonDataGridViewTextBoxColumn";
            this.echelonDataGridViewTextBoxColumn.Width = 50;
            // 
            // limitTypeDataGridViewTextBoxColumn
            // 
            this.limitTypeDataGridViewTextBoxColumn.DataPropertyName = "LimitType";
            this.limitTypeDataGridViewTextBoxColumn.HeaderText = "LimitType";
            this.limitTypeDataGridViewTextBoxColumn.MinimumWidth = 50;
            this.limitTypeDataGridViewTextBoxColumn.Name = "limitTypeDataGridViewTextBoxColumn";
            this.limitTypeDataGridViewTextBoxColumn.ReadOnly = true;
            this.limitTypeDataGridViewTextBoxColumn.Visible = false;
            this.limitTypeDataGridViewTextBoxColumn.Width = 50;
            // 
            // limitValueDataGridViewTextBoxColumn
            // 
            this.limitValueDataGridViewTextBoxColumn.DataPropertyName = "LimitValue";
            this.limitValueDataGridViewTextBoxColumn.HeaderText = "LimitValue";
            this.limitValueDataGridViewTextBoxColumn.MinimumWidth = 60;
            this.limitValueDataGridViewTextBoxColumn.Name = "limitValueDataGridViewTextBoxColumn";
            this.limitValueDataGridViewTextBoxColumn.Width = 60;
            // 
            // unitsDataGridViewTextBoxColumn
            // 
            this.unitsDataGridViewTextBoxColumn.DataPropertyName = "Units";
            this.unitsDataGridViewTextBoxColumn.HeaderText = "Units";
            this.unitsDataGridViewTextBoxColumn.MinimumWidth = 50;
            this.unitsDataGridViewTextBoxColumn.Name = "unitsDataGridViewTextBoxColumn";
            this.unitsDataGridViewTextBoxColumn.ReadOnly = true;
            this.unitsDataGridViewTextBoxColumn.Width = 50;
            // 
            // tp_groups
            // 
            this.tp_groups.AutoScroll = true;
            this.tp_groups.Controls.Add(this.b_AddSub);
            this.tp_groups.Controls.Add(this.t_SubId);
            this.tp_groups.Controls.Add(this.dgv_SubGroups);
            this.tp_groups.Controls.Add(this.dgv_GroupContent);
            this.tp_groups.Controls.Add(this.tb_ContrFind);
            this.tp_groups.Controls.Add(this.dgv_groups);
            this.tp_groups.Controls.Add(this.l_AddSub);
            this.tp_groups.Controls.Add(this.l_SubGroups);
            this.tp_groups.Controls.Add(this.b_AddToGroup);
            this.tp_groups.Controls.Add(this.l_contrid);
            this.tp_groups.Controls.Add(this.l_SelectedGroup);
            this.tp_groups.Controls.Add(this.l_contrFind);
            this.tp_groups.Controls.Add(this.cb_GontrFind);
            this.tp_groups.Controls.Add(this.b_delete);
            this.tp_groups.Controls.Add(this.b_edit);
            this.tp_groups.Controls.Add(this.b_add);
            this.tp_groups.Location = new System.Drawing.Point(4, 22);
            this.tp_groups.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.tp_groups.Name = "tp_groups";
            this.tp_groups.Padding = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.tp_groups.Size = new System.Drawing.Size(1470, 921);
            this.tp_groups.TabIndex = 3;
            this.tp_groups.Text = "Группы";
            this.tp_groups.UseVisualStyleBackColor = true;
            this.tp_groups.Enter += new System.EventHandler(this.Groups_enter);
            // 
            // b_AddSub
            // 
            this.b_AddSub.Location = new System.Drawing.Point(928, 828);
            this.b_AddSub.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.b_AddSub.Name = "b_AddSub";
            this.b_AddSub.Size = new System.Drawing.Size(112, 24);
            this.b_AddSub.TabIndex = 42;
            this.b_AddSub.Text = "Добавить";
            this.b_AddSub.UseVisualStyleBackColor = true;
            this.b_AddSub.Click += new System.EventHandler(this.ClickAddSub);
            // 
            // t_SubId
            // 
            this.t_SubId.Location = new System.Drawing.Point(827, 831);
            this.t_SubId.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.t_SubId.Name = "t_SubId";
            this.t_SubId.Size = new System.Drawing.Size(95, 20);
            this.t_SubId.TabIndex = 41;
            // 
            // dgv_SubGroups
            // 
            this.dgv_SubGroups.AllowUserToAddRows = false;
            this.dgv_SubGroups.AllowUserToDeleteRows = false;
            this.dgv_SubGroups.AutoGenerateColumns = false;
            this.dgv_SubGroups.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_SubGroups.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.parentIdDataGridViewTextBoxColumn,
            this.childIdDataGridViewTextBoxColumn,
            this.groupNameDataGridViewTextBoxColumn1,
            this.ColumnDelete});
            this.dgv_SubGroups.DataSource = this.cLSubGroupBindingSource;
            this.dgv_SubGroups.Location = new System.Drawing.Point(563, 579);
            this.dgv_SubGroups.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.dgv_SubGroups.Name = "dgv_SubGroups";
            this.dgv_SubGroups.ReadOnly = true;
            this.dgv_SubGroups.RowHeadersWidth = 20;
            this.dgv_SubGroups.Size = new System.Drawing.Size(482, 242);
            this.dgv_SubGroups.TabIndex = 39;
            this.dgv_SubGroups.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.Click_DeleteSub);
            // 
            // parentIdDataGridViewTextBoxColumn
            // 
            this.parentIdDataGridViewTextBoxColumn.DataPropertyName = "ParentId";
            this.parentIdDataGridViewTextBoxColumn.HeaderText = "ParentId";
            this.parentIdDataGridViewTextBoxColumn.Name = "parentIdDataGridViewTextBoxColumn";
            this.parentIdDataGridViewTextBoxColumn.ReadOnly = true;
            this.parentIdDataGridViewTextBoxColumn.Visible = false;
            // 
            // childIdDataGridViewTextBoxColumn
            // 
            this.childIdDataGridViewTextBoxColumn.DataPropertyName = "ChildId";
            this.childIdDataGridViewTextBoxColumn.HeaderText = "ChildId";
            this.childIdDataGridViewTextBoxColumn.MinimumWidth = 70;
            this.childIdDataGridViewTextBoxColumn.Name = "childIdDataGridViewTextBoxColumn";
            this.childIdDataGridViewTextBoxColumn.ReadOnly = true;
            this.childIdDataGridViewTextBoxColumn.Width = 70;
            // 
            // groupNameDataGridViewTextBoxColumn1
            // 
            this.groupNameDataGridViewTextBoxColumn1.DataPropertyName = "GroupName";
            this.groupNameDataGridViewTextBoxColumn1.HeaderText = "GroupName";
            this.groupNameDataGridViewTextBoxColumn1.MinimumWidth = 300;
            this.groupNameDataGridViewTextBoxColumn1.Name = "groupNameDataGridViewTextBoxColumn1";
            this.groupNameDataGridViewTextBoxColumn1.ReadOnly = true;
            this.groupNameDataGridViewTextBoxColumn1.Width = 300;
            // 
            // ColumnDelete
            // 
            this.ColumnDelete.HeaderText = "";
            this.ColumnDelete.Image = ((System.Drawing.Image)(resources.GetObject("ColumnDelete.Image")));
            this.ColumnDelete.MinimumWidth = 20;
            this.ColumnDelete.Name = "ColumnDelete";
            this.ColumnDelete.ReadOnly = true;
            this.ColumnDelete.Width = 20;
            // 
            // dgv_GroupContent
            // 
            this.dgv_GroupContent.AllowUserToAddRows = false;
            this.dgv_GroupContent.AllowUserToDeleteRows = false;
            this.dgv_GroupContent.AutoGenerateColumns = false;
            this.dgv_GroupContent.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_GroupContent.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.nameDataGridViewTextBoxColumn2,
            this.ridDataGridViewTextBoxColumn1,
            this.Column_Delete});
            this.dgv_GroupContent.DataSource = this.cLGroupContentBindingSource;
            this.dgv_GroupContent.Location = new System.Drawing.Point(563, 37);
            this.dgv_GroupContent.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.dgv_GroupContent.Name = "dgv_GroupContent";
            this.dgv_GroupContent.RowHeadersWidth = 20;
            this.dgv_GroupContent.Size = new System.Drawing.Size(482, 337);
            this.dgv_GroupContent.TabIndex = 35;
            this.dgv_GroupContent.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.Click_Delete);
            // 
            // nameDataGridViewTextBoxColumn2
            // 
            this.nameDataGridViewTextBoxColumn2.DataPropertyName = "name";
            this.nameDataGridViewTextBoxColumn2.HeaderText = "name";
            this.nameDataGridViewTextBoxColumn2.MinimumWidth = 400;
            this.nameDataGridViewTextBoxColumn2.Name = "nameDataGridViewTextBoxColumn2";
            this.nameDataGridViewTextBoxColumn2.Width = 400;
            // 
            // ridDataGridViewTextBoxColumn1
            // 
            this.ridDataGridViewTextBoxColumn1.DataPropertyName = "rid";
            this.ridDataGridViewTextBoxColumn1.HeaderText = "rid";
            this.ridDataGridViewTextBoxColumn1.Name = "ridDataGridViewTextBoxColumn1";
            this.ridDataGridViewTextBoxColumn1.Visible = false;
            // 
            // Column_Delete
            // 
            this.Column_Delete.HeaderText = "";
            this.Column_Delete.Image = ((System.Drawing.Image)(resources.GetObject("Column_Delete.Image")));
            this.Column_Delete.MinimumWidth = 20;
            this.Column_Delete.Name = "Column_Delete";
            this.Column_Delete.Width = 20;
            // 
            // tb_ContrFind
            // 
            this.tb_ContrFind.Location = new System.Drawing.Point(746, 378);
            this.tb_ContrFind.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.tb_ContrFind.Name = "tb_ContrFind";
            this.tb_ContrFind.Size = new System.Drawing.Size(299, 20);
            this.tb_ContrFind.TabIndex = 32;
            this.tb_ContrFind.TextChanged += new System.EventHandler(this.FindContrToGroup);
            // 
            // dgv_groups
            // 
            this.dgv_groups.AllowUserToAddRows = false;
            this.dgv_groups.AllowUserToDeleteRows = false;
            this.dgv_groups.AutoGenerateColumns = false;
            this.dgv_groups.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_groups.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.idDataGridViewTextBoxColumn2,
            this.ridDataGridViewTextBoxColumn,
            this.groupNameDataGridViewTextBoxColumn});
            this.dgv_groups.DataSource = this.cLGroupsBindingSource;
            this.dgv_groups.Location = new System.Drawing.Point(60, 9);
            this.dgv_groups.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.dgv_groups.Name = "dgv_groups";
            this.dgv_groups.RowHeadersWidth = 10;
            this.dgv_groups.Size = new System.Drawing.Size(444, 856);
            this.dgv_groups.TabIndex = 27;
            this.dgv_groups.CellEnter += new System.Windows.Forms.DataGridViewCellEventHandler(this.SelectActiveId);
            // 
            // idDataGridViewTextBoxColumn2
            // 
            this.idDataGridViewTextBoxColumn2.DataPropertyName = "Id";
            this.idDataGridViewTextBoxColumn2.HeaderText = "Id";
            this.idDataGridViewTextBoxColumn2.MinimumWidth = 70;
            this.idDataGridViewTextBoxColumn2.Name = "idDataGridViewTextBoxColumn2";
            this.idDataGridViewTextBoxColumn2.ReadOnly = true;
            this.idDataGridViewTextBoxColumn2.Width = 70;
            // 
            // ridDataGridViewTextBoxColumn
            // 
            this.ridDataGridViewTextBoxColumn.DataPropertyName = "Rid";
            this.ridDataGridViewTextBoxColumn.HeaderText = "Rid";
            this.ridDataGridViewTextBoxColumn.Name = "ridDataGridViewTextBoxColumn";
            this.ridDataGridViewTextBoxColumn.Visible = false;
            // 
            // groupNameDataGridViewTextBoxColumn
            // 
            this.groupNameDataGridViewTextBoxColumn.DataPropertyName = "GroupName";
            this.groupNameDataGridViewTextBoxColumn.HeaderText = "GroupName";
            this.groupNameDataGridViewTextBoxColumn.MinimumWidth = 300;
            this.groupNameDataGridViewTextBoxColumn.Name = "groupNameDataGridViewTextBoxColumn";
            this.groupNameDataGridViewTextBoxColumn.Width = 300;
            // 
            // l_AddSub
            // 
            this.l_AddSub.AutoSize = true;
            this.l_AddSub.Location = new System.Drawing.Point(559, 834);
            this.l_AddSub.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.l_AddSub.Name = "l_AddSub";
            this.l_AddSub.Size = new System.Drawing.Size(173, 13);
            this.l_AddSub.TabIndex = 40;
            this.l_AddSub.Text = "Добавить в подгруппы группу №";
            // 
            // l_SubGroups
            // 
            this.l_SubGroups.AutoSize = true;
            this.l_SubGroups.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.l_SubGroups.Location = new System.Drawing.Point(559, 540);
            this.l_SubGroups.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.l_SubGroups.Name = "l_SubGroups";
            this.l_SubGroups.Size = new System.Drawing.Size(89, 17);
            this.l_SubGroups.TabIndex = 38;
            this.l_SubGroups.Text = "Подгруппы";
            // 
            // b_AddToGroup
            // 
            this.b_AddToGroup.Location = new System.Drawing.Point(874, 443);
            this.b_AddToGroup.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.b_AddToGroup.Name = "b_AddToGroup";
            this.b_AddToGroup.Size = new System.Drawing.Size(171, 24);
            this.b_AddToGroup.TabIndex = 37;
            this.b_AddToGroup.Text = "Добавить в группу";
            this.b_AddToGroup.UseVisualStyleBackColor = true;
            this.b_AddToGroup.Click += new System.EventHandler(this.b_AddToGroup_Click);
            // 
            // l_contrid
            // 
            this.l_contrid.AutoSize = true;
            this.l_contrid.Enabled = false;
            this.l_contrid.Location = new System.Drawing.Point(566, 474);
            this.l_contrid.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.l_contrid.Name = "l_contrid";
            this.l_contrid.Size = new System.Drawing.Size(0, 13);
            this.l_contrid.TabIndex = 36;
            // 
            // l_SelectedGroup
            // 
            this.l_SelectedGroup.AutoSize = true;
            this.l_SelectedGroup.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.l_SelectedGroup.Location = new System.Drawing.Point(559, 10);
            this.l_SelectedGroup.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.l_SelectedGroup.Name = "l_SelectedGroup";
            this.l_SelectedGroup.Size = new System.Drawing.Size(135, 15);
            this.l_SelectedGroup.TabIndex = 34;
            this.l_SelectedGroup.Text = "Группа не выбрана";
            // 
            // l_contrFind
            // 
            this.l_contrFind.AutoSize = true;
            this.l_contrFind.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.l_contrFind.Location = new System.Drawing.Point(559, 379);
            this.l_contrFind.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.l_contrFind.Name = "l_contrFind";
            this.l_contrFind.Size = new System.Drawing.Size(119, 15);
            this.l_contrFind.TabIndex = 33;
            this.l_contrFind.Text = "Поиск контрагента";
            // 
            // cb_GontrFind
            // 
            this.cb_GontrFind.DataSource = this.cLContragentsBindingSource;
            this.cb_GontrFind.FormattingEnabled = true;
            this.cb_GontrFind.Location = new System.Drawing.Point(562, 408);
            this.cb_GontrFind.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cb_GontrFind.Name = "cb_GontrFind";
            this.cb_GontrFind.Size = new System.Drawing.Size(483, 21);
            this.cb_GontrFind.TabIndex = 31;
            this.cb_GontrFind.SelectedValueChanged += new System.EventHandler(this.Select_Contr);
            // 
            // b_delete
            // 
            this.b_delete.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.b_delete.Image = ((System.Drawing.Image)(resources.GetObject("b_delete.Image")));
            this.b_delete.Location = new System.Drawing.Point(8, 110);
            this.b_delete.Margin = new System.Windows.Forms.Padding(0);
            this.b_delete.Name = "b_delete";
            this.b_delete.Padding = new System.Windows.Forms.Padding(3);
            this.b_delete.Size = new System.Drawing.Size(36, 36);
            this.b_delete.TabIndex = 30;
            this.b_delete.UseVisualStyleBackColor = false;
            this.b_delete.Click += new System.EventHandler(this.DeletingGroup);
            // 
            // b_edit
            // 
            this.b_edit.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.b_edit.Image = ((System.Drawing.Image)(resources.GetObject("b_edit.Image")));
            this.b_edit.Location = new System.Drawing.Point(8, 60);
            this.b_edit.Margin = new System.Windows.Forms.Padding(0);
            this.b_edit.Name = "b_edit";
            this.b_edit.Padding = new System.Windows.Forms.Padding(3);
            this.b_edit.Size = new System.Drawing.Size(36, 36);
            this.b_edit.TabIndex = 29;
            this.b_edit.UseVisualStyleBackColor = false;
            this.b_edit.Click += new System.EventHandler(this.EditingGroup);
            // 
            // b_add
            // 
            this.b_add.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.b_add.Image = ((System.Drawing.Image)(resources.GetObject("b_add.Image")));
            this.b_add.Location = new System.Drawing.Point(8, 10);
            this.b_add.Margin = new System.Windows.Forms.Padding(0);
            this.b_add.Name = "b_add";
            this.b_add.Padding = new System.Windows.Forms.Padding(3);
            this.b_add.Size = new System.Drawing.Size(36, 36);
            this.b_add.TabIndex = 28;
            this.b_add.UseVisualStyleBackColor = false;
            this.b_add.Click += new System.EventHandler(this.AddingGroup);
            // 
            // tp_Portfolio
            // 
            this.tp_Portfolio.AutoScroll = true;
            this.tp_Portfolio.Controls.Add(this.dgv_FTView);
            this.tp_Portfolio.Controls.Add(this.bt_Model_Deal);
            this.tp_Portfolio.Controls.Add(this.bt_Portf_Model);
            this.tp_Portfolio.Controls.Add(this.b_ShowRepo);
            this.tp_Portfolio.Controls.Add(this.cb_FTTypes);
            this.tp_Portfolio.Controls.Add(this.l_PortfolioType);
            this.tp_Portfolio.Controls.Add(this.l_client2);
            this.tp_Portfolio.Controls.Add(this.cb_PortfClient);
            this.tp_Portfolio.Controls.Add(this.bt_ReloadPortf);
            this.tp_Portfolio.Location = new System.Drawing.Point(4, 22);
            this.tp_Portfolio.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.tp_Portfolio.Name = "tp_Portfolio";
            this.tp_Portfolio.Size = new System.Drawing.Size(1470, 921);
            this.tp_Portfolio.TabIndex = 2;
            this.tp_Portfolio.Text = "Портфель";
            this.tp_Portfolio.UseVisualStyleBackColor = true;
            this.tp_Portfolio.Enter += new System.EventHandler(this.PortfolioOfClient);
            // 
            // dgv_FTView
            // 
            this.dgv_FTView.AllowUserToAddRows = false;
            this.dgv_FTView.AllowUserToDeleteRows = false;
            this.dgv_FTView.AutoGenerateColumns = false;
            this.dgv_FTView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_FTView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.clientCodeDataGridViewTextBoxColumn2,
            this.instrumentNameDataGridViewTextBoxColumn1,
            this.issuerDataGridViewTextBoxColumn1,
            this.clientAccountDataGridViewTextBoxColumn1,
            this.summAssetDataGridViewTextBoxColumn1,
            this.instrumentDataGridViewTextBoxColumn1,
            this.quantityDataGridViewTextBoxColumn1,
            this.marketValueDataGridViewTextBoxColumn1,
            this.percentDataGridViewTextBoxColumn,
            this.instrumentTypeDataGridViewTextBoxColumn1,
            this.instrumentSubtypeDataGridViewTextBoxColumn1,
            this.secTypeBrDataGridViewTextBoxColumn,
            this.countryDataGridViewTextBoxColumn1,
            this.quoteSheetDataGridViewTextBoxColumn1,
            this.ownTypeDataGridViewTextBoxColumn1,
            this.bondsIssueSummDataGridViewTextBoxColumn1,
            this.quoteSDHDataGridViewTextBoxColumn1,
            this.quoteSDHAgoDataGridViewTextBoxColumn1,
            this.volCirculationDataGridViewTextBoxColumn1,
            this.contridDataGridViewTextBoxColumn2,
            this.capitalizationDataGridViewTextBoxColumn1,
            this.redemptionDateDataGridViewTextBoxColumn1,
            this.securityIdDataGridViewTextBoxColumn1,
            this.issueNumDataGridViewTextBoxColumn1,
            this.announcedVolDataGridViewTextBoxColumn1,
            this.dateStartPlacingDataGridViewTextBoxColumn1,
            this.dateEndPlacingDataGridViewTextBoxColumn1,
            this.currencyDataGridViewTextBoxColumn1,
            this.cBCodeDataGridViewTextBoxColumn1,
            this.iDCBSDHDataGridViewTextBoxColumn1,
            this.stateRegNumDataGridViewTextBoxColumn1,
            this.monthAvgVolDataGridViewTextBoxColumn1,
            this.fRatingDataGridViewTextBoxColumn1,
            this.mRatingDataGridViewTextBoxColumn1,
            this.sPRatingDataGridViewTextBoxColumn1,
            this.eRatingDataGridViewTextBoxColumn1,
            this.aRatingDataGridViewTextBoxColumn1,
            this.dataGridViewTextBoxColumn2,
            this.dataGridViewTextBoxColumn3,
            this.contrFRatingDataGridViewTextBoxColumn1,
            this.contrMRatingDataGridViewTextBoxColumn1,
            this.contrSPRatingDataGridViewTextBoxColumn1,
            this.contrERatingDataGridViewTextBoxColumn1,
            this.contrARatingDataGridViewTextBoxColumn1,
            this.dataGridViewTextBoxColumn4,
            this.dataGridViewTextBoxColumn5,
            this.enddateDataGridViewTextBoxColumn1,
            this.isInIndexDataGridViewCheckBoxColumn1,
            this.isVariableCouponDataGridViewCheckBoxColumn1,
            this.isQuantityGrowsDataGridViewCheckBoxColumn,
            this.dataGridViewTextBoxColumn1,
            this.isbankDataGridViewCheckBoxColumn,
            this.forqualinvestorsDataGridViewCheckBoxColumn,
            this.isSubordinatedDataGridViewTextBoxColumn});
            this.dgv_FTView.DataSource = this.fTViewBindingSource;
            this.dgv_FTView.Location = new System.Drawing.Point(12, 54);
            this.dgv_FTView.Name = "dgv_FTView";
            this.dgv_FTView.RowHeadersWidth = 5;
            this.dgv_FTView.Size = new System.Drawing.Size(1449, 847);
            this.dgv_FTView.TabIndex = 17;
            // 
            // fTViewBindingSource
            // 
            this.fTViewBindingSource.DataMember = "FT_View";
            this.fTViewBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // bt_Model_Deal
            // 
            this.bt_Model_Deal.Enabled = false;
            this.bt_Model_Deal.Location = new System.Drawing.Point(1013, 15);
            this.bt_Model_Deal.Name = "bt_Model_Deal";
            this.bt_Model_Deal.Size = new System.Drawing.Size(132, 23);
            this.bt_Model_Deal.TabIndex = 16;
            this.bt_Model_Deal.Text = "Модельная сделка";
            this.bt_Model_Deal.UseVisualStyleBackColor = true;
            this.bt_Model_Deal.Click += new System.EventHandler(this.AddModelDeal);
            // 
            // bt_Portf_Model
            // 
            this.bt_Portf_Model.Location = new System.Drawing.Point(857, 15);
            this.bt_Portf_Model.Name = "bt_Portf_Model";
            this.bt_Portf_Model.Size = new System.Drawing.Size(132, 23);
            this.bt_Portf_Model.TabIndex = 15;
            this.bt_Portf_Model.Text = "Портфель => Модель";
            this.bt_Portf_Model.UseVisualStyleBackColor = true;
            this.bt_Portf_Model.Click += new System.EventHandler(this.PortfolioToModel);
            // 
            // b_ShowRepo
            // 
            this.b_ShowRepo.Location = new System.Drawing.Point(1271, 15);
            this.b_ShowRepo.Name = "b_ShowRepo";
            this.b_ShowRepo.Size = new System.Drawing.Size(132, 23);
            this.b_ShowRepo.TabIndex = 14;
            this.b_ShowRepo.Text = "Сделки РЕПО";
            this.b_ShowRepo.UseVisualStyleBackColor = true;
            this.b_ShowRepo.Click += new System.EventHandler(this.b_ShowRepo_Click);
            // 
            // cb_FTTypes
            // 
            this.cb_FTTypes.DataSource = this.factTablesListBindingSource;
            this.cb_FTTypes.DisplayMember = "Comment";
            this.cb_FTTypes.FormattingEnabled = true;
            this.cb_FTTypes.Location = new System.Drawing.Point(590, 15);
            this.cb_FTTypes.Name = "cb_FTTypes";
            this.cb_FTTypes.Size = new System.Drawing.Size(239, 21);
            this.cb_FTTypes.TabIndex = 13;
            this.cb_FTTypes.ValueMember = "Id";
            this.cb_FTTypes.SelectionChangeCommitted += new System.EventHandler(this.PortfolioOfClient);
            // 
            // factTablesListBindingSource
            // 
            this.factTablesListBindingSource.DataMember = "FactTablesList";
            this.factTablesListBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // l_PortfolioType
            // 
            this.l_PortfolioType.AutoSize = true;
            this.l_PortfolioType.Location = new System.Drawing.Point(526, 20);
            this.l_PortfolioType.Name = "l_PortfolioType";
            this.l_PortfolioType.Size = new System.Drawing.Size(58, 13);
            this.l_PortfolioType.TabIndex = 12;
            this.l_PortfolioType.Text = "Портфель";
            // 
            // l_client2
            // 
            this.l_client2.AutoSize = true;
            this.l_client2.Location = new System.Drawing.Point(9, 20);
            this.l_client2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.l_client2.Name = "l_client2";
            this.l_client2.Size = new System.Drawing.Size(43, 13);
            this.l_client2.TabIndex = 11;
            this.l_client2.Text = "Клиент";
            // 
            // cb_PortfClient
            // 
            this.cb_PortfClient.DataSource = this.cLClientsBindingSource3;
            this.cb_PortfClient.DisplayMember = "ПолноеНаименование";
            this.cb_PortfClient.FormattingEnabled = true;
            this.cb_PortfClient.Location = new System.Drawing.Point(60, 15);
            this.cb_PortfClient.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cb_PortfClient.Name = "cb_PortfClient";
            this.cb_PortfClient.Size = new System.Drawing.Size(430, 21);
            this.cb_PortfClient.TabIndex = 2;
            this.cb_PortfClient.ValueMember = "КодКлиента";
            this.cb_PortfClient.SelectionChangeCommitted += new System.EventHandler(this.PortfolioOfClient);
            // 
            // cLClientsBindingSource3
            // 
            this.cLClientsBindingSource3.DataMember = "_CL_Clients";
            this.cLClientsBindingSource3.DataSource = this.lC3_devDataSet;
            // 
            // cms_Portf
            // 
            this.cms_Portf.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.cms_Portf.Name = "cms_Portf";
            this.cms_Portf.Size = new System.Drawing.Size(61, 4);
            this.cms_Portf.Text = "Отображаемые колонки";
            // 
            // factTableBindingSource
            // 
            this.factTableBindingSource.DataMember = "FactTable";
            this.factTableBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // bt_ReloadPortf
            // 
            this.bt_ReloadPortf.BackColor = System.Drawing.Color.White;
            this.bt_ReloadPortf.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("bt_ReloadPortf.BackgroundImage")));
            this.bt_ReloadPortf.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.bt_ReloadPortf.Location = new System.Drawing.Point(1425, 10);
            this.bt_ReloadPortf.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.bt_ReloadPortf.Name = "bt_ReloadPortf";
            this.bt_ReloadPortf.Size = new System.Drawing.Size(36, 36);
            this.bt_ReloadPortf.TabIndex = 0;
            this.bt_ReloadPortf.UseVisualStyleBackColor = false;
            this.bt_ReloadPortf.Click += new System.EventHandler(this.Click_Reload_Portf);
            // 
            // tp_Restrictions
            // 
            this.tp_Restrictions.Controls.Add(this.btSL5Perc);
            this.tp_Restrictions.Controls.Add(this.cb_Model);
            this.tp_Restrictions.Controls.Add(this.l_client);
            this.tp_Restrictions.Controls.Add(this.l_Limit);
            this.tp_Restrictions.Controls.Add(this.bCheckAll);
            this.tp_Restrictions.Controls.Add(this.bCheck);
            this.tp_Restrictions.Controls.Add(this.bt_ClLimit_edit);
            this.tp_Restrictions.Controls.Add(this.cb_OnlyActive);
            this.tp_Restrictions.Controls.Add(this.dgv_ClLimits);
            this.tp_Restrictions.Controls.Add(this.cbClients);
            this.tp_Restrictions.Controls.Add(this.cbCL);
            this.tp_Restrictions.Location = new System.Drawing.Point(4, 22);
            this.tp_Restrictions.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.tp_Restrictions.Name = "tp_Restrictions";
            this.tp_Restrictions.Padding = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.tp_Restrictions.Size = new System.Drawing.Size(1470, 921);
            this.tp_Restrictions.TabIndex = 1;
            this.tp_Restrictions.Text = "Ограничения";
            this.tp_Restrictions.UseVisualStyleBackColor = true;
            // 
            // btSL5Perc
            // 
            this.btSL5Perc.BackColor = System.Drawing.Color.White;
            this.btSL5Perc.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.btSL5Perc.Location = new System.Drawing.Point(8, 215);
            this.btSL5Perc.Name = "btSL5Perc";
            this.btSL5Perc.Size = new System.Drawing.Size(36, 36);
            this.btSL5Perc.TabIndex = 12;
            this.btSL5Perc.Text = "5%";
            this.btSL5Perc.UseVisualStyleBackColor = false;
            this.btSL5Perc.Click += new System.EventHandler(this.ClickShowSL);
            // 
            // cb_Model
            // 
            this.cb_Model.AutoSize = true;
            this.cb_Model.Enabled = false;
            this.cb_Model.Location = new System.Drawing.Point(1063, 14);
            this.cb_Model.Name = "cb_Model";
            this.cb_Model.Size = new System.Drawing.Size(194, 17);
            this.cb_Model.TabIndex = 11;
            this.cb_Model.Text = "Проверять модельный портфель";
            this.cb_Model.UseVisualStyleBackColor = true;
            // 
            // l_client
            // 
            this.l_client.AutoSize = true;
            this.l_client.Location = new System.Drawing.Point(594, 14);
            this.l_client.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.l_client.Name = "l_client";
            this.l_client.Size = new System.Drawing.Size(43, 13);
            this.l_client.TabIndex = 10;
            this.l_client.Text = "Клиент";
            // 
            // l_Limit
            // 
            this.l_Limit.AutoSize = true;
            this.l_Limit.Location = new System.Drawing.Point(60, 15);
            this.l_Limit.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.l_Limit.Name = "l_Limit";
            this.l_Limit.Size = new System.Drawing.Size(40, 13);
            this.l_Limit.TabIndex = 9;
            this.l_Limit.Text = "Лимит";
            // 
            // bCheckAll
            // 
            this.bCheckAll.BackColor = System.Drawing.Color.White;
            this.bCheckAll.BackgroundImage = global::LC3_Prog.Properties.Resources.chek_all;
            this.bCheckAll.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.bCheckAll.Location = new System.Drawing.Point(8, 145);
            this.bCheckAll.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.bCheckAll.Name = "bCheckAll";
            this.bCheckAll.Size = new System.Drawing.Size(36, 36);
            this.bCheckAll.TabIndex = 8;
            this.bCheckAll.UseVisualStyleBackColor = false;
            this.bCheckAll.Click += new System.EventHandler(this.ClickCheckAll);
            // 
            // bCheck
            // 
            this.bCheck.BackColor = System.Drawing.Color.White;
            this.bCheck.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("bCheck.BackgroundImage")));
            this.bCheck.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.bCheck.Location = new System.Drawing.Point(8, 95);
            this.bCheck.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.bCheck.Name = "bCheck";
            this.bCheck.Size = new System.Drawing.Size(36, 36);
            this.bCheck.TabIndex = 7;
            this.bCheck.UseVisualStyleBackColor = false;
            this.bCheck.Click += new System.EventHandler(this.ClickCheckLimit);
            // 
            // bt_ClLimit_edit
            // 
            this.bt_ClLimit_edit.BackColor = System.Drawing.Color.White;
            this.bt_ClLimit_edit.Image = ((System.Drawing.Image)(resources.GetObject("bt_ClLimit_edit.Image")));
            this.bt_ClLimit_edit.Location = new System.Drawing.Point(8, 45);
            this.bt_ClLimit_edit.Name = "bt_ClLimit_edit";
            this.bt_ClLimit_edit.Size = new System.Drawing.Size(36, 36);
            this.bt_ClLimit_edit.TabIndex = 6;
            this.bt_ClLimit_edit.UseVisualStyleBackColor = false;
            this.bt_ClLimit_edit.Click += new System.EventHandler(this.bt_ClLimit_edit_Click);
            // 
            // cb_OnlyActive
            // 
            this.cb_OnlyActive.AutoSize = true;
            this.cb_OnlyActive.Checked = true;
            this.cb_OnlyActive.CheckState = System.Windows.Forms.CheckState.Checked;
            this.cb_OnlyActive.Location = new System.Drawing.Point(1337, 14);
            this.cb_OnlyActive.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cb_OnlyActive.Name = "cb_OnlyActive";
            this.cb_OnlyActive.Size = new System.Drawing.Size(115, 17);
            this.cb_OnlyActive.TabIndex = 5;
            this.cb_OnlyActive.Text = "Только активные";
            this.cb_OnlyActive.UseVisualStyleBackColor = true;
            this.cb_OnlyActive.CheckedChanged += new System.EventHandler(this.FilterCL);
            // 
            // dgv_ClLimits
            // 
            this.dgv_ClLimits.AllowUserToAddRows = false;
            this.dgv_ClLimits.AllowUserToDeleteRows = false;
            this.dgv_ClLimits.AutoGenerateColumns = false;
            this.dgv_ClLimits.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_ClLimits.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Column1,
            this.limitIdDataGridViewTextBoxColumn,
            this.clientNameDataGridViewTextBoxColumn1,
            this.clientCodeDataGridViewTextBoxColumn,
            this.nameDataGridViewTextBoxColumn3,
            this.isActiveDataGridViewCheckBoxColumn,
            this.minValueDataGridViewTextBoxColumn,
            this.lowerWarningDataGridViewTextBoxColumn,
            this.upperWarningDataGridViewTextBoxColumn,
            this.maxValueDataGridViewTextBoxColumn,
            this.Current,
            this.CheckResult});
            this.dgv_ClLimits.DataSource = this.cLClientLimitsBindingSource1;
            this.dgv_ClLimits.Location = new System.Drawing.Point(63, 45);
            this.dgv_ClLimits.Margin = new System.Windows.Forms.Padding(45, 46, 45, 46);
            this.dgv_ClLimits.Name = "dgv_ClLimits";
            this.dgv_ClLimits.RowHeadersWidth = 5;
            this.dgv_ClLimits.ShowCellErrors = false;
            this.dgv_ClLimits.ShowRowErrors = false;
            this.dgv_ClLimits.Size = new System.Drawing.Size(1389, 864);
            this.dgv_ClLimits.TabIndex = 4;
            this.dgv_ClLimits.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.EnterAndCheck);
            this.dgv_ClLimits.CellEndEdit += new System.Windows.Forms.DataGridViewCellEventHandler(this.CLValueEdited);
            this.dgv_ClLimits.CellEnter += new System.Windows.Forms.DataGridViewCellEventHandler(this.SetActive_CL);
            // 
            // Column1
            // 
            this.Column1.DataPropertyName = "Id";
            this.Column1.HeaderText = "Id";
            this.Column1.Name = "Column1";
            this.Column1.ReadOnly = true;
            this.Column1.Visible = false;
            // 
            // limitIdDataGridViewTextBoxColumn
            // 
            this.limitIdDataGridViewTextBoxColumn.DataPropertyName = "LimitId";
            this.limitIdDataGridViewTextBoxColumn.HeaderText = "LimitId";
            this.limitIdDataGridViewTextBoxColumn.MinimumWidth = 50;
            this.limitIdDataGridViewTextBoxColumn.Name = "limitIdDataGridViewTextBoxColumn";
            this.limitIdDataGridViewTextBoxColumn.ReadOnly = true;
            this.limitIdDataGridViewTextBoxColumn.Visible = false;
            this.limitIdDataGridViewTextBoxColumn.Width = 50;
            // 
            // clientNameDataGridViewTextBoxColumn1
            // 
            this.clientNameDataGridViewTextBoxColumn1.DataPropertyName = "ClientName";
            this.clientNameDataGridViewTextBoxColumn1.HeaderText = "ClientName";
            this.clientNameDataGridViewTextBoxColumn1.MinimumWidth = 400;
            this.clientNameDataGridViewTextBoxColumn1.Name = "clientNameDataGridViewTextBoxColumn1";
            this.clientNameDataGridViewTextBoxColumn1.ReadOnly = true;
            this.clientNameDataGridViewTextBoxColumn1.Width = 400;
            // 
            // clientCodeDataGridViewTextBoxColumn
            // 
            this.clientCodeDataGridViewTextBoxColumn.DataPropertyName = "ClientCode";
            this.clientCodeDataGridViewTextBoxColumn.HeaderText = "ClientCode";
            this.clientCodeDataGridViewTextBoxColumn.MinimumWidth = 70;
            this.clientCodeDataGridViewTextBoxColumn.Name = "clientCodeDataGridViewTextBoxColumn";
            this.clientCodeDataGridViewTextBoxColumn.ReadOnly = true;
            this.clientCodeDataGridViewTextBoxColumn.Visible = false;
            this.clientCodeDataGridViewTextBoxColumn.Width = 70;
            // 
            // nameDataGridViewTextBoxColumn3
            // 
            this.nameDataGridViewTextBoxColumn3.DataPropertyName = "Name";
            this.nameDataGridViewTextBoxColumn3.HeaderText = "Name";
            this.nameDataGridViewTextBoxColumn3.MinimumWidth = 500;
            this.nameDataGridViewTextBoxColumn3.Name = "nameDataGridViewTextBoxColumn3";
            this.nameDataGridViewTextBoxColumn3.ReadOnly = true;
            this.nameDataGridViewTextBoxColumn3.Width = 500;
            // 
            // isActiveDataGridViewCheckBoxColumn
            // 
            this.isActiveDataGridViewCheckBoxColumn.DataPropertyName = "IsActive";
            this.isActiveDataGridViewCheckBoxColumn.HeaderText = "IsActive";
            this.isActiveDataGridViewCheckBoxColumn.MinimumWidth = 50;
            this.isActiveDataGridViewCheckBoxColumn.Name = "isActiveDataGridViewCheckBoxColumn";
            this.isActiveDataGridViewCheckBoxColumn.Width = 50;
            // 
            // minValueDataGridViewTextBoxColumn
            // 
            this.minValueDataGridViewTextBoxColumn.DataPropertyName = "MinValue";
            this.minValueDataGridViewTextBoxColumn.HeaderText = "MinValue";
            this.minValueDataGridViewTextBoxColumn.MinimumWidth = 70;
            this.minValueDataGridViewTextBoxColumn.Name = "minValueDataGridViewTextBoxColumn";
            this.minValueDataGridViewTextBoxColumn.Width = 70;
            // 
            // lowerWarningDataGridViewTextBoxColumn
            // 
            this.lowerWarningDataGridViewTextBoxColumn.DataPropertyName = "LowerWarning";
            this.lowerWarningDataGridViewTextBoxColumn.HeaderText = "LowerWarning";
            this.lowerWarningDataGridViewTextBoxColumn.MinimumWidth = 70;
            this.lowerWarningDataGridViewTextBoxColumn.Name = "lowerWarningDataGridViewTextBoxColumn";
            this.lowerWarningDataGridViewTextBoxColumn.Width = 70;
            // 
            // upperWarningDataGridViewTextBoxColumn
            // 
            this.upperWarningDataGridViewTextBoxColumn.DataPropertyName = "UpperWarning";
            this.upperWarningDataGridViewTextBoxColumn.HeaderText = "UpperWarning";
            this.upperWarningDataGridViewTextBoxColumn.MinimumWidth = 70;
            this.upperWarningDataGridViewTextBoxColumn.Name = "upperWarningDataGridViewTextBoxColumn";
            this.upperWarningDataGridViewTextBoxColumn.Width = 70;
            // 
            // maxValueDataGridViewTextBoxColumn
            // 
            this.maxValueDataGridViewTextBoxColumn.DataPropertyName = "MaxValue";
            this.maxValueDataGridViewTextBoxColumn.HeaderText = "MaxValue";
            this.maxValueDataGridViewTextBoxColumn.MinimumWidth = 70;
            this.maxValueDataGridViewTextBoxColumn.Name = "maxValueDataGridViewTextBoxColumn";
            this.maxValueDataGridViewTextBoxColumn.Width = 70;
            // 
            // Current
            // 
            this.Current.HeaderText = "Current";
            this.Current.Name = "Current";
            this.Current.Width = 50;
            // 
            // CheckResult
            // 
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle5.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.CheckResult.DefaultCellStyle = dataGridViewCellStyle5;
            this.CheckResult.HeaderText = "";
            this.CheckResult.MinimumWidth = 40;
            this.CheckResult.Name = "CheckResult";
            this.CheckResult.Resizable = System.Windows.Forms.DataGridViewTriState.False;
            this.CheckResult.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            this.CheckResult.Width = 40;
            // 
            // cLClientLimitsBindingSource1
            // 
            this.cLClientLimitsBindingSource1.DataMember = "_CL_ClientLimits";
            this.cLClientLimitsBindingSource1.DataSource = this.lC3_devDataSet;
            // 
            // cbClients
            // 
            this.cbClients.DataSource = this.cLClientsBindingSource2;
            this.cbClients.DisplayMember = "ПолноеНаименование";
            this.cbClients.FormattingEnabled = true;
            this.cbClients.Location = new System.Drawing.Point(645, 11);
            this.cbClients.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cbClients.Name = "cbClients";
            this.cbClients.Size = new System.Drawing.Size(399, 21);
            this.cbClients.TabIndex = 2;
            this.cbClients.ValueMember = "КодКлиента";
            this.cbClients.SelectionChangeCommitted += new System.EventHandler(this.FilterCL);
            // 
            // cLClientsBindingSource2
            // 
            this.cLClientsBindingSource2.DataMember = "_CL_Clients";
            this.cLClientsBindingSource2.DataSource = this.lC3_devDataSet;
            // 
            // cbCL
            // 
            this.cbCL.DataSource = this.cLCLBindingSource;
            this.cbCL.DisplayMember = "Name";
            this.cbCL.FormattingEnabled = true;
            this.cbCL.Location = new System.Drawing.Point(105, 11);
            this.cbCL.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cbCL.Name = "cbCL";
            this.cbCL.Size = new System.Drawing.Size(461, 21);
            this.cbCL.TabIndex = 1;
            this.cbCL.ValueMember = "Id";
            this.cbCL.SelectionChangeCommitted += new System.EventHandler(this.FilterCL);
            // 
            // cLCLBindingSource
            // 
            this.cLCLBindingSource.DataMember = "_CL_CL";
            this.cLCLBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // cLClientsBindingSource1
            // 
            this.cLClientsBindingSource1.DataMember = "_CL_Clients";
            this.cLClientsBindingSource1.DataSource = this.lC3_devDataSet;
            // 
            // tp_LimitSettings
            // 
            this.tp_LimitSettings.Controls.Add(this.pCL);
            this.tp_LimitSettings.Controls.Add(this.pParams);
            this.tp_LimitSettings.Location = new System.Drawing.Point(4, 22);
            this.tp_LimitSettings.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.tp_LimitSettings.Name = "tp_LimitSettings";
            this.tp_LimitSettings.Padding = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.tp_LimitSettings.Size = new System.Drawing.Size(1470, 921);
            this.tp_LimitSettings.TabIndex = 0;
            this.tp_LimitSettings.Text = "Настройки лимитов";
            this.tp_LimitSettings.UseVisualStyleBackColor = true;
            // 
            // pCL
            // 
            this.pCL.BackColor = System.Drawing.Color.DarkGray;
            this.pCL.Controls.Add(this.l_NOT_Complex);
            this.pCL.Controls.Add(this.dg_CL);
            this.pCL.Controls.Add(this.bt_Add);
            this.pCL.Controls.Add(this.bt_DeleteObj);
            this.pCL.Controls.Add(this.bt_Edit);
            this.pCL.Controls.Add(this.bt_EditObj);
            this.pCL.Controls.Add(this.bt_Delete);
            this.pCL.Controls.Add(this.bt_AddObj);
            this.pCL.Controls.Add(this.dg_Objects);
            this.pCL.Controls.Add(this.l_Limit_Head);
            this.pCL.Dock = System.Windows.Forms.DockStyle.Left;
            this.pCL.Location = new System.Drawing.Point(4, 5);
            this.pCL.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.pCL.Name = "pCL";
            this.pCL.Size = new System.Drawing.Size(615, 911);
            this.pCL.TabIndex = 12;
            // 
            // l_NOT_Complex
            // 
            this.l_NOT_Complex.AutoSize = true;
            this.l_NOT_Complex.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.l_NOT_Complex.ForeColor = System.Drawing.Color.Maroon;
            this.l_NOT_Complex.Location = new System.Drawing.Point(67, 716);
            this.l_NOT_Complex.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.l_NOT_Complex.Name = "l_NOT_Complex";
            this.l_NOT_Complex.Size = new System.Drawing.Size(290, 15);
            this.l_NOT_Complex.TabIndex = 10;
            this.l_NOT_Complex.Text = "Лимит реализуется отдельным запросом!";
            this.l_NOT_Complex.Visible = false;
            // 
            // dg_CL
            // 
            this.dg_CL.AllowUserToAddRows = false;
            this.dg_CL.AllowUserToDeleteRows = false;
            this.dg_CL.AllowUserToOrderColumns = true;
            this.dg_CL.AllowUserToResizeColumns = false;
            this.dg_CL.AllowUserToResizeRows = false;
            this.dg_CL.AutoGenerateColumns = false;
            this.dg_CL.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dg_CL.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.idDataGridViewTextBoxColumn,
            this.nameDataGridViewTextBoxColumn,
            this.conditionDataGridViewTextBoxColumn,
            this.GroupByEmit,
            this.GroupByInstr,
            this.IsComplex,
            this.LimitQuery,
            this.FTId});
            this.dg_CL.DataSource = this.cLBindingSource;
            this.dg_CL.Location = new System.Drawing.Point(48, 20);
            this.dg_CL.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.dg_CL.Name = "dg_CL";
            this.dg_CL.ReadOnly = true;
            this.dg_CL.RowHeadersWidth = 5;
            this.dg_CL.RowTemplate.ReadOnly = true;
            this.dg_CL.Size = new System.Drawing.Size(553, 608);
            this.dg_CL.TabIndex = 0;
            this.dg_CL.CellEnter += new System.Windows.Forms.DataGridViewCellEventHandler(this.SetActiveCL);
            // 
            // idDataGridViewTextBoxColumn
            // 
            this.idDataGridViewTextBoxColumn.DataPropertyName = "Id";
            this.idDataGridViewTextBoxColumn.HeaderText = "Id";
            this.idDataGridViewTextBoxColumn.MinimumWidth = 50;
            this.idDataGridViewTextBoxColumn.Name = "idDataGridViewTextBoxColumn";
            this.idDataGridViewTextBoxColumn.ReadOnly = true;
            this.idDataGridViewTextBoxColumn.Width = 50;
            // 
            // nameDataGridViewTextBoxColumn
            // 
            this.nameDataGridViewTextBoxColumn.DataPropertyName = "Name";
            this.nameDataGridViewTextBoxColumn.HeaderText = "Name";
            this.nameDataGridViewTextBoxColumn.MinimumWidth = 300;
            this.nameDataGridViewTextBoxColumn.Name = "nameDataGridViewTextBoxColumn";
            this.nameDataGridViewTextBoxColumn.ReadOnly = true;
            this.nameDataGridViewTextBoxColumn.Width = 300;
            // 
            // conditionDataGridViewTextBoxColumn
            // 
            this.conditionDataGridViewTextBoxColumn.DataPropertyName = "Condition";
            this.conditionDataGridViewTextBoxColumn.HeaderText = "Condition";
            this.conditionDataGridViewTextBoxColumn.Name = "conditionDataGridViewTextBoxColumn";
            this.conditionDataGridViewTextBoxColumn.ReadOnly = true;
            this.conditionDataGridViewTextBoxColumn.Visible = false;
            // 
            // GroupByEmit
            // 
            this.GroupByEmit.DataPropertyName = "GroupByEmit";
            this.GroupByEmit.HeaderText = "Emitent";
            this.GroupByEmit.MinimumWidth = 40;
            this.GroupByEmit.Name = "GroupByEmit";
            this.GroupByEmit.ReadOnly = true;
            this.GroupByEmit.Width = 40;
            // 
            // GroupByInstr
            // 
            this.GroupByInstr.DataPropertyName = "GroupByInstr";
            this.GroupByInstr.HeaderText = "Instr";
            this.GroupByInstr.MinimumWidth = 40;
            this.GroupByInstr.Name = "GroupByInstr";
            this.GroupByInstr.ReadOnly = true;
            this.GroupByInstr.Width = 40;
            // 
            // IsComplex
            // 
            this.IsComplex.DataPropertyName = "IsComplex";
            this.IsComplex.HeaderText = "Complex";
            this.IsComplex.MinimumWidth = 50;
            this.IsComplex.Name = "IsComplex";
            this.IsComplex.ReadOnly = true;
            this.IsComplex.Width = 50;
            // 
            // LimitQuery
            // 
            this.LimitQuery.DataPropertyName = "LimitQuery";
            this.LimitQuery.HeaderText = "LimitQuery";
            this.LimitQuery.Name = "LimitQuery";
            this.LimitQuery.ReadOnly = true;
            this.LimitQuery.Visible = false;
            // 
            // FTId
            // 
            this.FTId.DataPropertyName = "FTId";
            this.FTId.HeaderText = "FTId";
            this.FTId.MinimumWidth = 30;
            this.FTId.Name = "FTId";
            this.FTId.ReadOnly = true;
            this.FTId.Width = 30;
            // 
            // bt_Add
            // 
            this.bt_Add.AccessibleDescription = "";
            this.bt_Add.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("bt_Add.BackgroundImage")));
            this.bt_Add.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.bt_Add.Location = new System.Drawing.Point(4, 20);
            this.bt_Add.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.bt_Add.Name = "bt_Add";
            this.bt_Add.Size = new System.Drawing.Size(36, 36);
            this.bt_Add.TabIndex = 1;
            this.bt_Add.Tag = "Add new Limit";
            this.bt_Add.UseVisualStyleBackColor = true;
            this.bt_Add.Click += new System.EventHandler(this.bt_Add_Click);
            // 
            // bt_DeleteObj
            // 
            this.bt_DeleteObj.AccessibleDescription = "";
            this.bt_DeleteObj.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("bt_DeleteObj.BackgroundImage")));
            this.bt_DeleteObj.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.bt_DeleteObj.Location = new System.Drawing.Point(5, 774);
            this.bt_DeleteObj.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.bt_DeleteObj.Name = "bt_DeleteObj";
            this.bt_DeleteObj.Size = new System.Drawing.Size(36, 36);
            this.bt_DeleteObj.TabIndex = 9;
            this.bt_DeleteObj.Tag = "Add new Limit";
            this.bt_DeleteObj.UseVisualStyleBackColor = true;
            this.bt_DeleteObj.Click += new System.EventHandler(this.bt_DeleteObj_Click);
            // 
            // bt_Edit
            // 
            this.bt_Edit.AccessibleDescription = "";
            this.bt_Edit.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("bt_Edit.BackgroundImage")));
            this.bt_Edit.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.bt_Edit.Location = new System.Drawing.Point(4, 66);
            this.bt_Edit.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.bt_Edit.Name = "bt_Edit";
            this.bt_Edit.Size = new System.Drawing.Size(36, 36);
            this.bt_Edit.TabIndex = 3;
            this.bt_Edit.Tag = "Add new Limit";
            this.bt_Edit.UseVisualStyleBackColor = true;
            this.bt_Edit.Click += new System.EventHandler(this.bt_Edit_Click);
            // 
            // bt_EditObj
            // 
            this.bt_EditObj.AccessibleDescription = "";
            this.bt_EditObj.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("bt_EditObj.BackgroundImage")));
            this.bt_EditObj.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.bt_EditObj.Location = new System.Drawing.Point(5, 728);
            this.bt_EditObj.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.bt_EditObj.Name = "bt_EditObj";
            this.bt_EditObj.Size = new System.Drawing.Size(36, 36);
            this.bt_EditObj.TabIndex = 8;
            this.bt_EditObj.Tag = "Add new Limit";
            this.bt_EditObj.UseVisualStyleBackColor = true;
            this.bt_EditObj.Click += new System.EventHandler(this.bt_EditObj_Click);
            // 
            // bt_Delete
            // 
            this.bt_Delete.AccessibleDescription = "";
            this.bt_Delete.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("bt_Delete.BackgroundImage")));
            this.bt_Delete.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.bt_Delete.Location = new System.Drawing.Point(5, 112);
            this.bt_Delete.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.bt_Delete.Name = "bt_Delete";
            this.bt_Delete.Size = new System.Drawing.Size(36, 36);
            this.bt_Delete.TabIndex = 4;
            this.bt_Delete.Tag = "Add new Limit";
            this.bt_Delete.UseVisualStyleBackColor = true;
            this.bt_Delete.Click += new System.EventHandler(this.bt_Delete_Click);
            // 
            // bt_AddObj
            // 
            this.bt_AddObj.AccessibleDescription = "";
            this.bt_AddObj.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("bt_AddObj.BackgroundImage")));
            this.bt_AddObj.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.bt_AddObj.Location = new System.Drawing.Point(4, 682);
            this.bt_AddObj.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.bt_AddObj.Name = "bt_AddObj";
            this.bt_AddObj.Size = new System.Drawing.Size(36, 36);
            this.bt_AddObj.TabIndex = 7;
            this.bt_AddObj.Tag = "Add new Limit";
            this.bt_AddObj.UseVisualStyleBackColor = true;
            this.bt_AddObj.Click += new System.EventHandler(this.bt_AddObj_Click);
            // 
            // dg_Objects
            // 
            this.dg_Objects.AllowUserToAddRows = false;
            this.dg_Objects.AllowUserToDeleteRows = false;
            this.dg_Objects.AutoGenerateColumns = false;
            this.dg_Objects.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dg_Objects.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.idDataGridViewTextBoxColumn1,
            this.nameDataGridViewTextBoxColumn1});
            this.dg_Objects.DataSource = this.cLObjectsBindingSource;
            this.dg_Objects.Location = new System.Drawing.Point(48, 682);
            this.dg_Objects.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.dg_Objects.Name = "dg_Objects";
            this.dg_Objects.RowHeadersWidth = 5;
            this.dg_Objects.Size = new System.Drawing.Size(553, 217);
            this.dg_Objects.TabIndex = 6;
            this.dg_Objects.CellEnter += new System.Windows.Forms.DataGridViewCellEventHandler(this.SetActiveObj);
            // 
            // idDataGridViewTextBoxColumn1
            // 
            this.idDataGridViewTextBoxColumn1.DataPropertyName = "Id";
            this.idDataGridViewTextBoxColumn1.HeaderText = "Id";
            this.idDataGridViewTextBoxColumn1.MinimumWidth = 50;
            this.idDataGridViewTextBoxColumn1.Name = "idDataGridViewTextBoxColumn1";
            this.idDataGridViewTextBoxColumn1.ReadOnly = true;
            this.idDataGridViewTextBoxColumn1.Width = 50;
            // 
            // nameDataGridViewTextBoxColumn1
            // 
            this.nameDataGridViewTextBoxColumn1.DataPropertyName = "Name";
            this.nameDataGridViewTextBoxColumn1.HeaderText = "Name";
            this.nameDataGridViewTextBoxColumn1.MinimumWidth = 300;
            this.nameDataGridViewTextBoxColumn1.Name = "nameDataGridViewTextBoxColumn1";
            this.nameDataGridViewTextBoxColumn1.Width = 300;
            // 
            // l_Limit_Head
            // 
            this.l_Limit_Head.AutoSize = true;
            this.l_Limit_Head.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.l_Limit_Head.Location = new System.Drawing.Point(49, 643);
            this.l_Limit_Head.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.l_Limit_Head.MaximumSize = new System.Drawing.Size(530, 0);
            this.l_Limit_Head.Name = "l_Limit_Head";
            this.l_Limit_Head.Size = new System.Drawing.Size(50, 17);
            this.l_Limit_Head.TabIndex = 5;
            this.l_Limit_Head.Text = "Лимит";
            // 
            // pParams
            // 
            this.pParams.AutoScroll = true;
            this.pParams.BackColor = System.Drawing.Color.DarkGray;
            this.pParams.Controls.Add(this.bSaveCond);
            this.pParams.Controls.Add(this.l_Object_Head);
            this.pParams.Dock = System.Windows.Forms.DockStyle.Right;
            this.pParams.Location = new System.Drawing.Point(627, 5);
            this.pParams.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.pParams.Name = "pParams";
            this.pParams.Size = new System.Drawing.Size(839, 911);
            this.pParams.TabIndex = 11;
            // 
            // bSaveCond
            // 
            this.bSaveCond.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.bSaveCond.Location = new System.Drawing.Point(404, 112);
            this.bSaveCond.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.bSaveCond.Name = "bSaveCond";
            this.bSaveCond.Size = new System.Drawing.Size(172, 35);
            this.bSaveCond.TabIndex = 11;
            this.bSaveCond.Text = "Сохранить";
            this.bSaveCond.UseVisualStyleBackColor = false;
            this.bSaveCond.Click += new System.EventHandler(this.bSaveCond_Click);
            // 
            // l_Object_Head
            // 
            this.l_Object_Head.AutoSize = true;
            this.l_Object_Head.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.l_Object_Head.Location = new System.Drawing.Point(20, 12);
            this.l_Object_Head.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.l_Object_Head.Name = "l_Object_Head";
            this.l_Object_Head.Size = new System.Drawing.Size(58, 17);
            this.l_Object_Head.TabIndex = 10;
            this.l_Object_Head.Text = "Объект";
            // 
            // tc_Main
            // 
            this.tc_Main.Controls.Add(this.tp_Restrictions);
            this.tc_Main.Controls.Add(this.tp_Portfolio);
            this.tc_Main.Controls.Add(this.tp_Ierarchy);
            this.tc_Main.Controls.Add(this.tp_groups);
            this.tc_Main.Controls.Add(this.tp_RL);
            this.tc_Main.Controls.Add(this.tp_AUList);
            this.tc_Main.Controls.Add(this.tp_LimitSettings);
            this.tc_Main.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tc_Main.Location = new System.Drawing.Point(0, 0);
            this.tc_Main.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.tc_Main.Name = "tc_Main";
            this.tc_Main.SelectedIndex = 0;
            this.tc_Main.Size = new System.Drawing.Size(1478, 947);
            this.tc_Main.TabIndex = 13;
            this.tc_Main.Enter += new System.EventHandler(this.ClientLimits_Enter);
            // 
            // tp_Ierarchy
            // 
            this.tp_Ierarchy.Controls.Add(this.dgv_Ierarchy);
            this.tp_Ierarchy.Controls.Add(this.cb_IerarchyClient);
            this.tp_Ierarchy.Controls.Add(this.l_Client3);
            this.tp_Ierarchy.Location = new System.Drawing.Point(4, 22);
            this.tp_Ierarchy.Name = "tp_Ierarchy";
            this.tp_Ierarchy.Padding = new System.Windows.Forms.Padding(3);
            this.tp_Ierarchy.Size = new System.Drawing.Size(1470, 921);
            this.tp_Ierarchy.TabIndex = 6;
            this.tp_Ierarchy.Text = "Иехархия";
            this.tp_Ierarchy.UseVisualStyleBackColor = true;
            // 
            // dgv_Ierarchy
            // 
            this.dgv_Ierarchy.AllowUserToAddRows = false;
            this.dgv_Ierarchy.AllowUserToDeleteRows = false;
            this.dgv_Ierarchy.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_Ierarchy.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.С2,
            this.C3,
            this.C4});
            this.dgv_Ierarchy.Location = new System.Drawing.Point(11, 54);
            this.dgv_Ierarchy.Name = "dgv_Ierarchy";
            this.dgv_Ierarchy.ReadOnly = true;
            this.dgv_Ierarchy.RowHeadersWidth = 25;
            this.dgv_Ierarchy.Size = new System.Drawing.Size(1012, 843);
            this.dgv_Ierarchy.TabIndex = 6;
            // 
            // С2
            // 
            this.С2.HeaderText = "Группа / Эмитент / Бумага";
            this.С2.Name = "С2";
            this.С2.ReadOnly = true;
            this.С2.Width = 500;
            // 
            // C3
            // 
            this.C3.HeaderText = "Текущий %";
            this.C3.Name = "C3";
            this.C3.ReadOnly = true;
            // 
            // C4
            // 
            this.C4.HeaderText = "Лимит %";
            this.C4.Name = "C4";
            this.C4.ReadOnly = true;
            // 
            // cb_IerarchyClient
            // 
            this.cb_IerarchyClient.DataSource = this.cLClientsBindingSource3;
            this.cb_IerarchyClient.DisplayMember = "ПолноеНаименование";
            this.cb_IerarchyClient.FormattingEnabled = true;
            this.cb_IerarchyClient.Location = new System.Drawing.Point(58, 17);
            this.cb_IerarchyClient.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cb_IerarchyClient.Name = "cb_IerarchyClient";
            this.cb_IerarchyClient.Size = new System.Drawing.Size(430, 21);
            this.cb_IerarchyClient.TabIndex = 5;
            this.cb_IerarchyClient.ValueMember = "КодКлиента";
            this.cb_IerarchyClient.SelectedIndexChanged += new System.EventHandler(this.Draw_Ierarchy);
            // 
            // l_Client3
            // 
            this.l_Client3.AutoSize = true;
            this.l_Client3.Location = new System.Drawing.Point(8, 20);
            this.l_Client3.Name = "l_Client3";
            this.l_Client3.Size = new System.Drawing.Size(43, 13);
            this.l_Client3.TabIndex = 4;
            this.l_Client3.Text = "Клиент";
            // 
            // tp_AUList
            // 
            this.tp_AUList.Controls.Add(this.tb_AU_InnerName);
            this.tp_AUList.Controls.Add(this.l_AU_InnerName);
            this.tp_AUList.Controls.Add(this.b_Form);
            this.tp_AUList.Controls.Add(this.b_AU_AddUpdate);
            this.tp_AUList.Controls.Add(this.tb_AU_Comment);
            this.tp_AUList.Controls.Add(this.l_AU_Comment);
            this.tp_AUList.Controls.Add(this.l_AU_SubType);
            this.tp_AUList.Controls.Add(this.cb_AU_SubTypes);
            this.tp_AUList.Controls.Add(this.l_AU_rid);
            this.tp_AUList.Controls.Add(this.l_Find);
            this.tp_AUList.Controls.Add(this.tb_AU_FindContr);
            this.tp_AUList.Controls.Add(this.cb_AU_contr);
            this.tp_AUList.Controls.Add(this.dgv_AUList);
            this.tp_AUList.Location = new System.Drawing.Point(4, 22);
            this.tp_AUList.Name = "tp_AUList";
            this.tp_AUList.Size = new System.Drawing.Size(1470, 921);
            this.tp_AUList.TabIndex = 5;
            this.tp_AUList.Text = "Списки к совету (АУ)";
            this.tp_AUList.UseVisualStyleBackColor = true;
            // 
            // tb_AU_InnerName
            // 
            this.tb_AU_InnerName.Location = new System.Drawing.Point(1073, 193);
            this.tb_AU_InnerName.Name = "tb_AU_InnerName";
            this.tb_AU_InnerName.Size = new System.Drawing.Size(389, 20);
            this.tb_AU_InnerName.TabIndex = 12;
            // 
            // l_AU_InnerName
            // 
            this.l_AU_InnerName.AutoSize = true;
            this.l_AU_InnerName.Location = new System.Drawing.Point(1070, 173);
            this.l_AU_InnerName.Name = "l_AU_InnerName";
            this.l_AU_InnerName.Size = new System.Drawing.Size(143, 13);
            this.l_AU_InnerName.TabIndex = 11;
            this.l_AU_InnerName.Text = "Внутреннее наименование";
            // 
            // b_Form
            // 
            this.b_Form.Location = new System.Drawing.Point(1084, 878);
            this.b_Form.Name = "b_Form";
            this.b_Form.Size = new System.Drawing.Size(105, 23);
            this.b_Form.TabIndex = 10;
            this.b_Form.Text = "Сформировать";
            this.b_Form.UseVisualStyleBackColor = true;
            this.b_Form.Click += new System.EventHandler(this.AU_FormList);
            // 
            // b_AU_AddUpdate
            // 
            this.b_AU_AddUpdate.Location = new System.Drawing.Point(1073, 336);
            this.b_AU_AddUpdate.Name = "b_AU_AddUpdate";
            this.b_AU_AddUpdate.Size = new System.Drawing.Size(154, 23);
            this.b_AU_AddUpdate.TabIndex = 9;
            this.b_AU_AddUpdate.Text = "Добавить / обновить";
            this.b_AU_AddUpdate.UseVisualStyleBackColor = true;
            this.b_AU_AddUpdate.Click += new System.EventHandler(this.AU_AddUpdateList);
            // 
            // tb_AU_Comment
            // 
            this.tb_AU_Comment.Location = new System.Drawing.Point(1073, 250);
            this.tb_AU_Comment.Multiline = true;
            this.tb_AU_Comment.Name = "tb_AU_Comment";
            this.tb_AU_Comment.Size = new System.Drawing.Size(389, 68);
            this.tb_AU_Comment.TabIndex = 8;
            // 
            // l_AU_Comment
            // 
            this.l_AU_Comment.AutoSize = true;
            this.l_AU_Comment.Location = new System.Drawing.Point(1070, 230);
            this.l_AU_Comment.Name = "l_AU_Comment";
            this.l_AU_Comment.Size = new System.Drawing.Size(77, 13);
            this.l_AU_Comment.TabIndex = 7;
            this.l_AU_Comment.Text = "Комментарий";
            // 
            // l_AU_SubType
            // 
            this.l_AU_SubType.AutoSize = true;
            this.l_AU_SubType.Location = new System.Drawing.Point(1070, 137);
            this.l_AU_SubType.Name = "l_AU_SubType";
            this.l_AU_SubType.Size = new System.Drawing.Size(44, 13);
            this.l_AU_SubType.TabIndex = 6;
            this.l_AU_SubType.Text = "Тип ЦБ";
            // 
            // cb_AU_SubTypes
            // 
            this.cb_AU_SubTypes.DataSource = this.cLlstSubtypesBindingSource;
            this.cb_AU_SubTypes.DisplayMember = "Name";
            this.cb_AU_SubTypes.FormattingEnabled = true;
            this.cb_AU_SubTypes.Location = new System.Drawing.Point(1137, 134);
            this.cb_AU_SubTypes.Name = "cb_AU_SubTypes";
            this.cb_AU_SubTypes.Size = new System.Drawing.Size(325, 21);
            this.cb_AU_SubTypes.TabIndex = 5;
            this.cb_AU_SubTypes.ValueMember = "Value";
            // 
            // cLlstSubtypesBindingSource
            // 
            this.cLlstSubtypesBindingSource.DataMember = "CLlst_Subtypes";
            this.cLlstSubtypesBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // l_AU_rid
            // 
            this.l_AU_rid.AutoSize = true;
            this.l_AU_rid.Location = new System.Drawing.Point(1070, 96);
            this.l_AU_rid.Name = "l_AU_rid";
            this.l_AU_rid.Size = new System.Drawing.Size(67, 13);
            this.l_AU_rid.TabIndex = 4;
            this.l_AU_rid.Text = "Not selected";
            // 
            // l_Find
            // 
            this.l_Find.AutoSize = true;
            this.l_Find.Location = new System.Drawing.Point(1070, 27);
            this.l_Find.Name = "l_Find";
            this.l_Find.Size = new System.Drawing.Size(90, 13);
            this.l_Find.TabIndex = 3;
            this.l_Find.Text = "Поиск эмитента";
            // 
            // tb_AU_FindContr
            // 
            this.tb_AU_FindContr.Location = new System.Drawing.Point(1182, 24);
            this.tb_AU_FindContr.Name = "tb_AU_FindContr";
            this.tb_AU_FindContr.Size = new System.Drawing.Size(280, 20);
            this.tb_AU_FindContr.TabIndex = 2;
            this.tb_AU_FindContr.KeyUp += new System.Windows.Forms.KeyEventHandler(this.AU_FindContr);
            // 
            // cb_AU_contr
            // 
            this.cb_AU_contr.DataSource = this.cLContragentsBindingSource;
            this.cb_AU_contr.DisplayMember = "name";
            this.cb_AU_contr.FormattingEnabled = true;
            this.cb_AU_contr.Location = new System.Drawing.Point(1073, 61);
            this.cb_AU_contr.Name = "cb_AU_contr";
            this.cb_AU_contr.Size = new System.Drawing.Size(389, 21);
            this.cb_AU_contr.TabIndex = 1;
            this.cb_AU_contr.ValueMember = "rid";
            this.cb_AU_contr.SelectedIndexChanged += new System.EventHandler(this.AU_Contr_Changed);
            // 
            // dgv_AUList
            // 
            this.dgv_AUList.AllowUserToAddRows = false;
            this.dgv_AUList.AllowUserToDeleteRows = false;
            this.dgv_AUList.AutoGenerateColumns = false;
            this.dgv_AUList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_AUList.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.contridDataGridViewTextBoxColumn1,
            this.nameDataGridViewTextBoxColumn4,
            this.InnerName,
            this.typeDataGridViewTextBoxColumn1,
            this.ratingDataGridViewTextBoxColumn,
            this.ownRatingDataGridViewTextBoxColumn,
            this.ownCommentDataGridViewTextBoxColumn,
            this.qsheetDataGridViewTextBoxColumn,
            this.inIndexDataGridViewTextBoxColumn,
            this.remarkDataGridViewTextBoxColumn,
            this.Column2});
            this.dgv_AUList.DataSource = this.aUListWithParamsBindingSource;
            this.dgv_AUList.Location = new System.Drawing.Point(22, 24);
            this.dgv_AUList.Name = "dgv_AUList";
            this.dgv_AUList.RowHeadersWidth = 5;
            this.dgv_AUList.Size = new System.Drawing.Size(1029, 877);
            this.dgv_AUList.TabIndex = 0;
            this.dgv_AUList.CellEnter += new System.Windows.Forms.DataGridViewCellEventHandler(this.AU_ListEnter);
            // 
            // contridDataGridViewTextBoxColumn1
            // 
            this.contridDataGridViewTextBoxColumn1.DataPropertyName = "contrid";
            this.contridDataGridViewTextBoxColumn1.HeaderText = "contrid";
            this.contridDataGridViewTextBoxColumn1.MinimumWidth = 2;
            this.contridDataGridViewTextBoxColumn1.Name = "contridDataGridViewTextBoxColumn1";
            this.contridDataGridViewTextBoxColumn1.ReadOnly = true;
            this.contridDataGridViewTextBoxColumn1.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.contridDataGridViewTextBoxColumn1.Visible = false;
            this.contridDataGridViewTextBoxColumn1.Width = 2;
            // 
            // nameDataGridViewTextBoxColumn4
            // 
            this.nameDataGridViewTextBoxColumn4.DataPropertyName = "name";
            this.nameDataGridViewTextBoxColumn4.HeaderText = "name SDH";
            this.nameDataGridViewTextBoxColumn4.MinimumWidth = 150;
            this.nameDataGridViewTextBoxColumn4.Name = "nameDataGridViewTextBoxColumn4";
            this.nameDataGridViewTextBoxColumn4.Width = 150;
            // 
            // InnerName
            // 
            this.InnerName.DataPropertyName = "InnerName";
            this.InnerName.HeaderText = "InnerName";
            this.InnerName.MinimumWidth = 150;
            this.InnerName.Name = "InnerName";
            this.InnerName.Width = 150;
            // 
            // typeDataGridViewTextBoxColumn1
            // 
            this.typeDataGridViewTextBoxColumn1.DataPropertyName = "Type";
            this.typeDataGridViewTextBoxColumn1.HeaderText = "Type";
            this.typeDataGridViewTextBoxColumn1.MinimumWidth = 40;
            this.typeDataGridViewTextBoxColumn1.Name = "typeDataGridViewTextBoxColumn1";
            this.typeDataGridViewTextBoxColumn1.Width = 40;
            // 
            // ratingDataGridViewTextBoxColumn
            // 
            this.ratingDataGridViewTextBoxColumn.DataPropertyName = "Rating";
            this.ratingDataGridViewTextBoxColumn.HeaderText = "Rating";
            this.ratingDataGridViewTextBoxColumn.MinimumWidth = 180;
            this.ratingDataGridViewTextBoxColumn.Name = "ratingDataGridViewTextBoxColumn";
            this.ratingDataGridViewTextBoxColumn.ReadOnly = true;
            this.ratingDataGridViewTextBoxColumn.Width = 180;
            // 
            // ownRatingDataGridViewTextBoxColumn
            // 
            this.ownRatingDataGridViewTextBoxColumn.DataPropertyName = "Own_Rating";
            this.ownRatingDataGridViewTextBoxColumn.HeaderText = "Inner";
            this.ownRatingDataGridViewTextBoxColumn.MinimumWidth = 40;
            this.ownRatingDataGridViewTextBoxColumn.Name = "ownRatingDataGridViewTextBoxColumn";
            this.ownRatingDataGridViewTextBoxColumn.Width = 40;
            // 
            // ownCommentDataGridViewTextBoxColumn
            // 
            this.ownCommentDataGridViewTextBoxColumn.DataPropertyName = "Own_Comment";
            this.ownCommentDataGridViewTextBoxColumn.HeaderText = "Risk";
            this.ownCommentDataGridViewTextBoxColumn.MinimumWidth = 70;
            this.ownCommentDataGridViewTextBoxColumn.Name = "ownCommentDataGridViewTextBoxColumn";
            this.ownCommentDataGridViewTextBoxColumn.Width = 70;
            // 
            // qsheetDataGridViewTextBoxColumn
            // 
            this.qsheetDataGridViewTextBoxColumn.DataPropertyName = "qsheet";
            this.qsheetDataGridViewTextBoxColumn.HeaderText = "Sheet";
            this.qsheetDataGridViewTextBoxColumn.MinimumWidth = 40;
            this.qsheetDataGridViewTextBoxColumn.Name = "qsheetDataGridViewTextBoxColumn";
            this.qsheetDataGridViewTextBoxColumn.Width = 40;
            // 
            // inIndexDataGridViewTextBoxColumn
            // 
            this.inIndexDataGridViewTextBoxColumn.DataPropertyName = "InIndex";
            this.inIndexDataGridViewTextBoxColumn.HeaderText = "Index";
            this.inIndexDataGridViewTextBoxColumn.MinimumWidth = 40;
            this.inIndexDataGridViewTextBoxColumn.Name = "inIndexDataGridViewTextBoxColumn";
            this.inIndexDataGridViewTextBoxColumn.ReadOnly = true;
            this.inIndexDataGridViewTextBoxColumn.Width = 40;
            // 
            // remarkDataGridViewTextBoxColumn
            // 
            this.remarkDataGridViewTextBoxColumn.DataPropertyName = "Remark";
            this.remarkDataGridViewTextBoxColumn.HeaderText = "Remark";
            this.remarkDataGridViewTextBoxColumn.MinimumWidth = 250;
            this.remarkDataGridViewTextBoxColumn.Name = "remarkDataGridViewTextBoxColumn";
            this.remarkDataGridViewTextBoxColumn.Width = 250;
            // 
            // Column2
            // 
            this.Column2.HeaderText = "";
            this.Column2.Image = ((System.Drawing.Image)(resources.GetObject("Column2.Image")));
            this.Column2.MinimumWidth = 30;
            this.Column2.Name = "Column2";
            this.Column2.Width = 30;
            // 
            // aUListWithParamsBindingSource
            // 
            this.aUListWithParamsBindingSource.DataMember = "AU_ListWithParams";
            this.aUListWithParamsBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // _CL_CLTableAdapter
            // 
            this._CL_CLTableAdapter.ClearBeforeFill = true;
            // 
            // _CL_ClientLimitsTableAdapter
            // 
            this._CL_ClientLimitsTableAdapter.ClearBeforeFill = true;
            // 
            // factTableTableAdapter
            // 
            this.factTableTableAdapter.ClearBeforeFill = true;
            // 
            // factTablesListTableAdapter
            // 
            this.factTablesListTableAdapter.ClearBeforeFill = true;
            // 
            // aU_ListWithParamsTableAdapter
            // 
            this.aU_ListWithParamsTableAdapter.ClearBeforeFill = true;
            // 
            // cLlst_SubtypesTableAdapter
            // 
            this.cLlst_SubtypesTableAdapter.ClearBeforeFill = true;
            // 
            // lC3_devDataSet1
            // 
            this.lC3_devDataSet1.DataSetName = "LC3_devDataSet1";
            this.lC3_devDataSet1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // fT_ViewTableAdapter
            // 
            this.fT_ViewTableAdapter.ClearBeforeFill = true;
            // 
            // clientCodeDataGridViewTextBoxColumn2
            // 
            this.clientCodeDataGridViewTextBoxColumn2.DataPropertyName = "ClientCode";
            dataGridViewCellStyle6.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.clientCodeDataGridViewTextBoxColumn2.DefaultCellStyle = dataGridViewCellStyle6;
            this.clientCodeDataGridViewTextBoxColumn2.Frozen = true;
            this.clientCodeDataGridViewTextBoxColumn2.HeaderText = "Клиент";
            this.clientCodeDataGridViewTextBoxColumn2.Name = "clientCodeDataGridViewTextBoxColumn2";
            this.clientCodeDataGridViewTextBoxColumn2.Width = 60;
            // 
            // instrumentNameDataGridViewTextBoxColumn1
            // 
            this.instrumentNameDataGridViewTextBoxColumn1.DataPropertyName = "InstrumentName";
            dataGridViewCellStyle7.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.instrumentNameDataGridViewTextBoxColumn1.DefaultCellStyle = dataGridViewCellStyle7;
            this.instrumentNameDataGridViewTextBoxColumn1.Frozen = true;
            this.instrumentNameDataGridViewTextBoxColumn1.HeaderText = "Инструмент";
            this.instrumentNameDataGridViewTextBoxColumn1.Name = "instrumentNameDataGridViewTextBoxColumn1";
            this.instrumentNameDataGridViewTextBoxColumn1.Width = 120;
            // 
            // issuerDataGridViewTextBoxColumn1
            // 
            this.issuerDataGridViewTextBoxColumn1.DataPropertyName = "Issuer";
            dataGridViewCellStyle8.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.issuerDataGridViewTextBoxColumn1.DefaultCellStyle = dataGridViewCellStyle8;
            this.issuerDataGridViewTextBoxColumn1.Frozen = true;
            this.issuerDataGridViewTextBoxColumn1.HeaderText = "Эмитент";
            this.issuerDataGridViewTextBoxColumn1.Name = "issuerDataGridViewTextBoxColumn1";
            this.issuerDataGridViewTextBoxColumn1.Width = 120;
            // 
            // clientAccountDataGridViewTextBoxColumn1
            // 
            this.clientAccountDataGridViewTextBoxColumn1.DataPropertyName = "ClientAccount";
            this.clientAccountDataGridViewTextBoxColumn1.HeaderText = "Счет";
            this.clientAccountDataGridViewTextBoxColumn1.Name = "clientAccountDataGridViewTextBoxColumn1";
            // 
            // summAssetDataGridViewTextBoxColumn1
            // 
            this.summAssetDataGridViewTextBoxColumn1.DataPropertyName = "SummAsset";
            this.summAssetDataGridViewTextBoxColumn1.HeaderText = "СЧА";
            this.summAssetDataGridViewTextBoxColumn1.Name = "summAssetDataGridViewTextBoxColumn1";
            // 
            // instrumentDataGridViewTextBoxColumn1
            // 
            this.instrumentDataGridViewTextBoxColumn1.DataPropertyName = "Instrument";
            this.instrumentDataGridViewTextBoxColumn1.HeaderText = "Код";
            this.instrumentDataGridViewTextBoxColumn1.Name = "instrumentDataGridViewTextBoxColumn1";
            // 
            // quantityDataGridViewTextBoxColumn1
            // 
            this.quantityDataGridViewTextBoxColumn1.DataPropertyName = "Quantity";
            this.quantityDataGridViewTextBoxColumn1.HeaderText = "Количество";
            this.quantityDataGridViewTextBoxColumn1.Name = "quantityDataGridViewTextBoxColumn1";
            // 
            // marketValueDataGridViewTextBoxColumn1
            // 
            this.marketValueDataGridViewTextBoxColumn1.DataPropertyName = "MarketValue";
            this.marketValueDataGridViewTextBoxColumn1.HeaderText = "Оценка";
            this.marketValueDataGridViewTextBoxColumn1.Name = "marketValueDataGridViewTextBoxColumn1";
            // 
            // percentDataGridViewTextBoxColumn
            // 
            this.percentDataGridViewTextBoxColumn.DataPropertyName = "Percent";
            this.percentDataGridViewTextBoxColumn.HeaderText = "% СЧА";
            this.percentDataGridViewTextBoxColumn.Name = "percentDataGridViewTextBoxColumn";
            // 
            // instrumentTypeDataGridViewTextBoxColumn1
            // 
            this.instrumentTypeDataGridViewTextBoxColumn1.DataPropertyName = "InstrumentType";
            this.instrumentTypeDataGridViewTextBoxColumn1.HeaderText = "Тип";
            this.instrumentTypeDataGridViewTextBoxColumn1.Name = "instrumentTypeDataGridViewTextBoxColumn1";
            // 
            // instrumentSubtypeDataGridViewTextBoxColumn1
            // 
            this.instrumentSubtypeDataGridViewTextBoxColumn1.DataPropertyName = "InstrumentSubtype";
            this.instrumentSubtypeDataGridViewTextBoxColumn1.HeaderText = "Подтип";
            this.instrumentSubtypeDataGridViewTextBoxColumn1.Name = "instrumentSubtypeDataGridViewTextBoxColumn1";
            // 
            // secTypeBrDataGridViewTextBoxColumn
            // 
            this.secTypeBrDataGridViewTextBoxColumn.DataPropertyName = "SecTypeBr";
            this.secTypeBrDataGridViewTextBoxColumn.HeaderText = "SecTypeBr";
            this.secTypeBrDataGridViewTextBoxColumn.Name = "secTypeBrDataGridViewTextBoxColumn";
            // 
            // countryDataGridViewTextBoxColumn1
            // 
            this.countryDataGridViewTextBoxColumn1.DataPropertyName = "Country";
            this.countryDataGridViewTextBoxColumn1.HeaderText = "Страна";
            this.countryDataGridViewTextBoxColumn1.Name = "countryDataGridViewTextBoxColumn1";
            // 
            // quoteSheetDataGridViewTextBoxColumn1
            // 
            this.quoteSheetDataGridViewTextBoxColumn1.DataPropertyName = "QuoteSheet";
            this.quoteSheetDataGridViewTextBoxColumn1.HeaderText = "Кот. лист";
            this.quoteSheetDataGridViewTextBoxColumn1.Name = "quoteSheetDataGridViewTextBoxColumn1";
            // 
            // ownTypeDataGridViewTextBoxColumn1
            // 
            this.ownTypeDataGridViewTextBoxColumn1.DataPropertyName = "OwnType";
            this.ownTypeDataGridViewTextBoxColumn1.HeaderText = "Тип собственности";
            this.ownTypeDataGridViewTextBoxColumn1.Name = "ownTypeDataGridViewTextBoxColumn1";
            // 
            // bondsIssueSummDataGridViewTextBoxColumn1
            // 
            this.bondsIssueSummDataGridViewTextBoxColumn1.DataPropertyName = "BondsIssueSumm";
            this.bondsIssueSummDataGridViewTextBoxColumn1.HeaderText = "Сумм. объем выпуска";
            this.bondsIssueSummDataGridViewTextBoxColumn1.Name = "bondsIssueSummDataGridViewTextBoxColumn1";
            // 
            // quoteSDHDataGridViewTextBoxColumn1
            // 
            this.quoteSDHDataGridViewTextBoxColumn1.DataPropertyName = "QuoteSDH";
            this.quoteSDHDataGridViewTextBoxColumn1.HeaderText = "Котировка ЦХПИ";
            this.quoteSDHDataGridViewTextBoxColumn1.Name = "quoteSDHDataGridViewTextBoxColumn1";
            // 
            // quoteSDHAgoDataGridViewTextBoxColumn1
            // 
            this.quoteSDHAgoDataGridViewTextBoxColumn1.DataPropertyName = "QuoteSDHAgo";
            this.quoteSDHAgoDataGridViewTextBoxColumn1.HeaderText = "Возраст котировки ЦХПИ";
            this.quoteSDHAgoDataGridViewTextBoxColumn1.Name = "quoteSDHAgoDataGridViewTextBoxColumn1";
            this.quoteSDHAgoDataGridViewTextBoxColumn1.Visible = false;
            // 
            // volCirculationDataGridViewTextBoxColumn1
            // 
            this.volCirculationDataGridViewTextBoxColumn1.DataPropertyName = "VolCirculation";
            this.volCirculationDataGridViewTextBoxColumn1.HeaderText = "Объем в обращении";
            this.volCirculationDataGridViewTextBoxColumn1.Name = "volCirculationDataGridViewTextBoxColumn1";
            // 
            // contridDataGridViewTextBoxColumn2
            // 
            this.contridDataGridViewTextBoxColumn2.DataPropertyName = "contrid";
            this.contridDataGridViewTextBoxColumn2.HeaderText = "contrid";
            this.contridDataGridViewTextBoxColumn2.Name = "contridDataGridViewTextBoxColumn2";
            // 
            // capitalizationDataGridViewTextBoxColumn1
            // 
            this.capitalizationDataGridViewTextBoxColumn1.DataPropertyName = "Capitalization";
            this.capitalizationDataGridViewTextBoxColumn1.HeaderText = "Капитализация";
            this.capitalizationDataGridViewTextBoxColumn1.Name = "capitalizationDataGridViewTextBoxColumn1";
            this.capitalizationDataGridViewTextBoxColumn1.Visible = false;
            // 
            // redemptionDateDataGridViewTextBoxColumn1
            // 
            this.redemptionDateDataGridViewTextBoxColumn1.DataPropertyName = "RedemptionDate";
            this.redemptionDateDataGridViewTextBoxColumn1.HeaderText = "Дата погашения";
            this.redemptionDateDataGridViewTextBoxColumn1.Name = "redemptionDateDataGridViewTextBoxColumn1";
            // 
            // securityIdDataGridViewTextBoxColumn1
            // 
            this.securityIdDataGridViewTextBoxColumn1.DataPropertyName = "SecurityId";
            this.securityIdDataGridViewTextBoxColumn1.HeaderText = "SecurityId";
            this.securityIdDataGridViewTextBoxColumn1.Name = "securityIdDataGridViewTextBoxColumn1";
            // 
            // issueNumDataGridViewTextBoxColumn1
            // 
            this.issueNumDataGridViewTextBoxColumn1.DataPropertyName = "IssueNum";
            this.issueNumDataGridViewTextBoxColumn1.HeaderText = "Номер выпуска";
            this.issueNumDataGridViewTextBoxColumn1.Name = "issueNumDataGridViewTextBoxColumn1";
            // 
            // announcedVolDataGridViewTextBoxColumn1
            // 
            this.announcedVolDataGridViewTextBoxColumn1.DataPropertyName = "AnnouncedVol";
            this.announcedVolDataGridViewTextBoxColumn1.HeaderText = "Объем выпуска";
            this.announcedVolDataGridViewTextBoxColumn1.Name = "announcedVolDataGridViewTextBoxColumn1";
            // 
            // dateStartPlacingDataGridViewTextBoxColumn1
            // 
            this.dateStartPlacingDataGridViewTextBoxColumn1.DataPropertyName = "DateStartPlacing";
            this.dateStartPlacingDataGridViewTextBoxColumn1.HeaderText = "Дата начала размещения";
            this.dateStartPlacingDataGridViewTextBoxColumn1.Name = "dateStartPlacingDataGridViewTextBoxColumn1";
            // 
            // dateEndPlacingDataGridViewTextBoxColumn1
            // 
            this.dateEndPlacingDataGridViewTextBoxColumn1.DataPropertyName = "DateEndPlacing";
            this.dateEndPlacingDataGridViewTextBoxColumn1.HeaderText = "Дата окончания размещения";
            this.dateEndPlacingDataGridViewTextBoxColumn1.Name = "dateEndPlacingDataGridViewTextBoxColumn1";
            // 
            // currencyDataGridViewTextBoxColumn1
            // 
            this.currencyDataGridViewTextBoxColumn1.DataPropertyName = "Currency";
            this.currencyDataGridViewTextBoxColumn1.HeaderText = "Валюта";
            this.currencyDataGridViewTextBoxColumn1.Name = "currencyDataGridViewTextBoxColumn1";
            // 
            // cBCodeDataGridViewTextBoxColumn1
            // 
            this.cBCodeDataGridViewTextBoxColumn1.DataPropertyName = "CB_Code";
            this.cBCodeDataGridViewTextBoxColumn1.HeaderText = "CB_Code";
            this.cBCodeDataGridViewTextBoxColumn1.Name = "cBCodeDataGridViewTextBoxColumn1";
            // 
            // iDCBSDHDataGridViewTextBoxColumn1
            // 
            this.iDCBSDHDataGridViewTextBoxColumn1.DataPropertyName = "ID_CB_SDH";
            this.iDCBSDHDataGridViewTextBoxColumn1.HeaderText = "ID_CB_SDH";
            this.iDCBSDHDataGridViewTextBoxColumn1.Name = "iDCBSDHDataGridViewTextBoxColumn1";
            // 
            // stateRegNumDataGridViewTextBoxColumn1
            // 
            this.stateRegNumDataGridViewTextBoxColumn1.DataPropertyName = "StateRegNum";
            this.stateRegNumDataGridViewTextBoxColumn1.HeaderText = "ГРН";
            this.stateRegNumDataGridViewTextBoxColumn1.Name = "stateRegNumDataGridViewTextBoxColumn1";
            // 
            // monthAvgVolDataGridViewTextBoxColumn1
            // 
            this.monthAvgVolDataGridViewTextBoxColumn1.DataPropertyName = "MonthAvgVol";
            this.monthAvgVolDataGridViewTextBoxColumn1.HeaderText = "Среднемесячный объем";
            this.monthAvgVolDataGridViewTextBoxColumn1.Name = "monthAvgVolDataGridViewTextBoxColumn1";
            // 
            // fRatingDataGridViewTextBoxColumn1
            // 
            this.fRatingDataGridViewTextBoxColumn1.DataPropertyName = "F_Rating";
            this.fRatingDataGridViewTextBoxColumn1.HeaderText = "F_Rating";
            this.fRatingDataGridViewTextBoxColumn1.Name = "fRatingDataGridViewTextBoxColumn1";
            // 
            // mRatingDataGridViewTextBoxColumn1
            // 
            this.mRatingDataGridViewTextBoxColumn1.DataPropertyName = "M_Rating";
            this.mRatingDataGridViewTextBoxColumn1.HeaderText = "M_Rating";
            this.mRatingDataGridViewTextBoxColumn1.Name = "mRatingDataGridViewTextBoxColumn1";
            // 
            // sPRatingDataGridViewTextBoxColumn1
            // 
            this.sPRatingDataGridViewTextBoxColumn1.DataPropertyName = "SP_Rating";
            this.sPRatingDataGridViewTextBoxColumn1.HeaderText = "SP_Rating";
            this.sPRatingDataGridViewTextBoxColumn1.Name = "sPRatingDataGridViewTextBoxColumn1";
            // 
            // eRatingDataGridViewTextBoxColumn1
            // 
            this.eRatingDataGridViewTextBoxColumn1.DataPropertyName = "E_Rating";
            this.eRatingDataGridViewTextBoxColumn1.HeaderText = "E_Rating";
            this.eRatingDataGridViewTextBoxColumn1.Name = "eRatingDataGridViewTextBoxColumn1";
            // 
            // aRatingDataGridViewTextBoxColumn1
            // 
            this.aRatingDataGridViewTextBoxColumn1.DataPropertyName = "A_Rating";
            this.aRatingDataGridViewTextBoxColumn1.HeaderText = "A_Rating";
            this.aRatingDataGridViewTextBoxColumn1.Name = "aRatingDataGridViewTextBoxColumn1";
            // 
            // dataGridViewTextBoxColumn2
            // 
            this.dataGridViewTextBoxColumn2.DataPropertyName = "NKR_Rating";
            this.dataGridViewTextBoxColumn2.HeaderText = "NKR_Rating";
            this.dataGridViewTextBoxColumn2.Name = "dataGridViewTextBoxColumn2";
            // 
            // dataGridViewTextBoxColumn3
            // 
            this.dataGridViewTextBoxColumn3.DataPropertyName = "NRA_Rating";
            this.dataGridViewTextBoxColumn3.HeaderText = "NRA_Rating";
            this.dataGridViewTextBoxColumn3.Name = "dataGridViewTextBoxColumn3";
            // 
            // contrFRatingDataGridViewTextBoxColumn1
            // 
            this.contrFRatingDataGridViewTextBoxColumn1.DataPropertyName = "Contr_F_Rating";
            this.contrFRatingDataGridViewTextBoxColumn1.HeaderText = "Contr_F_Rating";
            this.contrFRatingDataGridViewTextBoxColumn1.Name = "contrFRatingDataGridViewTextBoxColumn1";
            // 
            // contrMRatingDataGridViewTextBoxColumn1
            // 
            this.contrMRatingDataGridViewTextBoxColumn1.DataPropertyName = "Contr_M_Rating";
            this.contrMRatingDataGridViewTextBoxColumn1.HeaderText = "Contr_M_Rating";
            this.contrMRatingDataGridViewTextBoxColumn1.Name = "contrMRatingDataGridViewTextBoxColumn1";
            // 
            // contrSPRatingDataGridViewTextBoxColumn1
            // 
            this.contrSPRatingDataGridViewTextBoxColumn1.DataPropertyName = "Contr_SP_Rating";
            this.contrSPRatingDataGridViewTextBoxColumn1.HeaderText = "Contr_SP_Rating";
            this.contrSPRatingDataGridViewTextBoxColumn1.Name = "contrSPRatingDataGridViewTextBoxColumn1";
            // 
            // contrERatingDataGridViewTextBoxColumn1
            // 
            this.contrERatingDataGridViewTextBoxColumn1.DataPropertyName = "Contr_E_Rating";
            this.contrERatingDataGridViewTextBoxColumn1.HeaderText = "Contr_E_Rating";
            this.contrERatingDataGridViewTextBoxColumn1.Name = "contrERatingDataGridViewTextBoxColumn1";
            // 
            // contrARatingDataGridViewTextBoxColumn1
            // 
            this.contrARatingDataGridViewTextBoxColumn1.DataPropertyName = "Contr_A_Rating";
            this.contrARatingDataGridViewTextBoxColumn1.HeaderText = "Contr_A_Rating";
            this.contrARatingDataGridViewTextBoxColumn1.Name = "contrARatingDataGridViewTextBoxColumn1";
            // 
            // dataGridViewTextBoxColumn4
            // 
            this.dataGridViewTextBoxColumn4.DataPropertyName = "Contr_NKR_Rating";
            this.dataGridViewTextBoxColumn4.HeaderText = "Contr_NKR_Rating";
            this.dataGridViewTextBoxColumn4.Name = "dataGridViewTextBoxColumn4";
            // 
            // dataGridViewTextBoxColumn5
            // 
            this.dataGridViewTextBoxColumn5.DataPropertyName = "Contr_NRA_Rating";
            this.dataGridViewTextBoxColumn5.HeaderText = "Contr_NRA_Rating";
            this.dataGridViewTextBoxColumn5.Name = "dataGridViewTextBoxColumn5";
            // 
            // enddateDataGridViewTextBoxColumn1
            // 
            this.enddateDataGridViewTextBoxColumn1.DataPropertyName = "enddate";
            this.enddateDataGridViewTextBoxColumn1.HeaderText = "Дата окончания";
            this.enddateDataGridViewTextBoxColumn1.Name = "enddateDataGridViewTextBoxColumn1";
            // 
            // isInIndexDataGridViewCheckBoxColumn1
            // 
            this.isInIndexDataGridViewCheckBoxColumn1.DataPropertyName = "IsInIndex";
            this.isInIndexDataGridViewCheckBoxColumn1.HeaderText = "В индексе";
            this.isInIndexDataGridViewCheckBoxColumn1.Name = "isInIndexDataGridViewCheckBoxColumn1";
            // 
            // isVariableCouponDataGridViewCheckBoxColumn1
            // 
            this.isVariableCouponDataGridViewCheckBoxColumn1.DataPropertyName = "IsVariableCoupon";
            this.isVariableCouponDataGridViewCheckBoxColumn1.HeaderText = "Переменный купон";
            this.isVariableCouponDataGridViewCheckBoxColumn1.Name = "isVariableCouponDataGridViewCheckBoxColumn1";
            // 
            // isQuantityGrowsDataGridViewCheckBoxColumn
            // 
            this.isQuantityGrowsDataGridViewCheckBoxColumn.DataPropertyName = "IsQuantityGrows";
            this.isQuantityGrowsDataGridViewCheckBoxColumn.HeaderText = "IsQuantityGrows";
            this.isQuantityGrowsDataGridViewCheckBoxColumn.Name = "isQuantityGrowsDataGridViewCheckBoxColumn";
            this.isQuantityGrowsDataGridViewCheckBoxColumn.Visible = false;
            // 
            // dataGridViewTextBoxColumn1
            // 
            this.dataGridViewTextBoxColumn1.DataPropertyName = "DaysToRedemption";
            this.dataGridViewTextBoxColumn1.HeaderText = "Дней до погашения";
            this.dataGridViewTextBoxColumn1.Name = "dataGridViewTextBoxColumn1";
            // 
            // isbankDataGridViewCheckBoxColumn
            // 
            this.isbankDataGridViewCheckBoxColumn.DataPropertyName = "is_bank";
            this.isbankDataGridViewCheckBoxColumn.HeaderText = "Банк";
            this.isbankDataGridViewCheckBoxColumn.Name = "isbankDataGridViewCheckBoxColumn";
            // 
            // forqualinvestorsDataGridViewCheckBoxColumn
            // 
            this.forqualinvestorsDataGridViewCheckBoxColumn.DataPropertyName = "for_qual_investors";
            this.forqualinvestorsDataGridViewCheckBoxColumn.HeaderText = "Для квал. инвесторов";
            this.forqualinvestorsDataGridViewCheckBoxColumn.Name = "forqualinvestorsDataGridViewCheckBoxColumn";
            // 
            // isSubordinatedDataGridViewTextBoxColumn
            // 
            this.isSubordinatedDataGridViewTextBoxColumn.DataPropertyName = "IsSubordinated";
            this.isSubordinatedDataGridViewTextBoxColumn.HeaderText = "Субординированная";
            this.isSubordinatedDataGridViewTextBoxColumn.Name = "isSubordinatedDataGridViewTextBoxColumn";
            // 
            // Form_Main
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.ClientSize = new System.Drawing.Size(1478, 1008);
            this.Controls.Add(this.tc_Main);
            this.Controls.Add(this.tbLog);
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "Form_Main";
            this.Text = "LC3";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form_Closing);
            this.Load += new System.EventHandler(this.Form_Load);
            ((System.ComponentModel.ISupportInitialize)(this.cLBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.lC3_devDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLObjectsBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLSubGroupBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLGroupContentBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLContragentsBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLGroupsBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.rLTypesBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLClientsBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLRestrictionsBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLGroupsWithSubBindingSource)).EndInit();
            this.tp_RL.ResumeLayout(false);
            this.tp_RL.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_Restr)).EndInit();
            this.tp_groups.ResumeLayout(false);
            this.tp_groups.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_SubGroups)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_GroupContent)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_groups)).EndInit();
            this.tp_Portfolio.ResumeLayout(false);
            this.tp_Portfolio.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_FTView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.fTViewBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.factTablesListBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLClientsBindingSource3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.factTableBindingSource)).EndInit();
            this.tp_Restrictions.ResumeLayout(false);
            this.tp_Restrictions.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_ClLimits)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLClientLimitsBindingSource1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLClientsBindingSource2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLCLBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLClientsBindingSource1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLClientLimitsBindingSource)).EndInit();
            this.tp_LimitSettings.ResumeLayout(false);
            this.pCL.ResumeLayout(false);
            this.pCL.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dg_CL)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dg_Objects)).EndInit();
            this.pParams.ResumeLayout(false);
            this.pParams.PerformLayout();
            this.tc_Main.ResumeLayout(false);
            this.tp_Ierarchy.ResumeLayout(false);
            this.tp_Ierarchy.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_Ierarchy)).EndInit();
            this.tp_AUList.ResumeLayout(false);
            this.tp_AUList.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.cLlstSubtypesBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_AUList)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.aUListWithParamsBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.lC3_devDataSet1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.factTableBindingSource1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private LC3_devDataSet lC3_devDataSet;
        private System.Windows.Forms.BindingSource cLBindingSource;
        private LC3_devDataSetTableAdapters.CLTableAdapter cLTableAdapter;
        private System.Windows.Forms.TextBox tbLog;
        private System.Windows.Forms.BindingSource cLObjectsBindingSource;
        private LC3_devDataSetTableAdapters.CL_ObjectsTableAdapter cL_ObjectsTableAdapter;
        private System.Windows.Forms.BindingSource cLGroupsBindingSource;
        private LC3_devDataSetTableAdapters.CL_GroupsTableAdapter cL_GroupsTableAdapter;
        private System.Windows.Forms.BindingSource cLGroupContentBindingSource;
        private LC3_devDataSetTableAdapters._CL_GroupContentTableAdapter _CL_GroupContentTableAdapter;
        private System.Windows.Forms.BindingSource cLContragentsBindingSource;
        private LC3_devDataSetTableAdapters._CL_ContragentsTableAdapter _CL_ContragentsTableAdapter;
        private System.Windows.Forms.BindingSource cLGroupsWithSubBindingSource;
        private System.Windows.Forms.BindingSource cLSubGroupBindingSource;
        private LC3_devDataSetTableAdapters._CL_SubGroupTableAdapter _CL_SubGroupTableAdapter;
        private System.Windows.Forms.BindingSource cLRestrictionsBindingSource;
        private LC3_devDataSetTableAdapters._CL_RestrictionsTableAdapter _CL_RestrictionsTableAdapter;
        private System.Windows.Forms.BindingSource cLClientsBindingSource;
        private LC3_devDataSetTableAdapters._CL_ClientsTableAdapter _CL_ClientsTableAdapter;
        private System.Windows.Forms.BindingSource rLTypesBindingSource;
        private LC3_devDataSetTableAdapters.RL_TypesTableAdapter rL_TypesTableAdapter;
        private System.Windows.Forms.TabPage tp_RL;
        private System.Windows.Forms.Button bt_RL_Add;
        private System.Windows.Forms.Button bt_RL_Edit;
        private System.Windows.Forms.Button bt_RL_Del;
        private System.Windows.Forms.ComboBox cb_F_RestrictType;
        private System.Windows.Forms.ComboBox cb_F_Client;
        private System.Windows.Forms.Label l_Filter_cl;
        private System.Windows.Forms.DataGridView dgv_Restr;
        private System.Windows.Forms.TabPage tp_groups;
        private System.Windows.Forms.Button b_AddSub;
        private System.Windows.Forms.TextBox t_SubId;
        private System.Windows.Forms.DataGridView dgv_SubGroups;
        private System.Windows.Forms.DataGridViewTextBoxColumn parentIdDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn childIdDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn groupNameDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewImageColumn ColumnDelete;
        private System.Windows.Forms.DataGridView dgv_GroupContent;
        private System.Windows.Forms.DataGridViewTextBoxColumn nameDataGridViewTextBoxColumn2;
        private System.Windows.Forms.DataGridViewTextBoxColumn ridDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewImageColumn Column_Delete;
        private System.Windows.Forms.TextBox tb_ContrFind;
        private System.Windows.Forms.DataGridView dgv_groups;
        private System.Windows.Forms.DataGridViewTextBoxColumn idDataGridViewTextBoxColumn2;
        private System.Windows.Forms.DataGridViewTextBoxColumn ridDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn groupNameDataGridViewTextBoxColumn;
        private System.Windows.Forms.Label l_AddSub;
        private System.Windows.Forms.Label l_SubGroups;
        private System.Windows.Forms.Button b_AddToGroup;
        private System.Windows.Forms.Label l_contrid;
        private System.Windows.Forms.Label l_SelectedGroup;
        private System.Windows.Forms.Label l_contrFind;
        private System.Windows.Forms.ComboBox cb_GontrFind;
        private System.Windows.Forms.Button b_delete;
        private System.Windows.Forms.Button b_edit;
        private System.Windows.Forms.Button b_add;
        private System.Windows.Forms.TabPage tp_Portfolio;
        private System.Windows.Forms.TabPage tp_Restrictions;
        private System.Windows.Forms.TabPage tp_LimitSettings;
        private System.Windows.Forms.Panel pCL;
        private System.Windows.Forms.Label l_NOT_Complex;
        private System.Windows.Forms.DataGridView dg_CL;
        private System.Windows.Forms.Button bt_Add;
        private System.Windows.Forms.Button bt_DeleteObj;
        private System.Windows.Forms.Button bt_Edit;
        private System.Windows.Forms.Button bt_EditObj;
        private System.Windows.Forms.Button bt_Delete;
        private System.Windows.Forms.Button bt_AddObj;
        private System.Windows.Forms.DataGridView dg_Objects;
        private System.Windows.Forms.DataGridViewTextBoxColumn idDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn nameDataGridViewTextBoxColumn1;
        private System.Windows.Forms.Label l_Limit_Head;
        private System.Windows.Forms.Panel pParams;
        private System.Windows.Forms.Button bSaveCond;
        private System.Windows.Forms.Label l_Object_Head;
        private System.Windows.Forms.TabControl tc_Main;
        private System.Windows.Forms.Button b_Filter;
        private System.Windows.Forms.BindingSource cLClientLimitsBindingSource;
        private System.Windows.Forms.ComboBox cbCL;
        private System.Windows.Forms.BindingSource cLCLBindingSource;
        private LC3_devDataSetTableAdapters._CL_CLTableAdapter _CL_CLTableAdapter;
        private System.Windows.Forms.ComboBox cbClients;
        private System.Windows.Forms.BindingSource cLClientsBindingSource1;
        private System.Windows.Forms.BindingSource cLClientsBindingSource2;
        private System.Windows.Forms.DataGridView dgv_ClLimits;
        private System.Windows.Forms.BindingSource cLClientLimitsBindingSource1;
        private LC3_devDataSetTableAdapters._CL_ClientLimitsTableAdapter _CL_ClientLimitsTableAdapter;
        private System.Windows.Forms.CheckBox cb_OnlyActive;
        private System.Windows.Forms.Button bt_ClLimit_edit;
        private System.Windows.Forms.Button bCheck;
        private System.Windows.Forms.Button bCheckAll;
        private System.Windows.Forms.Button bt_ReloadPortf;
        private System.Windows.Forms.BindingSource factTableBindingSource;
        private LC3_devDataSetTableAdapters.FactTableTableAdapter factTableTableAdapter;
        private System.Windows.Forms.ComboBox cb_PortfClient;
        private System.Windows.Forms.BindingSource cLClientsBindingSource3;
        private System.Windows.Forms.Label l_client2;
        private System.Windows.Forms.Label l_client;
        private System.Windows.Forms.Label l_Limit;
        private System.Windows.Forms.Label l_restrict_to;
        private System.Windows.Forms.DataGridViewTextBoxColumn clientIdDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn clientNameDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn typeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn restrictTypeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn ridDataGridViewTextBoxColumn2;
        private System.Windows.Forms.DataGridViewTextBoxColumn restrictNameDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn echelonDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn limitTypeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn limitValueDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn unitsDataGridViewTextBoxColumn;
        private System.Windows.Forms.ComboBox cb_FTTypes;
        private System.Windows.Forms.Label l_PortfolioType;
        private System.Windows.Forms.BindingSource factTablesListBindingSource;
        private LC3_devDataSetTableAdapters.FactTablesListTableAdapter factTablesListTableAdapter;
        private System.Windows.Forms.Button b_ShowRepo;
        private System.Windows.Forms.DataGridViewTextBoxColumn idDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn nameDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn conditionDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewCheckBoxColumn GroupByEmit;
        private System.Windows.Forms.DataGridViewCheckBoxColumn GroupByInstr;
        private System.Windows.Forms.DataGridViewCheckBoxColumn IsComplex;
        private System.Windows.Forms.DataGridViewTextBoxColumn LimitQuery;
        private System.Windows.Forms.DataGridViewTextBoxColumn FTId;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column1;
        private System.Windows.Forms.DataGridViewTextBoxColumn limitIdDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn clientNameDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn clientCodeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn nameDataGridViewTextBoxColumn3;
        private System.Windows.Forms.DataGridViewCheckBoxColumn isActiveDataGridViewCheckBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn minValueDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn lowerWarningDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn upperWarningDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn maxValueDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn Current;
        private System.Windows.Forms.DataGridViewTextBoxColumn CheckResult;
        private System.Windows.Forms.TabPage tp_AUList;
        private System.Windows.Forms.DataGridView dgv_AUList;
        private System.Windows.Forms.BindingSource aUListWithParamsBindingSource;
        private LC3_devDataSetTableAdapters.AU_ListWithParamsTableAdapter aU_ListWithParamsTableAdapter;
        private System.Windows.Forms.ComboBox cb_AU_contr;
        private System.Windows.Forms.TextBox tb_AU_FindContr;
        private System.Windows.Forms.Label l_Find;
        private System.Windows.Forms.Label l_AU_rid;
        private System.Windows.Forms.ComboBox cb_AU_SubTypes;
        private System.Windows.Forms.BindingSource cLlstSubtypesBindingSource;
        private LC3_devDataSetTableAdapters.CLlst_SubtypesTableAdapter cLlst_SubtypesTableAdapter;
        private System.Windows.Forms.TextBox tb_AU_Comment;
        private System.Windows.Forms.Label l_AU_Comment;
        private System.Windows.Forms.Label l_AU_SubType;
        private System.Windows.Forms.Button b_AU_AddUpdate;
        private System.Windows.Forms.Button b_Form;
        private System.Windows.Forms.TextBox tb_AU_InnerName;
        private System.Windows.Forms.Label l_AU_InnerName;
        private System.Windows.Forms.DataGridViewTextBoxColumn contridDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn nameDataGridViewTextBoxColumn4;
        private System.Windows.Forms.DataGridViewTextBoxColumn InnerName;
        private System.Windows.Forms.DataGridViewTextBoxColumn typeDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn ratingDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn ownRatingDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn ownCommentDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn qsheetDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn inIndexDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn remarkDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewImageColumn Column2;
        private System.Windows.Forms.Button bt_Portf_Model;
        private System.Windows.Forms.Button bt_Model_Deal;
        private System.Windows.Forms.CheckBox cb_Model;
        private System.Windows.Forms.ContextMenuStrip cms_Portf;
        private System.Windows.Forms.TabPage tp_Ierarchy;
        private System.Windows.Forms.Label l_Client3;
        private System.Windows.Forms.ComboBox cb_IerarchyClient;
        private System.Windows.Forms.DataGridView dgv_Ierarchy;
        private System.Windows.Forms.DataGridViewTextBoxColumn С2;
        private System.Windows.Forms.DataGridViewTextBoxColumn C3;
        private System.Windows.Forms.DataGridViewTextBoxColumn C4;
        private System.Windows.Forms.Button btSL5Perc;
        private LC3_devDataSet1 lC3_devDataSet1;
        private System.Windows.Forms.BindingSource factTableBindingSource1;

        private System.Windows.Forms.DataGridView dgv_FTView;
        private System.Windows.Forms.BindingSource fTViewBindingSource;
        private LC3_devDataSetTableAdapters.FT_ViewTableAdapter fT_ViewTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn clientCodeDataGridViewTextBoxColumn2;
        private System.Windows.Forms.DataGridViewTextBoxColumn instrumentNameDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn issuerDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn clientAccountDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn summAssetDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn instrumentDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn quantityDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn marketValueDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn percentDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn instrumentTypeDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn instrumentSubtypeDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn secTypeBrDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn countryDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn quoteSheetDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn ownTypeDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn bondsIssueSummDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn quoteSDHDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn quoteSDHAgoDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn volCirculationDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn contridDataGridViewTextBoxColumn2;
        private System.Windows.Forms.DataGridViewTextBoxColumn capitalizationDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn redemptionDateDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn securityIdDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn issueNumDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn announcedVolDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn dateStartPlacingDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn dateEndPlacingDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn currencyDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn cBCodeDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn iDCBSDHDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn stateRegNumDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn monthAvgVolDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn fRatingDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn mRatingDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn sPRatingDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn eRatingDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn aRatingDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn2;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn3;
        private System.Windows.Forms.DataGridViewTextBoxColumn contrFRatingDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn contrMRatingDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn contrSPRatingDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn contrERatingDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn contrARatingDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn4;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn5;
        private System.Windows.Forms.DataGridViewTextBoxColumn enddateDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewCheckBoxColumn isInIndexDataGridViewCheckBoxColumn1;
        private System.Windows.Forms.DataGridViewCheckBoxColumn isVariableCouponDataGridViewCheckBoxColumn1;
        private System.Windows.Forms.DataGridViewCheckBoxColumn isQuantityGrowsDataGridViewCheckBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewCheckBoxColumn isbankDataGridViewCheckBoxColumn;
        private System.Windows.Forms.DataGridViewCheckBoxColumn forqualinvestorsDataGridViewCheckBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn isSubordinatedDataGridViewTextBoxColumn;
    }
}

