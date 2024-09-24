<?php 	

require_once 'core.php';

$sql = "SELECT categories.categories_id, categories.categories_name, categories.categories_active,
         categories.categories_status, categories.brand_id, categories.categories_date, brands.brand_name 
        FROM categories 
        INNER JOIN brands ON categories.brand_id = brands.brand_id 
        WHERE categories.categories_status = 1";
$result = $connect->query($sql);

$output = array('data' => array());

if($result->num_rows > 0) { 

 // $row = $result->fetch_array();
 $activeCategories = ""; 

 while($row = $result->fetch_array()) {
 	$categoriesId = $row[0];
 	// active 
 	if($row[2] == 1) {
 		// activate member
 		$activeCategories = "<label class='label label-success'>Disponible</label>";
 	} else {
 		// deactivate member
 		$activeCategories = "<label class='label label-danger'>Pas Disponible</label>";
 	}

 	$button = '<!-- Single button -->
	<div class="btn-group">
	  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    Action <span class="caret"></span>
	  </button>
	  <ul class="dropdown-menu">
	    <li><a type="button" data-toggle="modal" id="editCategoriesModalBtn" data-target="#editCategoriesModal" onclick="editCategories('.$categoriesId.')"> <i class="glyphicon glyphicon-edit"></i> Editer</a></li>
	    <li><a type="button" data-toggle="modal" data-target="#removeCategoriesModal" id="removeCategoriesModalBtn" onclick="removeCategories('.$categoriesId.')"> <i class="glyphicon glyphicon-trash"></i> Supprimerr</a></li>       
	  </ul>
	</div>';

 	$output['data'][] = array( 		
 		$row[1], 		
 		$activeCategories,
		$row[6],
		$row[5],
 		$button		
 		); 	
 } // /while 

}// if num_rows

$connect->close();

echo json_encode($output);