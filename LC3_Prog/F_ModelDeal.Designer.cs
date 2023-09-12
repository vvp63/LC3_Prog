namespace LC3_Prog
{
    partial class F_ModelDeal
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
            this._CL_ClientsTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters._CL_ClientsTableAdapter();
            this.l_Instrument = new System.Windows.Forms.Label();
            this.tb_Find = new System.Windows.Forms.TextBox();
            this.l_Find = new System.Windows.Forms.Label();
            this.cb_Tools = new System.Windows.Forms.ComboBox();
            this.modelToolsBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.model_ToolsTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters.Model_ToolsTableAdapter();
            this.l_rid = new System.Windows.Forms.Label();
            this.l_Qty = new System.Windows.Forms.Label();
            this.tb_Quantity = new System.Windows.Forms.TextBox();
            this.l_Value = new System.Windows.Forms.Label();
            this.tb_Value = new System.Windows.Forms.TextBox();
            this.b_AddDeal = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.cLClientsBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.lC3_devDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.modelToolsBindingSource)).BeginInit();
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
            this.cb_Clients.DisplayMember = "ПолноеНаименование";
            this.cb_Clients.FormattingEnabled = true;
            this.cb_Clients.Location = new System.Drawing.Point(62, 10);
            this.cb_Clients.Name = "cb_Clients";
            this.cb_Clients.Size = new System.Drawing.Size(450, 21);
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
            // _CL_ClientsTableAdapter
            // 
            this._CL_ClientsTableAdapter.ClearBeforeFill = true;
            // 
            // l_Instrument
            // 
            this.l_Instrument.AutoSize = true;
            this.l_Instrument.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.l_Instrument.Location = new System.Drawing.Point(16, 58);
            this.l_Instrument.Name = "l_Instrument";
            this.l_Instrument.Size = new System.Drawing.Size(246, 13);
            this.l_Instrument.TabIndex = 2;
            this.l_Instrument.Text = "Инструмент (эмитент, тикер, ГРН, ISIN)";
            // 
            // tb_Find
            // 
            this.tb_Find.Location = new System.Drawing.Point(64, 83);
            this.tb_Find.Name = "tb_Find";
            this.tb_Find.Size = new System.Drawing.Size(448, 20);
            this.tb_Find.TabIndex = 3;
            this.tb_Find.TextChanged += new System.EventHandler(this.FindTools);
            // 
            // l_Find
            // 
            this.l_Find.AutoSize = true;
            this.l_Find.Location = new System.Drawing.Point(19, 86);
            this.l_Find.Name = "l_Find";
            this.l_Find.Size = new System.Drawing.Size(39, 13);
            this.l_Find.TabIndex = 4;
            this.l_Find.Text = "Поиск";
            // 
            // cb_Tools
            // 
            this.cb_Tools.DataSource = this.modelToolsBindingSource;
            this.cb_Tools.DisplayMember = "Fullname";
            this.cb_Tools.FormattingEnabled = true;
            this.cb_Tools.Location = new System.Drawing.Point(22, 113);
            this.cb_Tools.Name = "cb_Tools";
            this.cb_Tools.Size = new System.Drawing.Size(490, 21);
            this.cb_Tools.TabIndex = 5;
            this.cb_Tools.ValueMember = "rid";
            this.cb_Tools.SelectedValueChanged += new System.EventHandler(this.ValueChanged);
            // 
            // modelToolsBindingSource
            // 
            this.modelToolsBindingSource.DataMember = "Model_Tools";
            this.modelToolsBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // model_ToolsTableAdapter
            // 
            this.model_ToolsTableAdapter.ClearBeforeFill = true;
            // 
            // l_rid
            // 
            this.l_rid.AutoSize = true;
            this.l_rid.ForeColor = System.Drawing.SystemColors.ControlDarkDark;
            this.l_rid.Location = new System.Drawing.Point(290, 58);
            this.l_rid.Name = "l_rid";
            this.l_rid.Size = new System.Drawing.Size(0, 13);
            this.l_rid.TabIndex = 6;
            // 
            // l_Qty
            // 
            this.l_Qty.AutoSize = true;
            this.l_Qty.Location = new System.Drawing.Point(22, 172);
            this.l_Qty.Name = "l_Qty";
            this.l_Qty.Size = new System.Drawing.Size(66, 13);
            this.l_Qty.TabIndex = 7;
            this.l_Qty.Text = "Количество";
            // 
            // tb_Quantity
            // 
            this.tb_Quantity.Location = new System.Drawing.Point(94, 169);
            this.tb_Quantity.Name = "tb_Quantity";
            this.tb_Quantity.Size = new System.Drawing.Size(118, 20);
            this.tb_Quantity.TabIndex = 8;
            // 
            // l_Value
            // 
            this.l_Value.AutoSize = true;
            this.l_Value.Location = new System.Drawing.Point(299, 172);
            this.l_Value.Name = "l_Value";
            this.l_Value.Size = new System.Drawing.Size(42, 13);
            this.l_Value.TabIndex = 9;
            this.l_Value.Text = "Объем";
            // 
            // tb_Value
            // 
            this.tb_Value.Location = new System.Drawing.Point(347, 168);
            this.tb_Value.Name = "tb_Value";
            this.tb_Value.Size = new System.Drawing.Size(165, 20);
            this.tb_Value.TabIndex = 10;
            // 
            // b_AddDeal
            // 
            this.b_AddDeal.Location = new System.Drawing.Point(347, 211);
            this.b_AddDeal.Name = "b_AddDeal";
            this.b_AddDeal.Size = new System.Drawing.Size(164, 23);
            this.b_AddDeal.TabIndex = 11;
            this.b_AddDeal.Text = "Добавить сделку";
            this.b_AddDeal.UseVisualStyleBackColor = true;
            this.b_AddDeal.Click += new System.EventHandler(this.AddDeal);
            // 
            // F_ModelDeal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(528, 268);
            this.Controls.Add(this.b_AddDeal);
            this.Controls.Add(this.tb_Value);
            this.Controls.Add(this.l_Value);
            this.Controls.Add(this.tb_Quantity);
            this.Controls.Add(this.l_Qty);
            this.Controls.Add(this.l_rid);
            this.Controls.Add(this.cb_Tools);
            this.Controls.Add(this.l_Find);
            this.Controls.Add(this.tb_Find);
            this.Controls.Add(this.l_Instrument);
            this.Controls.Add(this.cb_Clients);
            this.Controls.Add(this.l_Client);
            this.Name = "F_ModelDeal";
            this.Text = "Добавить сделку в модельный портфель";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.ClosingForm);
            this.Load += new System.EventHandler(this.F_ModelDeal_Load);
            ((System.ComponentModel.ISupportInitialize)(this.cLClientsBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.lC3_devDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.modelToolsBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label l_Client;
        private System.Windows.Forms.ComboBox cb_Clients;
        private LC3_devDataSet lC3_devDataSet;
        private System.Windows.Forms.BindingSource cLClientsBindingSource;
        private LC3_devDataSetTableAdapters._CL_ClientsTableAdapter _CL_ClientsTableAdapter;
        private System.Windows.Forms.Label l_Instrument;
        private System.Windows.Forms.TextBox tb_Find;
        private System.Windows.Forms.Label l_Find;
        private System.Windows.Forms.ComboBox cb_Tools;
        private System.Windows.Forms.BindingSource modelToolsBindingSource;
        private LC3_devDataSetTableAdapters.Model_ToolsTableAdapter model_ToolsTableAdapter;
        private System.Windows.Forms.Label l_rid;
        private System.Windows.Forms.Label l_Qty;
        private System.Windows.Forms.TextBox tb_Quantity;
        private System.Windows.Forms.Label l_Value;
        private System.Windows.Forms.TextBox tb_Value;
        private System.Windows.Forms.Button b_AddDeal;
    }
}