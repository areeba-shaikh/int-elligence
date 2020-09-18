<?php
 $servername='localhost';
 $username='root';
 $password='';
 $database='ambulanceservice';

 $connect=new mysqli($servername,$username,$password,$database);

 if($connect->connect_error){
     die('Error connection.');
 }

$entered_password=$_POST['password'];
$entered_email=$_POST['email'];
$email_password_query="SELECT email, password FROM users WHERE email='$entered_email'";
$result=$connect->query($email_password_query);

if($result->num_rows > 0){
   $row=$result->fetch_assoc();
   if($row['password']==$entered_password){
    echo 'login successful.';
   }
   else{
    echo 'username or password is Incorrect.';
    }

}
else{
    echo 'username or password is Incorrect.';
}
$connect->close();
?>