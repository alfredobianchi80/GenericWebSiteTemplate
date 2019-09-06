<?php

include_once("./class/cls_HTMLItemList.php");

	class cls_PageWithTemplate
	{
		var $Variables;
		var $CSS;
		var $Scripts;
		var $PageName;
		var $BasePathTemplate;
		var $TemplateName;

		function __construct(){
			$this->PageName='';
			$this->TemplateName='';
			$this->BasePathTemplate='./template/';

			$this->Variables=new cls_ItemList();
			//$this->Variables->ItemAdd("","");

			$this->CSS = new cls_HTMLItemList();
			$this->CSS->ItemTemplate="  <link rel=\"stylesheet\" type=\"text/css\" href=\"{FileName}\">";

			$this->Scripts= new cls_HTMLItemList();
			$this->Scripts->ItemTemplate="  <script src=\"{FileName}\" charset=\"utf-8\"></script>";

			$this->LoadDefaultVariables();
		}

		function __destruct()
		{
			$this->PageName='';
			$this->TemplateName='';
			$this->BasePathTemplate='';

			$this->Variables=null;
			$this->CSS=null;
			$this->Scripts=null;
		}


		function LoadDefaultVariables(){
			$this->Variables->ItemAdd("{%HEADER%}","");
			$this->Variables->ItemAdd("{%BODY%}","");
			$this->Variables->ItemAdd("{%FOOTER%}","");
			$this->Variables->ItemAdd("{%ONLOAD%}","");
		}



		function ToHTML(){
			$str_Template= $this->Get_TemplatePage($this->TemplateName);
			
			$CSS_List=$this->CSS->ToHTML();
			$Script_List=$this->Scripts->ToHTML();

			// Replace EMBEDED/STD Variables
			$str_Template=str_replace("{%PAGE_NAME%}",$this->PageName,$str_Template);
			$str_Template=str_replace("{%ADDITIONAL_CSS%}",$CSS_List,$str_Template);
			$str_Template=str_replace("{%ADDITIONAL_SCRIPT%}",$Script_List,$str_Template);

			// Replace CUSTOM Variables			
			foreach ($this->Variables->ListOf() as $Key => $Value){
				$str_Template=str_replace($Key,$Value,$str_Template);
				
			}

			return $str_Template;
		}



		function Get_TemplatePage($NomeTemplate){
			$NomeFile=$this->BasePathTemplate;
			if (substr($NomeFile, -1)!='/'){$NomeFile.="/";}
						
			$NomeFile.= $NomeTemplate;

			if (file_exists($NomeFile)) {
				$testo = file_get_contents($NomeFile);
			} else {
				$testo="template {$NomeTemplate} non trovato.";
			}
			return $testo;
		}

	}

?>