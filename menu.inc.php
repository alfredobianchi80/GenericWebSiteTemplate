<?php

// *****************************************
// *** PAGINE ABILITATE
// *****************************************
global $MENU_PAGINE;
$MENU_PAGINE=ARRAY();
$MENU_PAGINE['']['FileName']="home";
$MENU_PAGINE['HOME']['FileName']="home";
$MENU_PAGINE['CASSA']['FileName']="cassa";
$MENU_PAGINE['VINCITE']['FileName']="vincite";

?>


<?php

// *****************************************
// *** MENU APPLICAZIONE
// *****************************************
global $MENU_VOCI;
$MENU_VOCI=ARRAY();


$MENU_VOCI[0]['Livello']=1;
$MENU_VOCI[0]['Label']="Home";
$MENU_VOCI[0]['link']="./index.php";
$MENU_VOCI[0]['nomepage']="";
$MENU_VOCI[0]['UserRole']="";

$MENU_VOCI[1]['Livello']=1;
$MENU_VOCI[1]['Label']="Cassa";
$MENU_VOCI[1]['link']="./index.php?pagina=cassa";
$MENU_VOCI[1]['nomepage']="cassa";
$MENU_VOCI[1]['SubMenu'][0]=1001;
$MENU_VOCI[1]['UserRole']="";

    $MENU_VOCI[1001]['Livello']=2;
    $MENU_VOCI[1001]['Label']="Vincite";
    $MENU_VOCI[1001]['link']="./index.php?pagina=vincite";
    $MENU_VOCI[1001]['nomepage']="cassa";
    $MENU_VOCI[1001]['UserRole']="";

$MENU_VOCI[2]['Livello']=1;
$MENU_VOCI[2]['Label']="Giocate";
$MENU_VOCI[2]['link']="./index.php?pagina=giocate";
$MENU_VOCI[2]['nomepage']="giocate";
$MENU_VOCI[2]['SubMenu'][0]=2001;
$MENU_VOCI[2]['SubMenu'][1]=2002;
$MENU_VOCI[2]['SubMenu'][2]=2003;
$MENU_VOCI[2]['SubMenu'][3]=2004;
$MENU_VOCI[2]['SubMenu'][4]=2005;
$MENU_VOCI[2]['UserRole']="";

    $MENU_VOCI[2001]['Livello']=2;
    $MENU_VOCI[2001]['Label']="Estrazioni";
    $MENU_VOCI[2001]['link']="./index.php?pagina=estrazioni";
    $MENU_VOCI[2001]['nomepage']="giocate";
    $MENU_VOCI[2001]['UserRole']="";

    $MENU_VOCI[2002]['Livello']=2;
    $MENU_VOCI[2002]['Label']="Combinazioni";
    $MENU_VOCI[2002]['link']="./index.php?pagina=combinazioni";
    $MENU_VOCI[2002]['nomepage']="giocate";
    $MENU_VOCI[2002]['UserRole']="";

    $MENU_VOCI[2003]['Livello']=2;
    $MENU_VOCI[2003]['Label']="Prev. Giovate";
    $MENU_VOCI[2003]['link']="./index.php?pagina=giocatepreviste";
    $MENU_VOCI[2003]['nomepage']="giocate";
    $MENU_VOCI[2003]['UserRole']="";

    $MENU_VOCI[2004]['Livello']=2;
    $MENU_VOCI[2004]['Label']="Importa...";
    $MENU_VOCI[2004]['link']="./index.php?pagina=importaestrazioni";
    $MENU_VOCI[2004]['nomepage']="giocate";
    $MENU_VOCI[2004]['UserRole']="IMPORT_ESTRAZIONI";

    $MENU_VOCI[2005]['Livello']=2;
    $MENU_VOCI[2005]['Label']="Partecipanti";
    $MENU_VOCI[2005]['link']="./index.php?pagina=partecipanti";
    $MENU_VOCI[2005]['nomepage']="giocate";
    $MENU_VOCI[2005]['UserRole']="";

$MENU_VOCI[3]['Livello']=1;
$MENU_VOCI[3]['Label']="*Scadenze";
$MENU_VOCI[3]['link']="./index.php?pagina=scadenze";
$MENU_VOCI[3]['nomepage']="scadenze";
$MENU_VOCI[3]['SubMenu'][0]=3001;
$MENU_VOCI[3]['UserRole']="";

    $MENU_VOCI[3001]['Livello']=2;
    $MENU_VOCI[3001]['Label']="Genera Scadenze";
    $MENU_VOCI[3001]['link']="./index.php?pagina=scadenzegenera";
    $MENU_VOCI[3001]['nomepage']="scadenze";
    $MENU_VOCI[3001]['UserRole']="GENERA_SCADENZE";

$MENU_VOCI[4]['Livello']=1;
$MENU_VOCI[4]['Label']="Profilo";
$MENU_VOCI[4]['link']="./index.php?pagina=profilo";
$MENU_VOCI[4]['nomepage']="profilo";
$MENU_VOCI[4]['SubMenu'][0]=4001;
$MENU_VOCI[4]['UserRole']="";

    $MENU_VOCI[4001]['Livello']=2;
    $MENU_VOCI[4001]['Label']="Autorizzazioni";
    $MENU_VOCI[4001]['link']="./index.php?pagina=autorizzazioni";
    $MENU_VOCI[4001]['nomepage']="profilo";
    $MENU_VOCI[4001]['UserRole']="";

$MENU_VOCI[5]['Livello']=1;
$MENU_VOCI[5]['Label']="*Disconnetti";
$MENU_VOCI[5]['link']="./index.php?action=LOGOUT";
$MENU_VOCI[5]['nomepage']="EXIT";
$MENU_VOCI[5]['UserRole']="";

$MENU_VOCI[6]['Livello']=1;
$MENU_VOCI[6]['Label']="Logs";
$MENU_VOCI[6]['link']="./index.php?pagina=logs";
$MENU_VOCI[6]['nomepage']="logs";



?>