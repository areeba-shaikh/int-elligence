<?php

$user = 'id14896416_admin';
$password = 'Ambulance@123';
$host="localhost";
$db_name="id14896416_ambulanceservice"; //change databasename

$connect=mysqli_connect($host,$user,$password,$db_name);

if(!$connect)
{
	echo json_encode("Connection Failed");
}
?>