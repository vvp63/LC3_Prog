namespace LC3_Prog
{
    partial class F_SL_5Percent
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
            this.btClose = new System.Windows.Forms.Button();
            this.dgvEvents = new System.Windows.Forms.DataGridView();
            this.dateDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cBNameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cBDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.iDCBSDHDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pCurrDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pPrevDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.readedDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.readerDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sLEventsBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.lC3_devDataSet = new LC3_Prog.LC3_devDataSet();
            this.sL_EventsTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters.SL_EventsTableAdapter();
            this.cb_Date = new System.Windows.Forms.ComboBox();
            this.sLDatesBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.l_Date = new System.Windows.Forms.Label();
            this.sL_DatesTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters.SL_DatesTableAdapter();
            this.fillByToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.fillBy_OrderedToolStripButton = new System.Windows.Forms.ToolStripButton();
            this.dgvPortfolio = new System.Windows.Forms.DataGridView();
            this.sLDataBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.sL_DataTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters.SL_DataTableAdapter();
            this.sLDateDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cBNameDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cBDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.iDCBSDHDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.regCodeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.summQtyDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.announcedvolumeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.percentDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dgvEvents)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.sLEventsBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.lC3_devDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.sLDatesBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPortfolio)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.sLDataBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // btClose
            // 
            this.btClose.Location = new System.Drawing.Point(581, 629);
            this.btClose.Name = "btClose";
            this.btClose.Size = new System.Drawing.Size(75, 23);
            this.btClose.TabIndex = 0;
            this.btClose.Text = "Close";
            this.btClose.UseVisualStyleBackColor = true;
            this.btClose.Click += new System.EventHandler(this.btClose_Click);
            // 
            // dgvEvents
            // 
            this.dgvEvents.AllowUserToAddRows = false;
            this.dgvEvents.AllowUserToDeleteRows = false;
            this.dgvEvents.AllowUserToResizeColumns = false;
            this.dgvEvents.AutoGenerateColumns = false;
            this.dgvEvents.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvEvents.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dateDataGridViewTextBoxColumn,
            this.cBNameDataGridViewTextBoxColumn,
            this.cBDataGridViewTextBoxColumn,
            this.iDCBSDHDataGridViewTextBoxColumn,
            this.pCurrDataGridViewTextBoxColumn,
            this.pPrevDataGridViewTextBoxColumn,
            this.readedDataGridViewTextBoxColumn,
            this.readerDataGridViewTextBoxColumn});
            this.dgvEvents.DataSource = this.sLEventsBindingSource;
            this.dgvEvents.Location = new System.Drawing.Point(12, 12);
            this.dgvEvents.Name = "dgvEvents";
            this.dgvEvents.RowHeadersWidth = 5;
            this.dgvEvents.Size = new System.Drawing.Size(644, 150);
            this.dgvEvents.TabIndex = 1;
            this.dgvEvents.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvEvents_CellDoubleClick);
            // 
            // dateDataGridViewTextBoxColumn
            // 
            this.dateDataGridViewTextBoxColumn.DataPropertyName = "Date";
            this.dateDataGridViewTextBoxColumn.HeaderText = "Date";
            this.dateDataGridViewTextBoxColumn.Name = "dateDataGridViewTextBoxColumn";
            // 
            // cBNameDataGridViewTextBoxColumn
            // 
            this.cBNameDataGridViewTextBoxColumn.DataPropertyName = "CB_Name";
            this.cBNameDataGridViewTextBoxColumn.HeaderText = "CB_Name";
            this.cBNameDataGridViewTextBoxColumn.MinimumWidth = 150;
            this.cBNameDataGridViewTextBoxColumn.Name = "cBNameDataGridViewTextBoxColumn";
            this.cBNameDataGridViewTextBoxColumn.Width = 150;
            // 
            // cBDataGridViewTextBoxColumn
            // 
            this.cBDataGridViewTextBoxColumn.DataPropertyName = "CB";
            this.cBDataGridViewTextBoxColumn.HeaderText = "CB";
            this.cBDataGridViewTextBoxColumn.MinimumWidth = 150;
            this.cBDataGridViewTextBoxColumn.Name = "cBDataGridViewTextBoxColumn";
            this.cBDataGridViewTextBoxColumn.Width = 150;
            // 
            // iDCBSDHDataGridViewTextBoxColumn
            // 
            this.iDCBSDHDataGridViewTextBoxColumn.DataPropertyName = "ID_CB_SDH";
            this.iDCBSDHDataGridViewTextBoxColumn.HeaderText = "ID_CB_SDH";
            this.iDCBSDHDataGridViewTextBoxColumn.Name = "iDCBSDHDataGridViewTextBoxColumn";
            this.iDCBSDHDataGridViewTextBoxColumn.Visible = false;
            // 
            // pCurrDataGridViewTextBoxColumn
            // 
            this.pCurrDataGridViewTextBoxColumn.DataPropertyName = "PCurr";
            this.pCurrDataGridViewTextBoxColumn.HeaderText = "PCurr";
            this.pCurrDataGridViewTextBoxColumn.Name = "pCurrDataGridViewTextBoxColumn";
            // 
            // pPrevDataGridViewTextBoxColumn
            // 
            this.pPrevDataGridViewTextBoxColumn.DataPropertyName = "PPrev";
            this.pPrevDataGridViewTextBoxColumn.HeaderText = "PPrev";
            this.pPrevDataGridViewTextBoxColumn.Name = "pPrevDataGridViewTextBoxColumn";
            // 
            // readedDataGridViewTextBoxColumn
            // 
            this.readedDataGridViewTextBoxColumn.DataPropertyName = "Readed";
            this.readedDataGridViewTextBoxColumn.HeaderText = "Readed";
            this.readedDataGridViewTextBoxColumn.Name = "readedDataGridViewTextBoxColumn";
            this.readedDataGridViewTextBoxColumn.Visible = false;
            // 
            // readerDataGridViewTextBoxColumn
            // 
            this.readerDataGridViewTextBoxColumn.DataPropertyName = "Reader";
            this.readerDataGridViewTextBoxColumn.HeaderText = "Reader";
            this.readerDataGridViewTextBoxColumn.Name = "readerDataGridViewTextBoxColumn";
            this.readerDataGridViewTextBoxColumn.Visible = false;
            // 
            // sLEventsBindingSource
            // 
            this.sLEventsBindingSource.DataMember = "SL_Events";
            this.sLEventsBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // lC3_devDataSet
            // 
            this.lC3_devDataSet.DataSetName = "LC3_devDataSet";
            this.lC3_devDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // sL_EventsTableAdapter
            // 
            this.sL_EventsTableAdapter.ClearBeforeFill = true;
            // 
            // cb_Date
            // 
            this.cb_Date.DataSource = this.sLDatesBindingSource;
            this.cb_Date.DisplayMember = "SLDate";
            this.cb_Date.FormattingEnabled = true;
            this.cb_Date.Location = new System.Drawing.Point(116, 188);
            this.cb_Date.Name = "cb_Date";
            this.cb_Date.Size = new System.Drawing.Size(161, 21);
            this.cb_Date.TabIndex = 2;
            this.cb_Date.ValueMember = "DateNum";
            this.cb_Date.SelectionChangeCommitted += new System.EventHandler(this.DateChanged);
            // 
            // sLDatesBindingSource
            // 
            this.sLDatesBindingSource.DataMember = "SL_Dates";
            this.sLDatesBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // l_Date
            // 
            this.l_Date.AutoSize = true;
            this.l_Date.Location = new System.Drawing.Point(12, 191);
            this.l_Date.Name = "l_Date";
            this.l_Date.Size = new System.Drawing.Size(98, 13);
            this.l_Date.TabIndex = 3;
            this.l_Date.Text = "Портфель на дату";
            // 
            // sL_DatesTableAdapter
            // 
            this.sL_DatesTableAdapter.ClearBeforeFill = true;
            // 
            // fillByToolStripButton
            // 
            this.fillByToolStripButton.Name = "fillByToolStripButton";
            this.fillByToolStripButton.Size = new System.Drawing.Size(23, 23);
            // 
            // fillBy_OrderedToolStripButton
            // 
            this.fillBy_OrderedToolStripButton.Name = "fillBy_OrderedToolStripButton";
            this.fillBy_OrderedToolStripButton.Size = new System.Drawing.Size(23, 23);
            // 
            // dgvPortfolio
            // 
            this.dgvPortfolio.AllowUserToAddRows = false;
            this.dgvPortfolio.AllowUserToDeleteRows = false;
            this.dgvPortfolio.AutoGenerateColumns = false;
            this.dgvPortfolio.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvPortfolio.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.sLDateDataGridViewTextBoxColumn,
            this.cBNameDataGridViewTextBoxColumn1,
            this.cBDataGridViewTextBoxColumn1,
            this.iDCBSDHDataGridViewTextBoxColumn1,
            this.regCodeDataGridViewTextBoxColumn,
            this.summQtyDataGridViewTextBoxColumn,
            this.announcedvolumeDataGridViewTextBoxColumn,
            this.percentDataGridViewTextBoxColumn});
            this.dgvPortfolio.DataSource = this.sLDataBindingSource;
            this.dgvPortfolio.Location = new System.Drawing.Point(15, 222);
            this.dgvPortfolio.Name = "dgvPortfolio";
            this.dgvPortfolio.RowHeadersWidth = 5;
            this.dgvPortfolio.Size = new System.Drawing.Size(641, 393);
            this.dgvPortfolio.TabIndex = 4;
            // 
            // sLDataBindingSource
            // 
            this.sLDataBindingSource.DataMember = "SL_Data";
            this.sLDataBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // sL_DataTableAdapter
            // 
            this.sL_DataTableAdapter.ClearBeforeFill = true;
            // 
            // sLDateDataGridViewTextBoxColumn
            // 
            this.sLDateDataGridViewTextBoxColumn.DataPropertyName = "SLDate";
            this.sLDateDataGridViewTextBoxColumn.HeaderText = "SLDate";
            this.sLDateDataGridViewTextBoxColumn.Name = "sLDateDataGridViewTextBoxColumn";
            this.sLDateDataGridViewTextBoxColumn.Visible = false;
            // 
            // cBNameDataGridViewTextBoxColumn1
            // 
            this.cBNameDataGridViewTextBoxColumn1.DataPropertyName = "CB_Name";
            this.cBNameDataGridViewTextBoxColumn1.HeaderText = "CB_Name";
            this.cBNameDataGridViewTextBoxColumn1.Name = "cBNameDataGridViewTextBoxColumn1";
            // 
            // cBDataGridViewTextBoxColumn1
            // 
            this.cBDataGridViewTextBoxColumn1.DataPropertyName = "CB";
            this.cBDataGridViewTextBoxColumn1.HeaderText = "CB";
            this.cBDataGridViewTextBoxColumn1.Name = "cBDataGridViewTextBoxColumn1";
            // 
            // iDCBSDHDataGridViewTextBoxColumn1
            // 
            this.iDCBSDHDataGridViewTextBoxColumn1.DataPropertyName = "ID_CB_SDH";
            this.iDCBSDHDataGridViewTextBoxColumn1.HeaderText = "ID_CB_SDH";
            this.iDCBSDHDataGridViewTextBoxColumn1.Name = "iDCBSDHDataGridViewTextBoxColumn1";
            this.iDCBSDHDataGridViewTextBoxColumn1.Visible = false;
            // 
            // regCodeDataGridViewTextBoxColumn
            // 
            this.regCodeDataGridViewTextBoxColumn.DataPropertyName = "RegCode";
            this.regCodeDataGridViewTextBoxColumn.HeaderText = "RegCode";
            this.regCodeDataGridViewTextBoxColumn.Name = "regCodeDataGridViewTextBoxColumn";
            this.regCodeDataGridViewTextBoxColumn.Visible = false;
            // 
            // summQtyDataGridViewTextBoxColumn
            // 
            this.summQtyDataGridViewTextBoxColumn.DataPropertyName = "SummQty";
            this.summQtyDataGridViewTextBoxColumn.HeaderText = "SummQty";
            this.summQtyDataGridViewTextBoxColumn.Name = "summQtyDataGridViewTextBoxColumn";
            // 
            // announcedvolumeDataGridViewTextBoxColumn
            // 
            this.announcedvolumeDataGridViewTextBoxColumn.DataPropertyName = "announced_volume";
            this.announcedvolumeDataGridViewTextBoxColumn.HeaderText = "IssueVolume";
            this.announcedvolumeDataGridViewTextBoxColumn.Name = "announcedvolumeDataGridViewTextBoxColumn";
            // 
            // percentDataGridViewTextBoxColumn
            // 
            this.percentDataGridViewTextBoxColumn.DataPropertyName = "Percent";
            this.percentDataGridViewTextBoxColumn.HeaderText = "Percent";
            this.percentDataGridViewTextBoxColumn.Name = "percentDataGridViewTextBoxColumn";
            // 
            // F_SL_5Percent
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(676, 672);
            this.ControlBox = false;
            this.Controls.Add(this.dgvPortfolio);
            this.Controls.Add(this.l_Date);
            this.Controls.Add(this.cb_Date);
            this.Controls.Add(this.dgvEvents);
            this.Controls.Add(this.btClose);
            this.Name = "F_SL_5Percent";
            this.Text = "Контроль 5% от суммарного выпуска акций";
            this.Load += new System.EventHandler(this.F_SL_5Percent_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvEvents)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.sLEventsBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.lC3_devDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.sLDatesBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPortfolio)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.sLDataBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btClose;
        private System.Windows.Forms.DataGridView dgvEvents;
        private LC3_devDataSet lC3_devDataSet;
        private System.Windows.Forms.BindingSource sLEventsBindingSource;
        private LC3_devDataSetTableAdapters.SL_EventsTableAdapter sL_EventsTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn dateDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn cBNameDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn cBDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn iDCBSDHDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn pCurrDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn pPrevDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn readedDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn readerDataGridViewTextBoxColumn;
        private System.Windows.Forms.ComboBox cb_Date;
        private System.Windows.Forms.Label l_Date;
        private System.Windows.Forms.BindingSource sLDatesBindingSource;
        private LC3_devDataSetTableAdapters.SL_DatesTableAdapter sL_DatesTableAdapter;
        private System.Windows.Forms.ToolStripButton fillByToolStripButton;
        private System.Windows.Forms.ToolStripButton fillBy_OrderedToolStripButton;
        private System.Windows.Forms.DataGridView dgvPortfolio;
        private System.Windows.Forms.BindingSource sLDataBindingSource;
        private LC3_devDataSetTableAdapters.SL_DataTableAdapter sL_DataTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn sLDateDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn cBNameDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn cBDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn iDCBSDHDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn regCodeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn summQtyDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn announcedvolumeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn percentDataGridViewTextBoxColumn;
    }
}