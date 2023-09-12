namespace LC3_Prog
{
    partial class F_AU_List
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
            this.b_Cancel = new System.Windows.Forms.Button();
            this.dgv_AU_Bonds = new System.Windows.Forms.DataGridView();
            this.nameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ratingDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.typeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ownRatingDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ownCommentDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.remarkDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.aUListBondsBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.lC3_devDataSet = new LC3_Prog.LC3_devDataSet();
            this.aU_ListBondsTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters.AU_ListBondsTableAdapter();
            this.dgv_AU_Stocks = new System.Windows.Forms.DataGridView();
            this.nameDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ratingDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.typeDataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.qsheetDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.inIndexDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.aUListStocksBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.lC3_devDataSet1 = new LC3_Prog.LC3_devDataSet();
            this.aU_ListStocksTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters.AU_ListStocksTableAdapter();
            this.l_Bonds = new System.Windows.Forms.Label();
            this.l_Stocks = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.OFD = new System.Windows.Forms.OpenFileDialog();
            this.tb_Log = new System.Windows.Forms.TextBox();
            this.l_Sheet = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_AU_Bonds)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.aUListBondsBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.lC3_devDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_AU_Stocks)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.aUListStocksBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.lC3_devDataSet1)).BeginInit();
            this.SuspendLayout();
            // 
            // b_Cancel
            // 
            this.b_Cancel.Location = new System.Drawing.Point(821, 644);
            this.b_Cancel.Name = "b_Cancel";
            this.b_Cancel.Size = new System.Drawing.Size(75, 23);
            this.b_Cancel.TabIndex = 0;
            this.b_Cancel.Text = "Cancel";
            this.b_Cancel.UseVisualStyleBackColor = true;
            this.b_Cancel.Click += new System.EventHandler(this.Cancel);
            // 
            // dgv_AU_Bonds
            // 
            this.dgv_AU_Bonds.AllowUserToAddRows = false;
            this.dgv_AU_Bonds.AllowUserToDeleteRows = false;
            this.dgv_AU_Bonds.AutoGenerateColumns = false;
            this.dgv_AU_Bonds.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_AU_Bonds.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.nameDataGridViewTextBoxColumn,
            this.ratingDataGridViewTextBoxColumn,
            this.typeDataGridViewTextBoxColumn,
            this.ownRatingDataGridViewTextBoxColumn,
            this.ownCommentDataGridViewTextBoxColumn,
            this.remarkDataGridViewTextBoxColumn});
            this.dgv_AU_Bonds.DataSource = this.aUListBondsBindingSource;
            this.dgv_AU_Bonds.Location = new System.Drawing.Point(6, 30);
            this.dgv_AU_Bonds.Name = "dgv_AU_Bonds";
            this.dgv_AU_Bonds.ReadOnly = true;
            this.dgv_AU_Bonds.RowHeadersWidth = 25;
            this.dgv_AU_Bonds.Size = new System.Drawing.Size(890, 290);
            this.dgv_AU_Bonds.TabIndex = 1;
            // 
            // nameDataGridViewTextBoxColumn
            // 
            this.nameDataGridViewTextBoxColumn.DataPropertyName = "name";
            this.nameDataGridViewTextBoxColumn.HeaderText = "Эмитент";
            this.nameDataGridViewTextBoxColumn.MinimumWidth = 200;
            this.nameDataGridViewTextBoxColumn.Name = "nameDataGridViewTextBoxColumn";
            this.nameDataGridViewTextBoxColumn.ReadOnly = true;
            this.nameDataGridViewTextBoxColumn.Width = 200;
            // 
            // ratingDataGridViewTextBoxColumn
            // 
            this.ratingDataGridViewTextBoxColumn.DataPropertyName = "Rating";
            this.ratingDataGridViewTextBoxColumn.HeaderText = "Рейтинг";
            this.ratingDataGridViewTextBoxColumn.MinimumWidth = 150;
            this.ratingDataGridViewTextBoxColumn.Name = "ratingDataGridViewTextBoxColumn";
            this.ratingDataGridViewTextBoxColumn.ReadOnly = true;
            this.ratingDataGridViewTextBoxColumn.Width = 150;
            // 
            // typeDataGridViewTextBoxColumn
            // 
            this.typeDataGridViewTextBoxColumn.DataPropertyName = "Type";
            this.typeDataGridViewTextBoxColumn.HeaderText = "Тип";
            this.typeDataGridViewTextBoxColumn.MinimumWidth = 50;
            this.typeDataGridViewTextBoxColumn.Name = "typeDataGridViewTextBoxColumn";
            this.typeDataGridViewTextBoxColumn.ReadOnly = true;
            this.typeDataGridViewTextBoxColumn.Width = 50;
            // 
            // ownRatingDataGridViewTextBoxColumn
            // 
            this.ownRatingDataGridViewTextBoxColumn.DataPropertyName = "Own_Rating";
            this.ownRatingDataGridViewTextBoxColumn.HeaderText = "Внутр. ";
            this.ownRatingDataGridViewTextBoxColumn.MinimumWidth = 50;
            this.ownRatingDataGridViewTextBoxColumn.Name = "ownRatingDataGridViewTextBoxColumn";
            this.ownRatingDataGridViewTextBoxColumn.ReadOnly = true;
            this.ownRatingDataGridViewTextBoxColumn.Width = 50;
            // 
            // ownCommentDataGridViewTextBoxColumn
            // 
            this.ownCommentDataGridViewTextBoxColumn.DataPropertyName = "Own_Comment";
            this.ownCommentDataGridViewTextBoxColumn.HeaderText = "Риск";
            this.ownCommentDataGridViewTextBoxColumn.MinimumWidth = 80;
            this.ownCommentDataGridViewTextBoxColumn.Name = "ownCommentDataGridViewTextBoxColumn";
            this.ownCommentDataGridViewTextBoxColumn.ReadOnly = true;
            this.ownCommentDataGridViewTextBoxColumn.Width = 80;
            // 
            // remarkDataGridViewTextBoxColumn
            // 
            this.remarkDataGridViewTextBoxColumn.DataPropertyName = "Remark";
            this.remarkDataGridViewTextBoxColumn.HeaderText = "Комментарий";
            this.remarkDataGridViewTextBoxColumn.MinimumWidth = 300;
            this.remarkDataGridViewTextBoxColumn.Name = "remarkDataGridViewTextBoxColumn";
            this.remarkDataGridViewTextBoxColumn.ReadOnly = true;
            this.remarkDataGridViewTextBoxColumn.Width = 300;
            // 
            // aUListBondsBindingSource
            // 
            this.aUListBondsBindingSource.DataMember = "AU_ListBonds";
            this.aUListBondsBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // lC3_devDataSet
            // 
            this.lC3_devDataSet.DataSetName = "LC3_devDataSet";
            this.lC3_devDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // aU_ListBondsTableAdapter
            // 
            this.aU_ListBondsTableAdapter.ClearBeforeFill = true;
            // 
            // dgv_AU_Stocks
            // 
            this.dgv_AU_Stocks.AllowUserToAddRows = false;
            this.dgv_AU_Stocks.AllowUserToDeleteRows = false;
            this.dgv_AU_Stocks.AutoGenerateColumns = false;
            this.dgv_AU_Stocks.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_AU_Stocks.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.nameDataGridViewTextBoxColumn1,
            this.ratingDataGridViewTextBoxColumn1,
            this.typeDataGridViewTextBoxColumn1,
            this.qsheetDataGridViewTextBoxColumn,
            this.inIndexDataGridViewTextBoxColumn});
            this.dgv_AU_Stocks.DataSource = this.aUListStocksBindingSource;
            this.dgv_AU_Stocks.Location = new System.Drawing.Point(6, 355);
            this.dgv_AU_Stocks.Name = "dgv_AU_Stocks";
            this.dgv_AU_Stocks.ReadOnly = true;
            this.dgv_AU_Stocks.RowHeadersWidth = 25;
            this.dgv_AU_Stocks.Size = new System.Drawing.Size(890, 274);
            this.dgv_AU_Stocks.TabIndex = 2;
            // 
            // nameDataGridViewTextBoxColumn1
            // 
            this.nameDataGridViewTextBoxColumn1.DataPropertyName = "name";
            this.nameDataGridViewTextBoxColumn1.HeaderText = "Эмитент";
            this.nameDataGridViewTextBoxColumn1.MinimumWidth = 200;
            this.nameDataGridViewTextBoxColumn1.Name = "nameDataGridViewTextBoxColumn1";
            this.nameDataGridViewTextBoxColumn1.ReadOnly = true;
            this.nameDataGridViewTextBoxColumn1.Width = 200;
            // 
            // ratingDataGridViewTextBoxColumn1
            // 
            this.ratingDataGridViewTextBoxColumn1.DataPropertyName = "Rating";
            this.ratingDataGridViewTextBoxColumn1.HeaderText = "Рейтинг";
            this.ratingDataGridViewTextBoxColumn1.MinimumWidth = 200;
            this.ratingDataGridViewTextBoxColumn1.Name = "ratingDataGridViewTextBoxColumn1";
            this.ratingDataGridViewTextBoxColumn1.ReadOnly = true;
            this.ratingDataGridViewTextBoxColumn1.Width = 200;
            // 
            // typeDataGridViewTextBoxColumn1
            // 
            this.typeDataGridViewTextBoxColumn1.DataPropertyName = "Type";
            this.typeDataGridViewTextBoxColumn1.HeaderText = "Тип";
            this.typeDataGridViewTextBoxColumn1.MinimumWidth = 70;
            this.typeDataGridViewTextBoxColumn1.Name = "typeDataGridViewTextBoxColumn1";
            this.typeDataGridViewTextBoxColumn1.ReadOnly = true;
            // 
            // qsheetDataGridViewTextBoxColumn
            // 
            this.qsheetDataGridViewTextBoxColumn.DataPropertyName = "qsheet";
            this.qsheetDataGridViewTextBoxColumn.HeaderText = "Кот. лист";
            this.qsheetDataGridViewTextBoxColumn.MinimumWidth = 100;
            this.qsheetDataGridViewTextBoxColumn.Name = "qsheetDataGridViewTextBoxColumn";
            this.qsheetDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // inIndexDataGridViewTextBoxColumn
            // 
            this.inIndexDataGridViewTextBoxColumn.DataPropertyName = "InIndex";
            this.inIndexDataGridViewTextBoxColumn.HeaderText = "Индекс ММВБ";
            this.inIndexDataGridViewTextBoxColumn.MinimumWidth = 150;
            this.inIndexDataGridViewTextBoxColumn.Name = "inIndexDataGridViewTextBoxColumn";
            this.inIndexDataGridViewTextBoxColumn.ReadOnly = true;
            this.inIndexDataGridViewTextBoxColumn.Width = 150;
            // 
            // aUListStocksBindingSource
            // 
            this.aUListStocksBindingSource.DataMember = "AU_ListStocks";
            this.aUListStocksBindingSource.DataSource = this.lC3_devDataSet1;
            // 
            // lC3_devDataSet1
            // 
            this.lC3_devDataSet1.DataSetName = "LC3_devDataSet";
            this.lC3_devDataSet1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // aU_ListStocksTableAdapter
            // 
            this.aU_ListStocksTableAdapter.ClearBeforeFill = true;
            // 
            // l_Bonds
            // 
            this.l_Bonds.AutoSize = true;
            this.l_Bonds.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.l_Bonds.Location = new System.Drawing.Point(13, 9);
            this.l_Bonds.Name = "l_Bonds";
            this.l_Bonds.Size = new System.Drawing.Size(93, 18);
            this.l_Bonds.TabIndex = 3;
            this.l_Bonds.Text = "Облигации";
            // 
            // l_Stocks
            // 
            this.l_Stocks.AutoSize = true;
            this.l_Stocks.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.l_Stocks.Location = new System.Drawing.Point(13, 334);
            this.l_Stocks.Name = "l_Stocks";
            this.l_Stocks.Size = new System.Drawing.Size(54, 18);
            this.l_Stocks.TabIndex = 4;
            this.l_Stocks.Text = "Акции";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(6, 644);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(147, 23);
            this.button1.TabIndex = 5;
            this.button1.Text = "Export to Excel";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.Export);
            // 
            // OFD
            // 
            this.OFD.Filter = "Файл Excel|*.XLSX;*.XLS";
            // 
            // tb_Log
            // 
            this.tb_Log.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.tb_Log.Location = new System.Drawing.Point(0, 753);
            this.tb_Log.Multiline = true;
            this.tb_Log.Name = "tb_Log";
            this.tb_Log.Size = new System.Drawing.Size(905, 66);
            this.tb_Log.TabIndex = 6;
            // 
            // l_Sheet
            // 
            this.l_Sheet.AutoSize = true;
            this.l_Sheet.Location = new System.Drawing.Point(3, 677);
            this.l_Sheet.Name = "l_Sheet";
            this.l_Sheet.Size = new System.Drawing.Size(0, 13);
            this.l_Sheet.TabIndex = 7;
            // 
            // F_AU_List
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(905, 819);
            this.ControlBox = false;
            this.Controls.Add(this.l_Sheet);
            this.Controls.Add(this.tb_Log);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.l_Stocks);
            this.Controls.Add(this.l_Bonds);
            this.Controls.Add(this.dgv_AU_Stocks);
            this.Controls.Add(this.dgv_AU_Bonds);
            this.Controls.Add(this.b_Cancel);
            this.Name = "F_AU_List";
            this.Text = "F_AU_List";
            this.Load += new System.EventHandler(this.F_AU_List_Load);
            this.Shown += new System.EventHandler(this.FillGrids);
            ((System.ComponentModel.ISupportInitialize)(this.dgv_AU_Bonds)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.aUListBondsBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.lC3_devDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_AU_Stocks)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.aUListStocksBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.lC3_devDataSet1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button b_Cancel;
        private System.Windows.Forms.DataGridView dgv_AU_Bonds;
        private LC3_devDataSet lC3_devDataSet;
        private System.Windows.Forms.BindingSource aUListBondsBindingSource;
        private LC3_devDataSetTableAdapters.AU_ListBondsTableAdapter aU_ListBondsTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn nameDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn ratingDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn typeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn ownRatingDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn ownCommentDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn remarkDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridView dgv_AU_Stocks;
        private LC3_devDataSet lC3_devDataSet1;
        private System.Windows.Forms.BindingSource aUListStocksBindingSource;
        private LC3_devDataSetTableAdapters.AU_ListStocksTableAdapter aU_ListStocksTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn nameDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn ratingDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn typeDataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn qsheetDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn inIndexDataGridViewTextBoxColumn;
        private System.Windows.Forms.Label l_Bonds;
        private System.Windows.Forms.Label l_Stocks;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.OpenFileDialog OFD;
        private System.Windows.Forms.TextBox tb_Log;
        private System.Windows.Forms.Label l_Sheet;
    }
}