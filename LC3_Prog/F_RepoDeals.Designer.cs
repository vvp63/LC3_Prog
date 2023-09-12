namespace LC3_Prog
{
    partial class F_RepoDeals
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
            this.dgv_RepoDeals = new System.Windows.Forms.DataGridView();
            this.rEPODealsBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.lC3_devDataSet = new LC3_Prog.LC3_devDataSet();
            this.rEPODealsTableAdapter = new LC3_Prog.LC3_devDataSetTableAdapters.REPODealsTableAdapter();
            this.b_Repo_close = new System.Windows.Forms.Button();
            this.кодКлиентаDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.инструментDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.наименованиеИнструментаDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.датаПервойЧастиСделкиDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.срокРепоDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.направлениеПервойЧастиDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.количествоDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ценаПервойЧастиDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ценаВторойЧастиDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_RepoDeals)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.rEPODealsBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.lC3_devDataSet)).BeginInit();
            this.SuspendLayout();
            // 
            // dgv_RepoDeals
            // 
            this.dgv_RepoDeals.AutoGenerateColumns = false;
            this.dgv_RepoDeals.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_RepoDeals.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.кодКлиентаDataGridViewTextBoxColumn,
            this.инструментDataGridViewTextBoxColumn,
            this.наименованиеИнструментаDataGridViewTextBoxColumn,
            this.датаПервойЧастиСделкиDataGridViewTextBoxColumn,
            this.срокРепоDataGridViewTextBoxColumn,
            this.направлениеПервойЧастиDataGridViewTextBoxColumn,
            this.количествоDataGridViewTextBoxColumn,
            this.ценаПервойЧастиDataGridViewTextBoxColumn,
            this.ценаВторойЧастиDataGridViewTextBoxColumn});
            this.dgv_RepoDeals.DataSource = this.rEPODealsBindingSource;
            this.dgv_RepoDeals.Location = new System.Drawing.Point(12, 12);
            this.dgv_RepoDeals.Name = "dgv_RepoDeals";
            this.dgv_RepoDeals.RowHeadersWidth = 5;
            this.dgv_RepoDeals.Size = new System.Drawing.Size(904, 584);
            this.dgv_RepoDeals.TabIndex = 0;
            // 
            // rEPODealsBindingSource
            // 
            this.rEPODealsBindingSource.DataMember = "REPODeals";
            this.rEPODealsBindingSource.DataSource = this.lC3_devDataSet;
            // 
            // lC3_devDataSet
            // 
            this.lC3_devDataSet.DataSetName = "LC3_devDataSet";
            this.lC3_devDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // rEPODealsTableAdapter
            // 
            this.rEPODealsTableAdapter.ClearBeforeFill = true;
            // 
            // b_Repo_close
            // 
            this.b_Repo_close.Location = new System.Drawing.Point(794, 602);
            this.b_Repo_close.Name = "b_Repo_close";
            this.b_Repo_close.Size = new System.Drawing.Size(122, 27);
            this.b_Repo_close.TabIndex = 1;
            this.b_Repo_close.Text = "Закрыть";
            this.b_Repo_close.UseVisualStyleBackColor = true;
            this.b_Repo_close.Click += new System.EventHandler(this.b_Repo_close_Click);
            // 
            // кодКлиентаDataGridViewTextBoxColumn
            // 
            this.кодКлиентаDataGridViewTextBoxColumn.DataPropertyName = "КодКлиента";
            this.кодКлиентаDataGridViewTextBoxColumn.HeaderText = "КодКлиента";
            this.кодКлиентаDataGridViewTextBoxColumn.MinimumWidth = 70;
            this.кодКлиентаDataGridViewTextBoxColumn.Name = "кодКлиентаDataGridViewTextBoxColumn";
            this.кодКлиентаDataGridViewTextBoxColumn.Width = 70;
            // 
            // инструментDataGridViewTextBoxColumn
            // 
            this.инструментDataGridViewTextBoxColumn.DataPropertyName = "Инструмент";
            this.инструментDataGridViewTextBoxColumn.HeaderText = "Инструмент";
            this.инструментDataGridViewTextBoxColumn.MinimumWidth = 120;
            this.инструментDataGridViewTextBoxColumn.Name = "инструментDataGridViewTextBoxColumn";
            this.инструментDataGridViewTextBoxColumn.Width = 120;
            // 
            // наименованиеИнструментаDataGridViewTextBoxColumn
            // 
            this.наименованиеИнструментаDataGridViewTextBoxColumn.DataPropertyName = "НаименованиеИнструмента";
            this.наименованиеИнструментаDataGridViewTextBoxColumn.HeaderText = "НаименованиеИнструмента";
            this.наименованиеИнструментаDataGridViewTextBoxColumn.MinimumWidth = 120;
            this.наименованиеИнструментаDataGridViewTextBoxColumn.Name = "наименованиеИнструментаDataGridViewTextBoxColumn";
            this.наименованиеИнструментаDataGridViewTextBoxColumn.Width = 120;
            // 
            // датаПервойЧастиСделкиDataGridViewTextBoxColumn
            // 
            this.датаПервойЧастиСделкиDataGridViewTextBoxColumn.DataPropertyName = "Дата первой части сделки";
            this.датаПервойЧастиСделкиDataGridViewTextBoxColumn.HeaderText = "Дата первой части сделки";
            this.датаПервойЧастиСделкиDataGridViewTextBoxColumn.Name = "датаПервойЧастиСделкиDataGridViewTextBoxColumn";
            // 
            // срокРепоDataGridViewTextBoxColumn
            // 
            this.срокРепоDataGridViewTextBoxColumn.DataPropertyName = "СрокРепо";
            this.срокРепоDataGridViewTextBoxColumn.HeaderText = "СрокРепо";
            this.срокРепоDataGridViewTextBoxColumn.MinimumWidth = 60;
            this.срокРепоDataGridViewTextBoxColumn.Name = "срокРепоDataGridViewTextBoxColumn";
            this.срокРепоDataGridViewTextBoxColumn.Width = 60;
            // 
            // направлениеПервойЧастиDataGridViewTextBoxColumn
            // 
            this.направлениеПервойЧастиDataGridViewTextBoxColumn.DataPropertyName = "Направление первой части";
            this.направлениеПервойЧастиDataGridViewTextBoxColumn.HeaderText = "Направление первой части";
            this.направлениеПервойЧастиDataGridViewTextBoxColumn.Name = "направлениеПервойЧастиDataGridViewTextBoxColumn";
            // 
            // количествоDataGridViewTextBoxColumn
            // 
            this.количествоDataGridViewTextBoxColumn.DataPropertyName = "Количество";
            this.количествоDataGridViewTextBoxColumn.HeaderText = "Количество";
            this.количествоDataGridViewTextBoxColumn.Name = "количествоDataGridViewTextBoxColumn";
            // 
            // ценаПервойЧастиDataGridViewTextBoxColumn
            // 
            this.ценаПервойЧастиDataGridViewTextBoxColumn.DataPropertyName = "Цена первой части";
            this.ценаПервойЧастиDataGridViewTextBoxColumn.HeaderText = "Цена первой части";
            this.ценаПервойЧастиDataGridViewTextBoxColumn.MinimumWidth = 80;
            this.ценаПервойЧастиDataGridViewTextBoxColumn.Name = "ценаПервойЧастиDataGridViewTextBoxColumn";
            this.ценаПервойЧастиDataGridViewTextBoxColumn.Width = 80;
            // 
            // ценаВторойЧастиDataGridViewTextBoxColumn
            // 
            this.ценаВторойЧастиDataGridViewTextBoxColumn.DataPropertyName = "Цена второй части";
            this.ценаВторойЧастиDataGridViewTextBoxColumn.HeaderText = "Цена второй части";
            this.ценаВторойЧастиDataGridViewTextBoxColumn.MinimumWidth = 80;
            this.ценаВторойЧастиDataGridViewTextBoxColumn.Name = "ценаВторойЧастиDataGridViewTextBoxColumn";
            this.ценаВторойЧастиDataGridViewTextBoxColumn.Width = 80;
            // 
            // F_RepoDeals
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(928, 641);
            this.ControlBox = false;
            this.Controls.Add(this.b_Repo_close);
            this.Controls.Add(this.dgv_RepoDeals);
            this.Name = "F_RepoDeals";
            this.Text = "Открытые сделки РЕПО";
            this.Load += new System.EventHandler(this.F_RepoDeals_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgv_RepoDeals)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.rEPODealsBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.lC3_devDataSet)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dgv_RepoDeals;
        private LC3_devDataSet lC3_devDataSet;
        private System.Windows.Forms.BindingSource rEPODealsBindingSource;
        private LC3_devDataSetTableAdapters.REPODealsTableAdapter rEPODealsTableAdapter;
        private System.Windows.Forms.Button b_Repo_close;
        private System.Windows.Forms.DataGridViewTextBoxColumn кодКлиентаDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn инструментDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn наименованиеИнструментаDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn датаПервойЧастиСделкиDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn срокРепоDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn направлениеПервойЧастиDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn количествоDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn ценаПервойЧастиDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn ценаВторойЧастиDataGridViewTextBoxColumn;
    }
}