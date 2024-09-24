<?php 	

require_once 'core.php';

$valid['success'] = array('success' => false, 'messages' => array());

if($_POST) {	

	$categoriesName = $_POST['categoriesName'];
  $categoriesStatus = $_POST['categoriesStatus'];
  $brandName = $_POST['brandName'];
  $categoriesDate = date('Y-m-d', strtotime($_POST['categoriesDate']));	

	$sql = "INSERT INTO categories (categories_name, categories_active, categories_status, brand_id, categories_date) 
	VALUES ('$categoriesName', '$categoriesStatus', 1, $brandName, '$categoriesDate')";

	if($connect->query($sql) === TRUE) {
	 	$valid['success'] = true;
		$valid['messages'] = "Successfully Added";	
	} else {
	 	$valid['success'] = false;
	 	$valid['messages'] = "Error while adding the members";
	}

	$connect->close();

	echo json_encode($valid);
 
} // /if $_POST