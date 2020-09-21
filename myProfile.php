<?php
 $servername='localhost';
 $username="root";
 $password='';
 $database='ambulanceservice';

 $connect=new mysqli($servername,$username,$password,$database);

 if($connect->connect_error){
     die('Cannot connect to the server.');
 }
 
 $name=$_POST['name'];
 $age=$_POST['age'];
 $gender=$_POST['gender'];
 $blood_group=$_POST['blood_group'];
 $mobile=$_POST['mobile'];

 $take_data="SELECT * FROM users WHERE name='$name'";
 $result=$connect->query($take_data);
 
 if($result->num_rows>0){
     $row=$result->fetch_assoc();

     if($row['age']!=$age){
        $update_query="UPDATE users SET age=$age WHERE name='$name'";
        $connect->query($update_query);
    }

    if($row['gender']!='$gender'){
        $update_query="UPDATE users SET gender='$gender' WHERE name='$name'";
        $connect->query($update_query);
    }

    if($row['blood_group']!='$blood_group'){
        $update_query="UPDATE users SET blood_group='$blood_group' WHERE name='$name'";
        $connect->query($update_query);
    }
    
    if($row['mobile']!='$mobile'){
        $update_query="UPDATE users SET mobile='$mobile' WHERE name='$name'";
        $connect->query($update_query);
    }
 }
?>