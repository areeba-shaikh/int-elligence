<?php
$username="admin";//change username 
$password="ly8[TH{|tWMk*r]b"; //change password
$host="localhost";
$db_name="AmbulanceService"; //change databasename

$connect=mysqli_connect($host,$username,$password,$db_name);

if(!$connect)
{
	echo json_encode("Connection Failed");
}
