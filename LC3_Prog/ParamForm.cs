using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using CheckComboBoxTest;
using System.Data;
using System.Data.SqlClient;

namespace LC3_Prog
{

    class chcmbItem
    {
        public string Text;
        public string Value;

        public chcmbItem(string aText, string aValue)
        {
            Text = aText; Value = aValue;
        }
    }

    class ParamForm
    {
        public int ParamId;
        Label lName = new Label();
        public ComboBox cbCondition = new ComboBox();
        public CheckedComboBox chcmbList = new CheckedComboBox();
        public TextBox tbValue = new TextBox();
        public CheckBox cbNull = new CheckBox();

        List<chcmbItem> ItemsList = new List<chcmbItem>();

        string  ListTableName   =   "";
        string FieldName = "";

        chcmbItem[] CondListSel = new chcmbItem[] {new chcmbItem("(не учитывать)", ""),
                                                    new chcmbItem("равно", "IN"),
                                                    new chcmbItem("не равно", "NOT IN")
                                                };


        chcmbItem[] CondListComp = new chcmbItem[] {new chcmbItem("(не учитывать)", ""),
                                                    new chcmbItem(">", ">"),
                                                    new chcmbItem("<", "<"),
                                                    new chcmbItem("=", "="),
                                                    new chcmbItem("<>", "<>")
                                                    };


        public ParamForm(Control aCnrtl, int aParamId, string aParamName, string aFieldName, string aTableName, int aX, int aY)
        {

            ListTableName = aTableName;
            FieldName = aFieldName;

            ParamId = aParamId;   
            lName.Name = "lParam_" + aParamId.ToString();
            lName.Location = new System.Drawing.Point(aX, aY);
            lName.Size = new System.Drawing.Size(200, 18);
            lName.MaximumSize = new System.Drawing.Size(200, 18);
            lName.AutoSize = true;
            lName.Text = aParamName;
            lName.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular);
            lName.ForeColor = System.Drawing.Color.FromArgb(0, 0, 64);
            aCnrtl.Controls.Add(lName);
            
            cbCondition.Name = "cbCondition_" + aParamId.ToString();
            cbCondition.Location = new System.Drawing.Point(aX + 200, aY);
            cbCondition.Size = new System.Drawing.Size(95, 20);

            if (ListTableName.Length > 0)
                foreach (chcmbItem vCond in CondListSel) cbCondition.Items.Add(vCond.Text);
            else
                foreach (chcmbItem vCond in CondListComp) cbCondition.Items.Add(vCond.Text);
            if (cbCondition.Items.Count > 0) cbCondition.Text = cbCondition.Items[0].ToString();
            aCnrtl.Controls.Add(cbCondition);

            chcmbList.Name = "chcmbList_" + aParamId.ToString();
            chcmbList.Location = new System.Drawing.Point(aX + 300, aY);
            chcmbList.Size = new System.Drawing.Size(270, 20);
            aCnrtl.Controls.Add(chcmbList);

            tbValue.Name = "tbValue_" + aParamId.ToString();
            tbValue.Location = new System.Drawing.Point(aX + 300, aY);
            tbValue.Size = new System.Drawing.Size(270, 20);
            
            aCnrtl.Controls.Add(tbValue);
            if (ListTableName.Length > 0)
            {
                tbValue.Visible = false;
                chcmbList.Visible = true;
            }
            else
            {
                tbValue.Visible = true;
                chcmbList.Visible = false;
            }

            cbNull.Name = "cbNull_" + aParamId.ToString();
            cbNull.Location = new System.Drawing.Point(aX + 580, aY);
            cbNull.Size = new System.Drawing.Size(120, 21);
            cbNull.Text = "Включая пустые";
            aCnrtl.Controls.Add(cbNull);
        
        }


        public void FillChCmb(SqlConnection aConn)
        {
            if ( (ListTableName.Length > 0) && (aConn.State == ConnectionState.Open) )
            {

                SqlCommand vSqlCommand = new SqlCommand(string.Format("exec CL_SelectParamList '{0}'", ListTableName), aConn);
                SqlDataReader vReader = vSqlCommand.ExecuteReader();
                chcmbList.Items.Clear();
                while (vReader.Read())
                {
                    chcmbList.Items.Add(vReader[2].ToString());
                    ItemsList.Add(new chcmbItem(vReader[2].ToString(), vReader[1].ToString()));
                }
                vReader.Close();
            }
        }


        public void FillValues(string aCond, string aValues, bool aIsNull)
        {
            cbNull.Checked = aIsNull;
            if (ListTableName.Length > 0)
            {
                foreach (chcmbItem vCond in CondListSel) if (vCond.Value == aCond) cbCondition.Text = vCond.Text;
                string[] vCheckedCond = aValues.Split(',');
                for (int i = 0; i < vCheckedCond.Length; i++) vCheckedCond[i] = vCheckedCond[i].Trim(' ', '\'');
                chcmbList.Items.Clear();
                string vCondText = "";
                foreach (chcmbItem vItem in ItemsList)
                {
                    bool vInArray = false;
                    foreach (string vCheckedStr in vCheckedCond) if (vCheckedStr == vItem.Value) vInArray = true;
                    chcmbList.Items.Add(vItem.Text, vInArray);
                    if (vInArray)
                    {
                        if (vCondText.Length > 0) vCondText += ", ";
                        vCondText += vItem.Text;
                    }
                }
                chcmbList.Text = vCondText;
            }
            else
            {
                foreach (chcmbItem vCond in CondListComp) if (vCond.Value == aCond) cbCondition.Text = vCond.Text;
                tbValue.Text = aValues;
            }
        }


        public void ReturnValues(out string aCond, out string aValues, out bool aIsNull)
        {
            aIsNull = cbNull.Checked;
            aCond = "";
            if (ListTableName.Length > 0)
            {
                foreach (chcmbItem vCond in CondListSel) if (vCond.Text == cbCondition.Text) aCond = vCond.Value;
                aValues = "";
                foreach (String vCheckedItem in chcmbList.CheckedItems)
                {
                    foreach (chcmbItem vCond in ItemsList) if (vCond.Text == vCheckedItem)
                        {
                            if (aValues.Length > 0) aValues += " ,";
                            aValues += "'" + vCond.Value + "'";
                        }
                }
            }
            else
            {
                foreach (chcmbItem vCond in CondListComp) if (vCond.Text == cbCondition.Text) aCond = vCond.Value;
                aValues = tbValue.Text;
            }

        }


        public void SetActive()
        {
            cbCondition.Enabled = true; chcmbList.Enabled = true; cbNull.Enabled = true; tbValue.Enabled = true;
        }

        public void SetUnActive()
        {
            cbCondition.Enabled = false; chcmbList.Enabled = false; cbNull.Enabled = false; tbValue.Enabled = false;
            cbCondition.Text = ""; chcmbList.Text = ""; cbNull.Checked = false; tbValue.Text = "";
        }



    }
}
