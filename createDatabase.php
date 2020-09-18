<?php
 $servername='localhost';
 $username='root';
 $password='';
 
 $connect=new mysqli($servername,$username,$password);
 
 if($connect->connect_error){
	 die('Connection error:'.$connect->connect_error);
 }
 
 $sql_query="CREATE DATABASE AmbulanceService";
 
 if($connect->query($sql_query)===True){
	 echo "Database created succesfully.";
 }
 else{
	 echo "Error creating database.";
 }
 $connect->close();
?>