namespace LC3_Prog
{
    partial class F_Groups
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
            this.b_Cancel = new System.Windows.Forms.Button();
            this.b_ok = new System.Windows.Forms.Button();
            this.tb_name = new System.Windows.Forms.TextBox();
            this.l_name = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // b_Cancel
            // 
            this.b_Cancel.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.b_Cancel.FlatAppearance.BorderColor = System.Drawing.Color.Black;
            this.b_Cancel.FlatAppearance.BorderSize = 5;
            this.b_Cancel.Location = new System.Drawing.Point(208, 39);
            this.b_Cancel.Name = "b_Cancel";
            this.b_Cancel.Size = new System.Drawing.Size(62, 23);
            this.b_Cancel.TabIndex = 8;
            this.b_Cancel.Text = "Отмена";
            this.b_Cancel.UseVisualStyleBackColor = false;
            this.b_Cancel.Click += new System.EventHandler(this.b_Cancel_Click);
            // 
            // b_ok
            // 
            this.b_ok.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.b_ok.FlatAppearance.BorderColor = System.Drawing.Color.Black;
            this.b_ok.FlatAppearance.BorderSize = 5;
            this.b_ok.Location = new System.Drawing.Point(113, 39);
            this.b_ok.Name = "b_ok";
            this.b_ok.Size = new System.Drawing.Size(57, 23);
            this.b_ok.TabIndex = 7;
            this.b_ok.Text = "OK";
            this.b_ok.UseVisualStyleBackColor = false;
            this.b_ok.Click += new System.EventHandler(this.b_ok_Click);
            // 
            // tb_name
            // 
            this.tb_name.Location = new System.Drawing.Point(113, 12);
            this.tb_name.Name = "tb_name";
            this.tb_name.Size = new System.Drawing.Size(157, 20);
            this.tb_name.TabIndex = 6;
            // 
            // l_name
            // 
            this.l_name.AutoSize = true;
            this.l_name.Location = new System.Drawing.Point(11, 15);
            this.l_name.Name = "l_name";
            this.l_name.Size = new System.Drawing.Size(96, 13);
            this.l_name.TabIndex = 5;
            this.l_name.Text = "Название группы";
            // 
            // F_Groups
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 71);
            this.ControlBox = false;
            this.Controls.Add(this.b_Cancel);
            this.Controls.Add(this.b_ok);
            this.Controls.Add(this.tb_name);
            this.Controls.Add(this.l_name);
            this.Name = "F_Groups";
            this.Text = "Добавление группы";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button b_Cancel;
        private System.Windows.Forms.Button b_ok;
        private System.Windows.Forms.TextBox tb_name;
        private System.Windows.Forms.Label l_name;
    }
}