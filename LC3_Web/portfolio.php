<?

include("./incl/header.php");

$_SESSION["client"] = (isset($_SESSION["client"]) ? ($_POST["client"] ? $_POST["client"] : $_SESSION["client"]) : 1);
$_SESSION["ordby"] = (isset($_SESSION["ordby"]) ? ($_POST["ordby"] ? $_POST["ordby"] : $_SESSION["ordby"]) : "Issuer");
$_SESSION["fl_hide"] = ($_POST["fl_hide"] == 1 ? "1" : "0");

$fields = array("ClientCode", "ClientAccount", "SummAsset", "Instrument", "Quantity", "MarketValue", "Percent", "Issuer", "InstrumentName", 
				"InstrumentType", "InstrumentSubtype", "SecTypeBr", "Country", "QuoteSheet", "OwnType", "BondsIssueSumm", "QuoteSDH", 
				"QuoteSDHAgo", "VolCirculation", "contrid", "Capitalization", "RedemptionDate", "SecurityId", "IssueNum", "AnnouncedVol", 
				"DateStartPlacing", "DateEndPlacing", "Currency", "CB_Code", "ID_CB_SDH", "StateRegNum", "MonthAvgVol", "F_Rating", 
				"M_Rating", "SP_Rating", "E_Rating", "A_Rating", "Contr_F_Rating", "Contr_M_Rating", "Contr_SP_Rating", "Contr_E_Rating", "Contr_A_Rating",
				"enddate", "IsInIndex", "IsVariableCoupon", "IsQuantityGrows", "DaysToRedemption", "is_bank", 
				"for_qual_investors", "NKR_Rating", "NRA_Rating", "Contr_NKR_Rating", "Contr_NRA_Rating", "IsSubordinated");

$fhide = array("ClientCode", "ClientAccount", "SummAsset", "contrid", "QuoteSDH", "QuoteSDHAgo", "ID_CB_SDH", "SecurityId", "Capitalization");
$fbold = array("Quantity", "MarketValue", "Percent");
$fg = array("Percent", "MarketValue", "BondsIssueSumm", "VolCirculation", "AnnouncedVol", "MonthAvgVol");
$fd = array("RedemptionDate", "DateStartPlacing", "DateEndPlacing");
$ffind = array("Instrument", "Issuer", "InstrumentName", "CB_Code",	"StateRegNum");

$ord_var = array("Issuer" => "Эмитенту", "InstrumentType, InstrumentSubtype" => "Типу и подтипу", "OwnType" => "Типу собственности");

$query = "SELECT ";
foreach ($fields as $k=>$v) $query .= ($v == "Percent" ? "[".$v."]" : $v).", ";
$query = substr($query, 0, -2);
$query .= " FROM FT_View WHERE ClientCode = ".$_SESSION["client"]." ORDER BY ".$_SESSION["ordby"];		// My_Model_FT, FT_NoRepo

$portf = array(); $i=0;
foreach($dbh->query($query) as $row) {
	$portf[$i++] = $row;
}

$smarty->assign("title", "LC3 Clients Portfolio");
$smarty->assign("fields", $fields);
$smarty->assign("fhide", $fhide);
$smarty->assign("fbold", $fbold);
$smarty->assign("ffind", $ffind);
$smarty->assign("fg", $fg);
$smarty->assign("fd", $fd);
$smarty->assign("ord_var", $ord_var);
$smarty->assign("portf", $portf);
$smarty->assign("flt_txt", $_POST["flt_txt"]);
$smarty->assign("sdh_c_lnk", "http://sdh/main?sysname=le_contragent_info&rid=");
$smarty->display("templates/portfolio.tpl");


?>