namespace LC3_Prog
{
    partial class F_AddUpdDel
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
            this.l_Id = new System.Windows.Forms.Label();
            this.tb_Id = new System.Windows.Forms.TextBox();
            this.l_Name = new System.Windows.Forms.Label();
            this.tb_Name = new System.Windows.Forms.TextBox();
            this.bt_Action = new System.Windows.Forms.Button();
            this.bt_Cncl = new System.Windows.Forms.Button();
            this.cb_groupByEmit = new System.Windows.Forms.CheckBox();
            this.cb_IsComplex = new System.Windows.Forms.CheckBox();
            this.cb_QueryView = new System.Windows.Forms.ComboBox();
            this.cLquerieslistBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.lC3_devDataSet = new LC3_Prog.LC3_devDataSet();
            this.cL_queries_listTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters.CL_queries_listTableAdapter();
            this.cb_groupByInstr = new System.Windows.Forms.CheckBox();
            this.l_FTId = new System.Windows.Forms.Label();
            this.cb_FtIds = new System.Windows.Forms.ComboBox();
            this.factTablesListBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.factTablesListTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters.FactTablesListTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.cLquerieslistBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.lC3_devDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.factTablesListBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // l_Id
            // 
            this.l_Id.AutoSize = true;
            this.l_Id.Location = new System.Drawing.Point(6, 10);
            this.l_Id.Name = "l_Id";
            this.l_Id.Size = new System.Drawing.Size(16, 13);
            this.l_Id.TabIndex = 0;
            this.l_Id.Text = "Id";
            // 
            // tb_Id
            // 
            this.tb_Id.Location = new System.Drawing.Point(60, 6);
            this.tb_Id.Name = "tb_Id";
            this.tb_Id.Size = new System.Drawing.Size(100, 20);
            this.tb_Id.TabIndex = 1;
            // 
            // l_Name
            // 
            this.l_Name.AutoSize = true;
            this.l_Name.Location = new System.Drawing.Point(6, 40);
            this.l_Name.Name = "l_Name";
            this.l_Name.Size = new System.Drawing.Size(35, 13);
            this.l_Name.TabIndex = 2;
            this.l_Name.Text = "Name";
            // 
            // tb_Name
            // 
            this.tb_Name.Location = new System.Drawing.Point(60, 37);
            this.tb_Name.Name = "tb_Name";
            this.tb_Name.Size = new System.Drawing.Size(455, 20);
            this.tb_Name.TabIndex = 3;
            // 
            // bt_Action
            // 
            this.bt_Action.Location = new System.Drawing.Point(9, 161);
            this.bt_Action.Name = "bt_Action";
            this.bt_Action.Size = new System.Drawing.Size(96, 24);
            this.bt_Action.TabIndex = 4;
            this.bt_Action.Text = "Add";
            this.bt_Action.UseVisualStyleBackColor = true;
            this.bt_Action.Click += new System.EventHandler(this.bt_Action_Click);
            // 
            // bt_Cncl
            // 
            this.bt_Cncl.Location = new System.Drawing.Point(419, 161);
            this.bt_Cncl.Name = "bt_Cncl";
            this.bt_Cncl.Size = new System.Drawing.Size(96, 24);
            this.bt_Cncl.TabIndex = 5;
            this.bt_Cncl.Text = "Cancel";
            this.bt_Cncl.UseVisualStyleBackColor = true;
            this.bt_Cncl.Click += new System.EventHandler(this.bt_Cncl_Click);
            // 
            // cb_groupByEmit
            // 
            this.cb_groupByEmit.AutoSize = true;
            this.cb_groupByEmit.Location = new System.Drawing.Point(175, 9);
            this.cb_groupByEmit.Name = "cb_groupByEmit";
            this.cb_groupByEmit.Size = new System.Drawing.Size(165, 17);
            this.cb_groupByEmit.TabIndex = 6;
            this.cb_groupByEmit.Text = "Группировка по эмитентам";
            this.cb_groupByEmit.UseVisualStyleBackColor = true;
            // 
            // cb_IsComplex
            // 
            this.cb_IsComplex.AutoSize = true;
            this.cb_IsComplex.CausesValidation = false;
            this.cb_IsComplex.Checked = true;
            this.cb_IsComplex.CheckState = System.Windows.Forms.CheckState.Checked;
            this.cb_IsComplex.Location = new System.Drawing.Point(9, 71);
            this.cb_IsComplex.Name = "cb_IsComplex";
            this.cb_IsComplex.Size = new System.Drawing.Size(244, 17);
            this.cb_IsComplex.TabIndex = 7;
            this.cb_IsComplex.Text = "Лимит составной (если нет - укажите view)";
            this.cb_IsComplex.UseVisualStyleBackColor = true;
            // 
            // cb_QueryView
            // 
            this.cb_QueryView.DataSource = this.cLquerieslistBindingSource;
            this.cb_QueryView.DisplayMember = "name";
            this.cb_QueryView.FormattingEnabled = true;
            this.cb_QueryView.Location = new System.Drawing.Point(254, 67);
            this.cb_QueryView.Name = "cb_QueryView";
            this.cb_QueryView.Size = new System.Drawing.Size(261, 21);
            this.cb_QueryView.TabIndex = 9;
            this.cb_QueryView.ValueMember = "name";
            // 
            // cLquerieslistBindingSource
            // 
            this.cLquerieslistBindingSource.DataMember = "CL_queries_list";
            this.cLquerieslistBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // lC3_devDataSet
            // 
            this.lC3_devDataSet.DataSetName = "LC3_devDataSet";
            this.lC3_devDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // cL_queries_listTableAdapter
            // 
            this.cL_queries_listTableAdapter.ClearBeforeFill = true;
            // 
            // cb_groupByInstr
            // 
            this.cb_groupByInstr.AutoSize = true;
            this.cb_groupByInstr.Location = new System.Drawing.Point(346, 9);
            this.cb_groupByInstr.Name = "cb_groupByInstr";
            this.cb_groupByInstr.Size = new System.Drawing.Size(166, 17);
            this.cb_groupByInstr.TabIndex = 10;
            this.cb_groupByInstr.Text = "Разбивка по инструментам";
            this.cb_groupByInstr.UseVisualStyleBackColor = true;
            // 
            // l_FTId
            // 
            this.l_FTId.AutoSize = true;
            this.l_FTId.Location = new System.Drawing.Point(6, 100);
            this.l_FTId.Name = "l_FTId";
            this.l_FTId.Size = new System.Drawing.Size(132, 13);
            this.l_FTId.TabIndex = 11;
            this.l_FTId.Text = "Использовать портфель";
            // 
            // cb_FtIds
            // 
            this.cb_FtIds.DataSource = this.factTablesListBindingSource;
            this.cb_FtIds.DisplayMember = "Comment";
            this.cb_FtIds.FormattingEnabled = true;
            this.cb_FtIds.Location = new System.Drawing.Point(144, 97);
            this.cb_FtIds.Name = "cb_FtIds";
            this.cb_FtIds.Size = new System.Drawing.Size(371, 21);
            this.cb_FtIds.TabIndex = 12;
            this.cb_FtIds.ValueMember = "Id";
            // 
            // factTablesListBindingSource
            // 
            this.factTablesListBindingSource.DataMember = "FactTablesList";
            this.factTablesListBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // factTablesListTableAdapter
            // 
            this.factTablesListTableAdapter.ClearBeforeFill = true;
            // 
            // F_AddUpdDel
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(524, 216);
            this.ControlBox = false;
            this.Controls.Add(this.cb_FtIds);
            this.Controls.Add(this.l_FTId);
            this.Controls.Add(this.cb_groupByInstr);
            this.Controls.Add(this.cb_QueryView);
            this.Controls.Add(this.cb_IsComplex);
            this.Controls.Add(this.cb_groupByEmit);
            this.Controls.Add(this.bt_Cncl);
            this.Controls.Add(this.bt_Action);
            this.Controls.Add(this.tb_Name);
            this.Controls.Add(this.l_Name);
            this.Controls.Add(this.tb_Id);
            this.Controls.Add(this.l_Id);
            this.Name = "F_AddUpdDel";
            this.Text = "F_AddUpdDel";
            this.Load += new System.EventHandler(this.F_AddUpdDel_Load);
            ((System.ComponentModel.ISupportInitialize)(this.cLquerieslistBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.lC3_devDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.factTablesListBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label l_Id;
        private System.Windows.Forms.TextBox tb_Id;
        private System.Windows.Forms.Label l_Name;
        private System.Windows.Forms.TextBox tb_Name;
        private System.Windows.Forms.Button bt_Action;
        private System.Windows.Forms.Button bt_Cncl;
        private System.Windows.Forms.CheckBox cb_groupByEmit;
        private System.Windows.Forms.CheckBox cb_IsComplex;
        private LC3_devDataSet lC3_devDataSet;
        private System.Windows.Forms.BindingSource cLquerieslistBindingSource;
        private LC3_devDataSetTableAdapters.CL_queries_listTableAdapter cL_queries_listTableAdapter;
        private System.Windows.Forms.ComboBox cb_QueryView;
        private System.Windows.Forms.CheckBox cb_groupByInstr;
        private System.Windows.Forms.Label l_FTId;
        private System.Windows.Forms.ComboBox cb_FtIds;
        private System.Windows.Forms.BindingSource factTablesListBindingSource;
        private LC3_devDataSetTableAdapters.FactTablesListTableAdapter factTablesListTableAdapter;
    }
}