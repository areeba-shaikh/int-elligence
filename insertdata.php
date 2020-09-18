<?php
include "config.php";
// REGISTER USER

$json = file_get_contents('php://input');

// Converts it into a PHP object
$data = json_decode($json);
//$name = mysqli_real_escape_string($connect, $_POST["name"]);
//$email = mysqli_real_escape_string($connect, $_POST['email']);
//$mobile = mysqli_real_escape_string($connect, $_POST['mobile']);
$name = $data->name;
$email = $data->email;
$mobile = $data->mobile;
$password = $data->password;
$gender = $data->gender;
$bloodGroup = $data->bloodGroup;
$query = "INSERT INTO users (name, email, password, mobile,gender)
			  VALUES('$name', '$email', '$password', '$mobile','$gender')";
$results = mysqli_query($connect, $query);
if($results>0)
{
    echo "user added successfully";
}
?>