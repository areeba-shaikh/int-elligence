<?php

include "config.php";
	// REGISTER USER

        $json = file_get_contents('php://input');

        // Converts it into a PHP object
        $data = json_decode($json);


	    //$name = mysqli_real_escape_string($connect, $_POST["name"]);
	    //$email = mysqli_real_escape_string($connect, $_POST['email']);
	    //$mobile = mysqli_real_escape_string($connect, $_POST['mobile']);
	 
        $email = $data->email;
        $password = $data->password;
        
        $query = "SELECT * FROM users WHERE '$email'=email AND '$password'=password";
        
	    $results = mysqli_query($connect, $query);
	    
	    $rowcount=mysqli_num_rows($results);
	    if($rowcount>0)
	    {   
	        
	        echo "Login  successfully";
	    } 
	    else
	    {
	        echo "Login failure";
	    }
	    ?>