<?php


class cls_EasyList{
    protected $Lista;
    
    function ListOf(){
        return $this->Lista;
    }

    function __construct(){
        $this->Lista= Array();
    }

    protected function BaseItemAdd($Value, $Key=null){
        if ($Key){
            $UpperKey= trim(strtoupper($Key));
        }else{
            $UpperKey= trim(strtoupper($Value));
            
        }
        
        //TODO : Aggiungere verifica che Lista sia un array...

        $this->Lista[$UpperKey]=$Value;
    }

    function ItemRemove($Value){
        $UpperKey= trim(strtoupper($Value));
        //TODO : Aggiungere verifica che Lista sia un array...

        if (array_key_exists($UpperKey,$this->Lista)){
            unset($this->Lista[$UpperKey]);
        }
    }

    function ItemExist($Value){
        $UpperKey= trim(strtoupper($Value));
        //TODO : Aggiungere verifica che Lista sia un array...

        return array_key_exists($UpperKey,$this->Lista);
    }

    function ItemClear(){
        $this->Lista= Array();
    }

    //function ItemSet($Value, $Key=null){
    //    $this->ItemAdd($Value,$Key);
    //}

}

class cls_HTMLItemList extends cls_EasyList{
    var $ItemTemplate;

    function __construct(){
        parent::__construct();
        $this->ItemTemplate='';
    }
    
    function ItemAdd($Value){
        parent::BaseItemAdd($Value);
    }

    function ToHTML(){
        $str_Return='';
        foreach ($this->Lista as $FileKey => $FileName){
            $temp=$this->ItemTemplate;
            $temp=str_replace("{FileName}",$FileName,$temp);
            if (strlen($str_Return)>0){$str_Return.="\n";}
            $str_Return.=$temp;
        }
        return $str_Return;
    }
}


class cls_ItemList extends cls_EasyList{
    
    function __construct(){
        parent::__construct();
    }

    function ItemAdd($Key,$Value){
        parent::BaseItemAdd($Value,$Key);
    }

    function ItemRemove($Key){
        parent::ItemRemove($Key);
    }

    function ItemExist($Key){
        return parent::ItemExist($Key);
    }

    //function ItemSet($Key, $Value){
    //    $this->ItemAdd($Key,$Value);
    //}
    /*
    public function __set($Key, $value)
    {
      if (method_exists($this, ($method = 'set_'.$Key)))
      {
          $this->ItemAdd($Key,$value);
        //$this->$method($value);
      }
    }
    */
}



?>