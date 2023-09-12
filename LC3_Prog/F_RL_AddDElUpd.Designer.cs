namespace LC3_Prog
{
    partial class F_RL_AddDElUpd
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
            this.l_Client = new System.Windows.Forms.Label();
            this.cb_Clients = new System.Windows.Forms.ComboBox();
            this.cLClientsBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.lC3_devDataSet = new LC3_Prog.LC3_devDataSet();
            this.cb_RestrType = new System.Windows.Forms.ComboBox();
            this.rLTypesBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.l_RestrType = new System.Windows.Forms.Label();
            this._CL_ClientsTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters._CL_ClientsTableAdapter();
            this.rL_TypesTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters.RL_TypesTableAdapter();
            this.bt_Action = new System.Windows.Forms.Button();
            this.cb_RestrictName = new System.Windows.Forms.ComboBox();
            this.cLContragentsBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.l_RL_Name = new System.Windows.Forms.Label();
            this.bt_Cncl = new System.Windows.Forms.Button();
            this.l_Find = new System.Windows.Forms.Label();
            this.tb_Find = new System.Windows.Forms.TextBox();
            this.cLClientsBindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this._CL_ContragentsTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters._CL_ContragentsTableAdapter();
            this.l_Restriction = new System.Windows.Forms.Label();
            this.tb_LimitValue = new System.Windows.Forms.TextBox();
            this.cb_LimitType = new System.Windows.Forms.ComboBox();
            this.tb_Echelon = new System.Windows.Forms.TextBox();
            this.l_Echelon = new System.Windows.Forms.Label();
            this.l_rid = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.cLClientsBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.lC3_devDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.rLTypesBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLContragentsBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLClientsBindingSource1)).BeginInit();
            this.SuspendLayout();
            // 
            // l_Client
            // 
            this.l_Client.AutoSize = true;
            this.l_Client.Location = new System.Drawing.Point(13, 13);
            this.l_Client.Name = "l_Client";
            this.l_Client.Size = new System.Drawing.Size(43, 13);
            this.l_Client.TabIndex = 0;
            this.l_Client.Text = "Клиент";
            // 
            // cb_Clients
            // 
            this.cb_Clients.DataSource = this.cLClientsBindingSource;
            this.cb_Clients.DisplayMember = "НаименованиеКлиента";
            this.cb_Clients.FormattingEnabled = true;
            this.cb_Clients.Location = new System.Drawing.Point(107, 10);
            this.cb_Clients.Name = "cb_Clients";
            this.cb_Clients.Size = new System.Drawing.Size(374, 21);
            this.cb_Clients.TabIndex = 1;
            this.cb_Clients.ValueMember = "КодКлиента";
            // 
            // cLClientsBindingSource
            // 
            this.cLClientsBindingSource.DataMember = "_CL_Clients";
            this.cLClientsBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // lC3_devDataSet
            // 
            this.lC3_devDataSet.DataSetName = "LC3_devDataSet";
            this.lC3_devDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // cb_RestrType
            // 
            this.cb_RestrType.DataSource = this.rLTypesBindingSource;
            this.cb_RestrType.DisplayMember = "TypeName";
            this.cb_RestrType.FormattingEnabled = true;
            this.cb_RestrType.Location = new System.Drawing.Point(107, 37);
            this.cb_RestrType.Name = "cb_RestrType";
            this.cb_RestrType.Size = new System.Drawing.Size(374, 21);
            this.cb_RestrType.TabIndex = 3;
            this.cb_RestrType.ValueMember = "Code";
            // 
            // rLTypesBindingSource
            // 
            this.rLTypesBindingSource.DataMember = "RL_Types";
            this.rLTypesBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // l_RestrType
            // 
            this.l_RestrType.AutoSize = true;
            this.l_RestrType.Location = new System.Drawing.Point(13, 40);
            this.l_RestrType.Name = "l_RestrType";
            this.l_RestrType.Size = new System.Drawing.Size(88, 13);
            this.l_RestrType.TabIndex = 2;
            this.l_RestrType.Text = "Ограничение на";
            // 
            // _CL_ClientsTableAdapter
            // 
            this._CL_ClientsTableAdapter.ClearBeforeFill = true;
            // 
            // rL_TypesTableAdapter
            // 
            this.rL_TypesTableAdapter.ClearBeforeFill = true;
            // 
            // bt_Action
            // 
            this.bt_Action.Location = new System.Drawing.Point(16, 292);
            this.bt_Action.Name = "bt_Action";
            this.bt_Action.Size = new System.Drawing.Size(75, 23);
            this.bt_Action.TabIndex = 4;
            this.bt_Action.Text = "Add";
            this.bt_Action.UseVisualStyleBackColor = true;
            this.bt_Action.Click += new System.EventHandler(this.bt_Action_Click);
            // 
            // cb_RestrictName
            // 
            this.cb_RestrictName.DataSource = this.cLContragentsBindingSource;
            this.cb_RestrictName.DisplayMember = "name";
            this.cb_RestrictName.FormattingEnabled = true;
            this.cb_RestrictName.Location = new System.Drawing.Point(107, 105);
            this.cb_RestrictName.Name = "cb_RestrictName";
            this.cb_RestrictName.Size = new System.Drawing.Size(374, 21);
            this.cb_RestrictName.TabIndex = 6;
            this.cb_RestrictName.ValueMember = "rid";
            this.cb_RestrictName.SelectedIndexChanged += new System.EventHandler(this.RestrRid_changed);
            // 
            // cLContragentsBindingSource
            // 
            this.cLContragentsBindingSource.DataMember = "_CL_Contragents";
            this.cLContragentsBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // l_RL_Name
            // 
            this.l_RL_Name.AutoSize = true;
            this.l_RL_Name.Location = new System.Drawing.Point(13, 108);
            this.l_RL_Name.Name = "l_RL_Name";
            this.l_RL_Name.Size = new System.Drawing.Size(88, 13);
            this.l_RL_Name.TabIndex = 5;
            this.l_RL_Name.Text = "Ограничение на";
            // 
            // bt_Cncl
            // 
            this.bt_Cncl.Location = new System.Drawing.Point(406, 292);
            this.bt_Cncl.Name = "bt_Cncl";
            this.bt_Cncl.Size = new System.Drawing.Size(75, 23);
            this.bt_Cncl.TabIndex = 7;
            this.bt_Cncl.Text = "Cancel";
            this.bt_Cncl.UseVisualStyleBackColor = true;
            this.bt_Cncl.Click += new System.EventHandler(this.bt_Cncl_Click);
            // 
            // l_Find
            // 
            this.l_Find.AutoSize = true;
            this.l_Find.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.l_Find.Location = new System.Drawing.Point(62, 85);
            this.l_Find.Name = "l_Find";
            this.l_Find.Size = new System.Drawing.Size(39, 13);
            this.l_Find.TabIndex = 8;
            this.l_Find.Text = "Поиск";
            // 
            // tb_Find
            // 
            this.tb_Find.Location = new System.Drawing.Point(108, 81);
            this.tb_Find.Name = "tb_Find";
            this.tb_Find.Size = new System.Drawing.Size(373, 20);
            this.tb_Find.TabIndex = 9;
            this.tb_Find.KeyUp += new System.Windows.Forms.KeyEventHandler(this.TryFound);
            // 
            // cLClientsBindingSource1
            // 
            this.cLClientsBindingSource1.DataMember = "_CL_Clients";
            this.cLClientsBindingSource1.DataSource = this.lC3_devDataSet;
            // 
            // _CL_ContragentsTableAdapter
            // 
            this._CL_ContragentsTableAdapter.ClearBeforeFill = true;
            // 
            // l_Restriction
            // 
            this.l_Restriction.AutoSize = true;
            this.l_Restriction.Location = new System.Drawing.Point(28, 169);
            this.l_Restriction.Name = "l_Restriction";
            this.l_Restriction.Size = new System.Drawing.Size(73, 13);
            this.l_Restriction.TabIndex = 10;
            this.l_Restriction.Text = "Ограничение";
            // 
            // tb_LimitValue
            // 
            this.tb_LimitValue.Location = new System.Drawing.Point(107, 166);
            this.tb_LimitValue.Name = "tb_LimitValue";
            this.tb_LimitValue.Size = new System.Drawing.Size(121, 20);
            this.tb_LimitValue.TabIndex = 11;
            this.tb_LimitValue.Text = "0";
            // 
            // cb_LimitType
            // 
            this.cb_LimitType.FormattingEnabled = true;
            this.cb_LimitType.Items.AddRange(new object[] {
            "%",
            "руб."});
            this.cb_LimitType.Location = new System.Drawing.Point(234, 166);
            this.cb_LimitType.Name = "cb_LimitType";
            this.cb_LimitType.Size = new System.Drawing.Size(48, 21);
            this.cb_LimitType.TabIndex = 12;
            this.cb_LimitType.Text = "%";
            // 
            // tb_Echelon
            // 
            this.tb_Echelon.Location = new System.Drawing.Point(367, 166);
            this.tb_Echelon.Name = "tb_Echelon";
            this.tb_Echelon.Size = new System.Drawing.Size(114, 20);
            this.tb_Echelon.TabIndex = 14;
            // 
            // l_Echelon
            // 
            this.l_Echelon.AutoSize = true;
            this.l_Echelon.Location = new System.Drawing.Point(318, 169);
            this.l_Echelon.Name = "l_Echelon";
            this.l_Echelon.Size = new System.Drawing.Size(46, 13);
            this.l_Echelon.TabIndex = 13;
            this.l_Echelon.Text = "Эшелон";
            // 
            // l_rid
            // 
            this.l_rid.AutoSize = true;
            this.l_rid.Location = new System.Drawing.Point(107, 133);
            this.l_rid.Name = "l_rid";
            this.l_rid.Size = new System.Drawing.Size(0, 13);
            this.l_rid.TabIndex = 15;
            // 
            // F_RL_AddDElUpd
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(501, 335);
            this.ControlBox = false;
            this.Controls.Add(this.l_rid);
            this.Controls.Add(this.tb_Echelon);
            this.Controls.Add(this.l_Echelon);
            this.Controls.Add(this.cb_LimitType);
            this.Controls.Add(this.tb_LimitValue);
            this.Controls.Add(this.l_Restriction);
            this.Controls.Add(this.tb_Find);
            this.Controls.Add(this.l_Find);
            this.Controls.Add(this.bt_Cncl);
            this.Controls.Add(this.cb_RestrictName);
            this.Controls.Add(this.l_RL_Name);
            this.Controls.Add(this.bt_Action);
            this.Controls.Add(this.cb_RestrType);
            this.Controls.Add(this.l_RestrType);
            this.Controls.Add(this.cb_Clients);
            this.Controls.Add(this.l_Client);
            this.Name = "F_RL_AddDElUpd";
            this.Text = "Списки ограничений";
            this.Load += new System.EventHandler(this.F_RL_AddDElUpd_Load);
            ((System.ComponentModel.ISupportInitialize)(this.cLClientsBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.lC3_devDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.rLTypesBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLContragentsBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.cLClientsBindingSource1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label l_Client;
        private System.Windows.Forms.ComboBox cb_Clients;
        private System.Windows.Forms.ComboBox cb_RestrType;
        private System.Windows.Forms.Label l_RestrType;
        private LC3_devDataSet lC3_devDataSet;
        private System.Windows.Forms.BindingSource cLClientsBindingSource;
        private LC3_devDataSetTableAdapters._CL_ClientsTableAdapter _CL_ClientsTableAdapter;
        private System.Windows.Forms.BindingSource rLTypesBindingSource;
        private LC3_devDataSetTableAdapters.RL_TypesTableAdapter rL_TypesTableAdapter;
        private System.Windows.Forms.Button bt_Action;
        private System.Windows.Forms.ComboBox cb_RestrictName;
        private System.Windows.Forms.Label l_RL_Name;
        private System.Windows.Forms.Button bt_Cncl;

        private System.Windows.Forms.Label l_Find;
        private System.Windows.Forms.TextBox tb_Find;
        private System.Windows.Forms.BindingSource cLClientsBindingSource1;
        private System.Windows.Forms.BindingSource cLContragentsBindingSource;
        private LC3_devDataSetTableAdapters._CL_ContragentsTableAdapter _CL_ContragentsTableAdapter;
        private System.Windows.Forms.Label l_Restriction;
        private System.Windows.Forms.TextBox tb_LimitValue;
        private System.Windows.Forms.ComboBox cb_LimitType;
        private System.Windows.Forms.TextBox tb_Echelon;
        private System.Windows.Forms.Label l_Echelon;
        private System.Windows.Forms.Label l_rid;

    }
}