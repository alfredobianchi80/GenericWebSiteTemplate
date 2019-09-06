<?php
error_reporting(E_ERROR | E_WARNING | E_PARSE);

include_once("./config.inc.php");
include_once("./menu.inc.php");
include_once("./function/function_base.php");
include_once("./class/cls_Database.php");
include_once("./class/cls_PageWithTemplate.php");
include_once("./class/cls_Tabella.php");

ob_start();


$_PAGE_BODY = '';
$Pagina = new cls_PageWithTemplate();
$Pagina->PageName="Home Page";
$Pagina->TemplateName="base.tmpl";



$GET_pagina=$_GET['pagina'];
if(empty($GET_pagina)){$GET_pagina='homepage';}

if ($DB_CONFIG['USE_DB']==true){
    $DB_Connection_Information = new cls_DataBase_ConnectionData();
    $DB_Connection_Information->DB_Type = $DB_CONFIG['DB_TYPE'];
    $DB_Connection_Information->DB_Address = $DB_CONFIG['DB_SERVER'];
    $DB_Connection_Information->DB_Name = $DB_CONFIG['DB_NAME'];
    $DB_Connection_Information->DB_User = $DB_CONFIG['DB_USER'];
    $DB_Connection_Information->DB_Pwd = $DB_CONFIG['DB_PWD'];

    $DB= new cls_DataBase;
    $DB->Setta_InfoConnessione($DB_Connection_Information);
    if (!$DB->Connetti()){
        echo _DB_CONNECTION_ERROR ."<br><br>" .  $DB->Last_Error;
    }else{
        echo "<!-- DBCONN:OK -->\n";
    }

}
echo "<!-- Pagina:" .$GET_pagina ."-->\n";

$Pagina->CSS->ItemAdd("./css/base.css?id=3");
$Pagina->CSS->ItemAdd("./css/menu.css?id=2");

$Pagina->Scripts->ItemAdd("./js/menu.js");

/*
$Pagina->LoadDefaultVariables();
$Pagina->Variables->ItemAdd("{%HEADER%}","");
$Pagina->Variables->ItemAdd("{%BODY%}","");
$Pagina->Variables->ItemAdd("{%FOOTER%}","");
$Pagina->Variables->ItemAdd("{%ONLOAD%}","");
*/
$Pagina->Variables->ItemAdd("{%HEADER_CAPTION%}","");
$Pagina->Variables->ItemAdd("{%HEADER_MENU%}","");




$_PAGE_BODY_ERROR=ob_get_contents();
ob_end_clean();


//Recupera Footer
$Foot="Versione 0.1";
$Pagina->Variables->ItemAdd("{%FOOTER%}",$Foot);

//Recupera HEADER
include_once("./class/cls_Menu.php");
$HEADER_MENU=Get_Menu("Me","001",$GET_pagina);
$Pagina->Variables->ItemAdd("{%HEADER_MENU%}",$HEADER_MENU);
$Pagina->Variables->ItemAdd("{%HEADER%}",$HEADER_MENU);



//Recupera CORPO PAGINA
ob_start();

// Gestione Pagina da caricare...(TODO)
$Pagina_FullPath="./pages/$GET_pagina.php";

if (file_exists($Pagina_FullPath)){
    include($Pagina_FullPath);
}else{
    PageNotFound($GET_pagina,"",404);
}




$_PAGE_BODY=ob_get_contents();
ob_end_clean();
$Pagina->Variables->ItemAdd("{%BODY%}",$_PAGE_BODY_ERROR . $_PAGE_BODY);




//Scrivi Output
echo $Pagina->ToHTML();

//Disconnetti da database
if ($DB_CONFIG['USE_DB']==true){
    $DB->Disconnetti();
}
?>




<?php




?>