<?php

class cls_Menu{

    var $ListaVoci;

    function __construct()
    {
        $this->ListaVoci=new cls_MunuItem;


    }

    function ItemAdd($Key, $Etichetta, $Link, $NomePagina, $UserRole, $SubMenu){
        //TODO
        $item = new cls_MenuItem;
        $item->key = $Key;
        $item->Etichetta = $Etichetta;
        $item->ActionLink = $Link;
        $item->NomePagina = $NomePagina;
        $item->RuoloUtente = $UserRole;
        $item->SubItems = $SubMenu;

        $this->ListaVoci[$Key]=$item;

    }

    function Item_Add_SubMenuItem($Key, $KeySubMenu){
      //TODO
    }


    function toHTML(){
        $str_HTML='';



        return $str_HTML;
    }

}

class cls_MenuItem{
    var $Key;
    var $Etichetta;
    var $ActionLink;
    var $NomePagina;
    var $RuoloUtente;
    var $SubItems;

    function __construct(){
        
    }



}


function Pippo_Menu(){

  $menu=new cls_Menu;
  
  // ItemAdd($Key, $Etichetta, $Link, $NomePagina, $UserRole, $SubMenu)
  $menu->ItemAdd('0','Home', './index.php', '', '', '');
  $menu->ItemAdd('1','Cassa', './index.php?pagina=cassa', 'cassa', '', array('1001'));
  $menu->ItemAdd('2','Giocate', './index.php?pagina=giocate', 'giocate', '', array('2001','2002','2003','2004','2005'));
  $menu->ItemAdd('3','*Scadenze', './index.php?pagina=scadenze', 'scadenze', '', array('3001'));
  $menu->ItemAdd('4','Profilo', './index.php?pagina=profilo', 'profilo', '', array('4001'));
  $menu->ItemAdd('5','*Disconnetti', './index.php?action=LOGOUT', 'EXIT', '', '');
  $menu->ItemAdd('6','Logs', './index.php?pagina=logs', 'logs', 'ADMIN', '');

  $menu->ItemAdd('1001','Vincite', './index.php?pagina=vincite', '', '', '');

/*
$MENU_VOCI[0]['Livello']=1;
$MENU_VOCI[0]['Label']="Home";
$MENU_VOCI[0]['link']="./index.php";
$MENU_VOCI[0]['nomepage']="";
$MENU_VOCI[0]['UserRole']="";
*/

}


function Get_Menu($LoggedUser,$LoggedGroupID,$ActivePage){
  global $MENU_VOCI;
  
  $Testo1='';

  $Testo2 =  "\t<div class=\"header_menu\">\n";
  $Testo2 .= "\t\t<label for=\"show-menu\" class=\"show-menu\">Show Menu</label>\n";
  $Testo2 .= "\t\t<input type=\"checkbox\" id=\"show-menu\" role=\"button\">\n";
  $Testo2 .= "\t\t<ul class=\"menu_button\">\n";

        
  $Testo3="";
  foreach ($MENU_VOCI as $key => $value){
    if($value['Livello']==1){
      //Riporta Eventuale Livello 2
        $SubMenu="";
        if (isset($value['SubMenu'])){
          foreach ($value['SubMenu'] as $key2 => $value2){
            $bool_attivo=false;
            if($MENU_VOCI[$value2]['UserRole']!=""){
              if(HaRuolo($LoggedUser,$LoggedGroupID,-1, $MENU_VOCI[$value2]['UserRole'])){
                $bool_attivo=true;
              }
            }else {
              $bool_attivo=true;
            }
            if ($bool_attivo==true){
              $SubMenu.="\t\t\t\t\t<li>".'<a href="' .$MENU_VOCI[$value2]['link'] .'">' . $MENU_VOCI[$value2]['Label'] .'</a></li>'."\n";
            }
          }
        }
      //Riporta Livello 1
        $Label=$value['Label'];
        if($SubMenu!=""){
          $Label.=" ￬";
        }
        if($ActivePage==$value['nomepage']){
            $Testo3.="\t\t\t".'<li class="Active"><a href="' .$value['link'] .'">' . $Label .'</a>'."\n";
        }else {
            $Testo3.="\t\t\t".'<li ><a href="' .$value['link'] .'">' . $Label .'</a>'."\n";
        }
        if($SubMenu!=""){
          $Testo3.="\t\t\t\t".'<ul class="hidden">' ."\n";
          $Testo3.="".$SubMenu;
          $Testo3.="\t\t\t\t"."</ul>\n";
        }
  
  
      //Chiudi Menu
        $Testo3.="\t\t\t"."</li>\n";
    }
  }
      
      $Testo4 = "\t\t</ul>\n";
      $Testo4 .=  "\t</div>\n";

      return $Testo1 . $Testo2 .$Testo3 .$Testo4;
        
      }


function HaRuolo($User_ID,$Group_ID, $Ruolo){
  return true;
}

?>