<?php
 $servername="localhost";
 $username="root";
 $password="";
 $database="ambulanceservice";

 $connect=new mysqli($servername,$username,$password,$database);

 if($connect->connect_error){
     echo "Error connection.";
 } 
 $email=$_POST['email'];
 
 $sql_query="SELECT name ,blood_group FROM users WHERE email='$email'";
 $result=$connect->query($sql_query);

 if($result->num_rows>0){
     $row=$result->fetch_assoc();
     echo $row['name']."<br>";
     echo $email."<br>";
     echo $row['blood_group'];
 }
 else{
     echo "Error connection";
 }
?>