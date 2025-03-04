<?

include("./incl/header.php");

$ia_4 = is_admin(4);

$modelft = '##ModelFt_'.$_SESSION["admin"]["id"];

$ptype_lst = array("FT_View" => "Полный", "FT_NoRepo" => "Без РЕПО", $modelft => "Модельный");

$_SESSION["clientid"] = (isset($_POST["client"]) ? $_POST["client"] : ($_SESSION["clientid"] ? $_SESSION["clientid"] : 1));
$_SESSION["ptype"] = ($_POST["ptype"] ? $_POST["ptype"] : ($_SESSION["ptype"] ? $_SESSION["ptype"] : "FT_View"));
$_SESSION["ordby"] = ($_POST["ordby"] ? $_POST["ordby"] : ($_SESSION["ordby"] ? $_SESSION["ordby"] : "Issuer") ); 
$_SESSION["fl_hide"] = ($_POST["fl_hide"] == 1 ? "1" : "0");

if ($_SESSION["ptype"] == $modelft) $dbh->query("exec [WebModel_PrepareFT] @uid = ".$_SESSION["admin"]["id"]);

$fields = array("ClientCode", "ClientAccount", "SummAsset", "Instrument", "Quantity", "MarketValue", "Percent", "Issuer", "InstrumentName", 
				"InstrumentType", "InstrumentSubtype", "SecTypeBr", "Country", "QuoteSheet", "OwnType", "BondsIssueSumm", "QuoteSDH", 
				"QuoteSDHAgo", "VolCirculation", "contrid", "Capitalization", "RedemptionDate", "SecurityId", "IssueNum", "AnnouncedVol", 
				"DateStartPlacing", "DateEndPlacing", "Currency", "CB_Code", "ID_CB_SDH", "StateRegNum", "MonthAvgVol", "F_Rating", 
				"M_Rating", "SP_Rating", "E_Rating", "A_Rating", "Contr_F_Rating", "Contr_M_Rating", "Contr_SP_Rating", "Contr_E_Rating", "Contr_A_Rating",
				"enddate", "IsInIndex", "IsVariableCoupon", "IsQuantityGrows", "DaysToRedemption", "is_bank", 
				"for_qual_investors", "NKR_Rating", "NRA_Rating", "Contr_NKR_Rating", "Contr_NRA_Rating", "IsSubordinated");

$fhide = array("contrid", "QuoteSDH", "QuoteSDHAgo", "ID_CB_SDH", "SecurityId", "Capitalization"); // "ClientCode", "ClientAccount", "SummAsset", 
if ($_SESSION["clientid"] > 0) array_push($fhide, "ClientCode", "ClientAccount", "SummAsset");
$fbold = array("Quantity", "MarketValue", "Percent");
$fg = array("Percent");
$fu = array("SummAsset", "MarketValue", "BondsIssueSumm", "VolCirculation", "AnnouncedVol", "MonthAvgVol");
$fd = array("RedemptionDate", "DateStartPlacing", "DateEndPlacing");
$ffind = array("Instrument", "Issuer", "InstrumentName", "CB_Code",	"StateRegNum");

$ord_var = array("Issuer" => "Эмитенту", "InstrumentType, InstrumentSubtype" => "Типу и подтипу", "OwnType" => "Типу собственности");

$query = "SELECT ";
foreach ($fields as $k=>$v) $query .= ($v == "Percent" ? "[".$v."]" : $v).", ";
$query = substr($query, 0, -2)." FROM ".$_SESSION["ptype"];
$query .= ( ($_SESSION["clientid"] > 0) ? " WHERE ClientCode = ".$_SESSION["clientid"] : "")." ORDER BY ".(($_SESSION["clientid"] == 0) ? "ClientCode, ": "").$_SESSION["ordby"];		// My_Model_FT, FT_NoRepo

$portf = array(); $i=0;
foreach($dbh->query($query) as $row) { $portf[$i++] = $row; }

$smarty->assign("title", "LC3 Clients Portfolio");
$smarty->assign("ia_4", $ia_4);
$smarty->assign("fields", $fields);
$smarty->assign("fhide", $fhide);
$smarty->assign("fbold", $fbold);
$smarty->assign("ffind", $ffind);
$smarty->assign("fg", $fg);
$smarty->assign("fu", $fu);
$smarty->assign("fd", $fd);
$smarty->assign("ord_var", $ord_var);
$smarty->assign("portf", $portf);
$smarty->assign("ptype_lst", $ptype_lst);
$smarty->assign("flt_txt", $_POST["flt_txt"]);
$smarty->assign("sdh_c_lnk", "http://sdh/main?sysname=le_contragent_info&rid=");
$smarty->display("templates/portfolio.tpl");


?>