<?php
include "config.php";
// REGISTER USER


$name = mysqli_real_escape_string($connect, $_POST['name']);
$email = mysqli_real_escape_string($connect, $_POST['email']);
$mobile = mysqli_real_escape_string($connect, $_POST['mobile']);


$query = "INSERT INTO users (name, email,mobile)
  			  VALUES('$name', '$email','$mobile')";
$results = mysqli_query($connect, $query);
if ($results > 0) {
    echo "user added successfully";
}

?>