<?php

$Pagina->CSS->ItemAdd("./css/tabella.css?id=4");
$Tabella = new cls_Tabella;

$Tabella->CSS_ClasseTabella="Table_Result";

$Tabella->Add_Column("group_ID;","Gruppo","","TEXT");
$Tabella->Add_Column("comb_ID","Nr Comb.","","TEXT");
$Tabella->Add_Column("gioc_ID","ID","","TEXT");
$Tabella->Add_Column("gioc_data","Data","","DATE");
$Tabella->Add_Column("gioc_Esito","Esito","","TEXT");
$Tabella->Add_Column("gioc_spesa","Spesa","","NUMERIC");
$Tabella->Add_Column("gioc_note","Note","","TEXT");
$Tabella->Add_Column("gioc_DataGiocata","Data Giocata","","DATE");
$Tabella->Add_Column("gioc_Elaborata","Elaborata","","TEXT");
$Tabella->Add_Column("gioc_Archiviata","Archiviata","","TEXT");

$Query = 'SELECT * FROM combinazioni_giocate ';
$Query.=' ORDER BY gioc_ID DESC';
$Query.=' LIMIT 10';

if (!$DB->EseguiQuery($Query)){
    echo 'Errore Query:' . $DB->Last_Error ."<br>";
}else{
    $result= $DB->Last_Result;
    //if(!$result==false){
        $Num_Riga=0;
        while($row = $result->fetch_assoc()) {

            $Tabella->Add_by_QueryResult($row,'group_ID;comb_ID;gioc_ID;gioc_data;gioc_Esito;gioc_spesa;gioc_note;gioc_DataGiocata;gioc_Elaborata;gioc_Archiviata');

        }
    //}
}

echo $Tabella->to_HTML();



?>