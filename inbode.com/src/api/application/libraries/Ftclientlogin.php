<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 

class Ftclientlogin {

  function __construct($token) {
    $this->token = $token;
  }
  
  function query($query) {
    
    $fusiontables_curl=curl_init();
    if(preg_match("/^select|^show tables|^describe/i", $query)) { 
   	  $query =  "sql=".urlencode($query);
      curl_setopt($fusiontables_curl,CURLOPT_URL,"http://www.google.com/fusiontables/api/query?".$query);
      curl_setopt($fusiontables_curl,CURLOPT_HTTPHEADER, array("Authorization: GoogleLogin auth=".$this->token));
    
    } else {
   	  $query = "sql=".urlencode($query);
      curl_setopt($fusiontables_curl,CURLOPT_POST, true);
      curl_setopt($fusiontables_curl,CURLOPT_URL,"http://www.google.com/fusiontables/api/query");
      curl_setopt($fusiontables_curl,CURLOPT_HTTPHEADER, array( 
        "Content-length: " . strlen($query), 
        "Content-type: application/x-www-form-urlencoded", 
        "Authorization: GoogleLogin auth=".$this->token         
      )); 
      curl_setopt($fusiontables_curl,CURLOPT_POSTFIELDS,$query); 
    }
    
    curl_setopt($fusiontables_curl,CURLOPT_CONNECTTIMEOUT,2);
    curl_setopt($fusiontables_curl,CURLOPT_RETURNTRANSFER,1);
    $result = curl_exec($fusiontables_curl);
    curl_close($fusiontables_curl);
    return $result;
  }


}