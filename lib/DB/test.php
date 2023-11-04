<?php

require ('connection.php'); 
$user_id = 'mm' ;
$email = 'mm';
$password = 'mm' ;
$fname = 'mm';


$sql = "INSERT INTO `nurse`( `user_id`, `email`  , `password` )
        VALUES             ( :uid ,:email , :password )" ;

$stmt = $connection->prepare($sql) ;
$stmt->execute(array(
	":uid"=> $user_id ,
    "email"=>$email,
	":password"=> $password ,

));

$count = $stmt->rowCount() ;

if ($count > 0) {


	echo json_encode(array("status" => "success add")) ;
}