<?php


class cls_DataBase{

    private $DB_Data;
    private $DB_Connection;
    private $Last_Query;
    var $Last_Result;
    var $Last_Error;
    private $Established_Connection;
    private $Executed_Query;
    private $Use_Transaction;

    function __construct(){
        
        $this->Last_Error = '';
        $this->Last_Result = '';
        $this->Last_Query = '';
        $this->Established_Connection = false;
        $this->Executed_Query = false;

        $this->Use_Transaction=false;
        
        $this->DB_Data = new cls_DataBase_ConnectionData();

    }

    function __destruct()
    {
        
    }

    function Setta_InfoConnessione($Info){
        $this->DB_Data=$Info;
    }

    function Setta_Transaction($Abilita){
        $this->Use_Transaction=($Abilita==true);
        
        $this->DB_Connection->autocommit($this->Use_Transaction==true);
        
    }

    function Commit(){
        if($this->Use_Transaction==true){
            if (!$this->DB_Connection->commit()) {
                $this->Last_Error = 'Transaction commit failed';
                return false;
            }else{
                return true;
            }
        }else{
            return false;
        }
    }


    function Connetti(){
        $this->DB_Connection = @new mysqli($this->DB_Data->DB_Address, 
                                    $this->DB_Data->DB_User, 
                                    $this->DB_Data->DB_Pwd, 
                                    $this->DB_Data->DB_Name); 
        if ($this->DB_Connection->connect_error) {
            $this->Last_Error="Connection failed: " . $this->DB_Connection->connect_error;
            //die("Connection failed: " . $this->DB_Connection->connect_error);
            return false;
        } else{
            $this->Last_Error = '';
            $this->Last_Result = '';
            $this->Last_Query = '';
            $this->Established_Connection = true;
            $this->Executed_Query = false;
            return true;
        }
    }

    function Disconnetti(){
        @$this->DB_Connection->close();
    }

    function EseguiQuery($Query){
        $this->Last_Result = '';
        $this->Last_Query=$Query;
        if ($result = $this->DB_Connection->query($Query)){
            //Query Eseguita OK
            
            //$this->Last_Result = $result->fetch_array(MYSQLI_BOTH);
            //$this->Last_Result = $result->fetch_array(MYSQLI_ASSOC);
            $this->Last_Result = $result; //->fetch_array(MYSQLI_ASSOC);
            return true;
        }else{
            //Query in errore
            $this->Last_Error = $this->DB_Connection->error;
            return false;
        }
    }

    function Transaction_Begin(){
        if ($this->Use_Transaction==true){
            $this->DB_Connection->begin_transaction(MYSQLI_TRANS_START_READ_WRITE);
        }
    }

    function Transaction_RollBack(){
        if ($this->Use_Transaction==true){
            $this->DB_Connection->rollback();
        }
    }
}





class cls_DataBase_ConnectionData{
    var $DB_Type;
    var $DB_Address;
    var $DB_Name;
    var $DB_User;
    var $DB_Pwd;

    function __construct()
    {
        $this->DB_Type = 'MYSQL';
        $this->DB_Address = '';
        $this->DB_Name = '';
        $this->DB_User = '';
        $this->DB_Pwd = '';
    }

    function __construct2($TipoDB, $Address, $DBName, $Uname, $Upwd)
    {
        $this->DB_Type = $TipoDB;
        $this->DB_Address = $Address;
        $this->DB_Name = $DBName;
        $this->DB_User = $Uname;
        $this->DB_Pwd = $Upwd;
    }

    function __destruct()
    {
        
    }
}

?>