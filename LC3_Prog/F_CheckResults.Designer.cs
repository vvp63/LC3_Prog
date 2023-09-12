namespace LC3_Prog
{
    partial class F_CheckResults
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
            this.pResults = new System.Windows.Forms.Panel();
            this.SuspendLayout();
            // 
            // pResults
            // 
            this.pResults.AutoScroll = true;
            this.pResults.BackColor = System.Drawing.Color.Silver;
            this.pResults.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pResults.Location = new System.Drawing.Point(0, 0);
            this.pResults.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.pResults.Name = "pResults";
            this.pResults.Size = new System.Drawing.Size(1627, 1048);
            this.pResults.TabIndex = 0;
            // 
            // F_CheckResults
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ClientSize = new System.Drawing.Size(1627, 1048);
            this.Controls.Add(this.pResults);
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.MinimumSize = new System.Drawing.Size(1500, 1000);
            this.Name = "F_CheckResults";
            this.Text = "Результаты проверки";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.ClosingForm);
            this.Load += new System.EventHandler(this.F_CheckResults_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel pResults;
    }
}