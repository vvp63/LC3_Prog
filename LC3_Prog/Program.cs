using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace LC3_Prog
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main(string[] args)
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Form_Main gForm = new Form_Main(args);
            Application.Run(gForm);
        }
    }
}
