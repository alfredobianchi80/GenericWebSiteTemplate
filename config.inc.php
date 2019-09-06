<?php
/* **********************************************************
   **
   ** Configuration Files
   **
   ********************************************************** */


//** DB CONNECTION
    global $DB_CONFIG;
    $DB_CONFIG['USE_DB']=true;
    $DB_CONFIG['DB_TYPE']='MYSQL';
    $DB_CONFIG['DB_SERVER']='127.0.0.1';
    $DB_CONFIG['DB_NAME']='superenalotto';
    $DB_CONFIG['DB_USER']='superenalotto';
    $DB_CONFIG['DB_PWD']='superenalotto';

//** MENU CONFIGURATION
    global $MENU_CONFIG;
    $MENU_CONFIG['MENU_ON_DB']=false;
    $MENU_CONFIG['MENU_DB_Table']='';
    
    $MENU_CONFIG['MENU_FILE_NAME']='./menu.inc.php';
    $MENU_CONFIG['']='';


include_once "./language/it/labels_it.php";

?>