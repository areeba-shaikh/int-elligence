<?php
 $servername='localhost';
 $username='root';
 $password='';
 $database='ambulanceservice';
 
 $connect=new mysqli($servername,$username,$password,$database);
 
 if($connect->connect_error){
	 die('Connection error:'.$connect->connect_error);
 }
 
 $sql="CREATE TABLE users(
 id INT(7) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(35) NOT NULL,
 email VARCHAR(45) NOT NULL,
 password VARCHAR(30) NOT NULL,
 age INT(3),
 gender VARCHAR(10),
 blood_group VARCHAR(3),
 mobile VARCHAR(15)
 )";
 
 if($connect->query($sql)===True){
	 echo "Table created successfully.";
	 
 }
 else{
	 echo 'Error creating table.'.$connect->error;
 }
 
 $connect->close();
 ?>