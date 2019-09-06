<?php


class cls_Tabella{

    var $Righe;
    var $Colonne;
    var $CSS_ClasseTabella;

    function __construct()
    {
        $Righe = Array(); //new cls_Tabella_Row();
        $Colonne = Array();
    }

    function __destruct()
    {
        
    }

    function Add_by_QueryResult($Result,$NomiCampi){
        $riga= new cls_Tabella_Row;
        $riga->Add_by_QueryResult($Result,$NomiCampi);
        $this->Righe[]=$riga;
    }

    function to_HTML(){
        $txt="<table class=\"" . $this->CSS_ClasseTabella ."\">\n";
        //$txt.="<>\n";

        //Riporta Intestazione Tabella
        $txt.="\t<thead>\n";
        $txt.="\t\t<tr>\n";
        foreach($this->Colonne as $Valore){
            //var_dump($Valore);
            $label=$Valore['label'];
            $stile=$Valore['style'];
            
            //if (strlen($stile)==0){
                $txt.="\t\t\t<td>" . $label ."</td>\n";
            //}else{
            //    $txt.="\t\t\t<td style='$stile'>" . $label ."</td>\n";
            //}
        }
        $txt.="\t\t</tr>\n";
        $txt.="\t</thead>\n";

        //Riporta Righe
        $txt.="\t<tbody>\n";
        foreach($this->Righe as $valore){
            //$txt.=$valore->to_HTML();

            $txt.="\t\t<tr>\n";
            foreach($valore->Campi as $valore_X){
                $txt.="\t\t\t<td>" .$valore_X ."</td>\n";
            }
            $txt.="\t\t</tr>\n";
        }
        $txt.="\t</tbody>\n";

        //Termina Tabella
        $txt.="</table>\n";
        return $txt;
    }

    function Add_Column($NomeColonna,$Etichetta,$Stile,$FormatoValore){
        $this->Colonne[$NomeColonna]['label'] = $Etichetta;
        $this->Colonne[$NomeColonna]['style'] = $Stile;
        $this->Colonne[$NomeColonna]['Formato'] = $FormatoValore;
    }

  
}


class cls_Tabella_Row{
    var $Campi;

    function __construct()
    {
        $this->Campi = Array();
    }

    function Add_by_QueryResult($Result,$NomiCampi){
        
        //$NomiCampi = str_replace(";",",",$NomiCampi);
        $ListaCampi = explode(';',$NomiCampi);
        $this->Campi = Array();
        foreach($ListaCampi as $Key){
            
            $this->Campi[$Key] = $Result[$Key];
            //(TODO): Gestire esistenza KEY....
        }
    }

    function Add_ColumnValue($NomeColonna,$Valore){
        $this->Campi[$NomeColonna] = $Valore;
    }

}

?>