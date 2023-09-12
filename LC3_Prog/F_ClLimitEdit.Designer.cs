namespace LC3_Prog
{
    partial class F_ClLimitEdit
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
            this.l_Client = new System.Windows.Forms.Label();
            this.l_Limit = new System.Windows.Forms.Label();
            this.cb_IsActive = new System.Windows.Forms.CheckBox();
            this.l_MaxValue = new System.Windows.Forms.Label();
            this.l_MinValue = new System.Windows.Forms.Label();
            this.tb_MinValue = new System.Windows.Forms.TextBox();
            this.tb_MaxValue = new System.Windows.Forms.TextBox();
            this.tb_LowerThreshold = new System.Windows.Forms.TextBox();
            this.tb_UpperThreshold = new System.Windows.Forms.TextBox();
            this.l_LowerThreshold = new System.Windows.Forms.Label();
            this.l_UpperThreshold = new System.Windows.Forms.Label();
            this.l_CurrClient = new System.Windows.Forms.Label();
            this.l_CurrLimit = new System.Windows.Forms.Label();
            this.b_Save = new System.Windows.Forms.Button();
            this.b_Cancel = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // l_Client
            // 
            this.l_Client.AutoSize = true;
            this.l_Client.Location = new System.Drawing.Point(4, 13);
            this.l_Client.Name = "l_Client";
            this.l_Client.Size = new System.Drawing.Size(43, 13);
            this.l_Client.TabIndex = 0;
            this.l_Client.Text = "Клиент";
            // 
            // l_Limit
            // 
            this.l_Limit.AutoSize = true;
            this.l_Limit.Location = new System.Drawing.Point(4, 39);
            this.l_Limit.Name = "l_Limit";
            this.l_Limit.Size = new System.Drawing.Size(40, 13);
            this.l_Limit.TabIndex = 1;
            this.l_Limit.Text = "Лимит";
            // 
            // cb_IsActive
            // 
            this.cb_IsActive.AutoSize = true;
            this.cb_IsActive.Location = new System.Drawing.Point(7, 67);
            this.cb_IsActive.Name = "cb_IsActive";
            this.cb_IsActive.Size = new System.Drawing.Size(127, 17);
            this.cb_IsActive.TabIndex = 2;
            this.cb_IsActive.Text = "Лимит активирован";
            this.cb_IsActive.UseVisualStyleBackColor = true;
            // 
            // l_MaxValue
            // 
            this.l_MaxValue.AutoSize = true;
            this.l_MaxValue.Location = new System.Drawing.Point(322, 101);
            this.l_MaxValue.Name = "l_MaxValue";
            this.l_MaxValue.Size = new System.Drawing.Size(54, 13);
            this.l_MaxValue.TabIndex = 4;
            this.l_MaxValue.Text = "MaxValue";
            // 
            // l_MinValue
            // 
            this.l_MinValue.AutoSize = true;
            this.l_MinValue.Location = new System.Drawing.Point(12, 101);
            this.l_MinValue.Name = "l_MinValue";
            this.l_MinValue.Size = new System.Drawing.Size(51, 13);
            this.l_MinValue.TabIndex = 3;
            this.l_MinValue.Text = "MinValue";
            // 
            // tb_MinValue
            // 
            this.tb_MinValue.Location = new System.Drawing.Point(7, 119);
            this.tb_MinValue.Name = "tb_MinValue";
            this.tb_MinValue.Size = new System.Drawing.Size(100, 20);
            this.tb_MinValue.TabIndex = 5;
            // 
            // tb_MaxValue
            // 
            this.tb_MaxValue.Location = new System.Drawing.Point(325, 119);
            this.tb_MaxValue.Name = "tb_MaxValue";
            this.tb_MaxValue.Size = new System.Drawing.Size(100, 20);
            this.tb_MaxValue.TabIndex = 6;
            // 
            // tb_LowerThreshold
            // 
            this.tb_LowerThreshold.Location = new System.Drawing.Point(113, 119);
            this.tb_LowerThreshold.Name = "tb_LowerThreshold";
            this.tb_LowerThreshold.Size = new System.Drawing.Size(100, 20);
            this.tb_LowerThreshold.TabIndex = 10;
            // 
            // tb_UpperThreshold
            // 
            this.tb_UpperThreshold.Location = new System.Drawing.Point(219, 119);
            this.tb_UpperThreshold.Name = "tb_UpperThreshold";
            this.tb_UpperThreshold.Size = new System.Drawing.Size(100, 20);
            this.tb_UpperThreshold.TabIndex = 9;
            // 
            // l_LowerThreshold
            // 
            this.l_LowerThreshold.AutoSize = true;
            this.l_LowerThreshold.Location = new System.Drawing.Point(110, 101);
            this.l_LowerThreshold.Name = "l_LowerThreshold";
            this.l_LowerThreshold.Size = new System.Drawing.Size(83, 13);
            this.l_LowerThreshold.TabIndex = 8;
            this.l_LowerThreshold.Text = "LowerThreshold";
            // 
            // l_UpperThreshold
            // 
            this.l_UpperThreshold.AutoSize = true;
            this.l_UpperThreshold.Location = new System.Drawing.Point(216, 103);
            this.l_UpperThreshold.Name = "l_UpperThreshold";
            this.l_UpperThreshold.Size = new System.Drawing.Size(83, 13);
            this.l_UpperThreshold.TabIndex = 7;
            this.l_UpperThreshold.Text = "UpperThreshold";
            // 
            // l_CurrClient
            // 
            this.l_CurrClient.AutoSize = true;
            this.l_CurrClient.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.l_CurrClient.Location = new System.Drawing.Point(71, 13);
            this.l_CurrClient.Name = "l_CurrClient";
            this.l_CurrClient.Size = new System.Drawing.Size(148, 13);
            this.l_CurrClient.TabIndex = 11;
            this.l_CurrClient.Text = "Наименование Клиента";
            // 
            // l_CurrLimit
            // 
            this.l_CurrLimit.AutoSize = true;
            this.l_CurrLimit.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.l_CurrLimit.Location = new System.Drawing.Point(71, 39);
            this.l_CurrLimit.Name = "l_CurrLimit";
            this.l_CurrLimit.Size = new System.Drawing.Size(144, 13);
            this.l_CurrLimit.TabIndex = 12;
            this.l_CurrLimit.Text = "Наименование Лимита";
            // 
            // b_Save
            // 
            this.b_Save.Location = new System.Drawing.Point(7, 162);
            this.b_Save.Name = "b_Save";
            this.b_Save.Size = new System.Drawing.Size(75, 23);
            this.b_Save.TabIndex = 13;
            this.b_Save.Text = "Save";
            this.b_Save.UseVisualStyleBackColor = true;
            this.b_Save.Click += new System.EventHandler(this.bt_Save_Click);
            // 
            // b_Cancel
            // 
            this.b_Cancel.Location = new System.Drawing.Point(350, 162);
            this.b_Cancel.Name = "b_Cancel";
            this.b_Cancel.Size = new System.Drawing.Size(75, 23);
            this.b_Cancel.TabIndex = 14;
            this.b_Cancel.Text = "Cancel";
            this.b_Cancel.UseVisualStyleBackColor = true;
            this.b_Cancel.Click += new System.EventHandler(this.b_Cancel_Click);
            // 
            // F_ClLimitEdit
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(490, 211);
            this.ControlBox = false;
            this.Controls.Add(this.b_Cancel);
            this.Controls.Add(this.b_Save);
            this.Controls.Add(this.l_CurrLimit);
            this.Controls.Add(this.l_CurrClient);
            this.Controls.Add(this.tb_LowerThreshold);
            this.Controls.Add(this.tb_UpperThreshold);
            this.Controls.Add(this.l_LowerThreshold);
            this.Controls.Add(this.l_UpperThreshold);
            this.Controls.Add(this.tb_MaxValue);
            this.Controls.Add(this.tb_MinValue);
            this.Controls.Add(this.l_MaxValue);
            this.Controls.Add(this.l_MinValue);
            this.Controls.Add(this.cb_IsActive);
            this.Controls.Add(this.l_Limit);
            this.Controls.Add(this.l_Client);
            this.Name = "F_ClLimitEdit";
            this.Text = "Редактирование ограничений";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label l_Client;
        private System.Windows.Forms.Label l_Limit;
        private System.Windows.Forms.CheckBox cb_IsActive;
        private System.Windows.Forms.Label l_MaxValue;
        private System.Windows.Forms.Label l_MinValue;
        private System.Windows.Forms.TextBox tb_MinValue;
        private System.Windows.Forms.TextBox tb_MaxValue;
        private System.Windows.Forms.TextBox tb_LowerThreshold;
        private System.Windows.Forms.TextBox tb_UpperThreshold;
        private System.Windows.Forms.Label l_LowerThreshold;
        private System.Windows.Forms.Label l_UpperThreshold;
        private System.Windows.Forms.Label l_CurrClient;
        private System.Windows.Forms.Label l_CurrLimit;
        private System.Windows.Forms.Button b_Save;
        private System.Windows.Forms.Button b_Cancel;
    }
}