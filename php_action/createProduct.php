<?php

require_once 'core.php';

$valid['success'] = array('success' => false, 'messages' => array());

if($_POST) {    

    $productName       = $_POST['productName'];
    $quantity          = $_POST['quantity'];
    $rate              = $_POST['rate'];
    $brandName         = $_POST['brandName'];
    $categoryName      = $_POST['categoryName'];
    $productStatus     = $_POST['productStatus'];

    // Default image URL
    $defaultImageUrl = '../assests/images/stock/default_image.jpg';

    // Check if an image is uploaded
    if($_FILES['productImage']['name']) {
        $type = explode('.', $_FILES['productImage']['name']);
        $type = $type[count($type)-1];        
        $url = '../assests/images/stock/'.uniqid(rand()).'.'.$type;

        if(in_array($type, array('gif', 'jpg', 'jpeg', 'png', 'JPG', 'GIF', 'JPEG', 'PNG'))) {
            if(is_uploaded_file($_FILES['productImage']['tmp_name'])) {            
                if(move_uploaded_file($_FILES['productImage']['tmp_name'], $url)) {
                    $productImage = $url;
                } else {
                    $valid['success'] = false;
                    $valid['messages'] = "Error while uploading the image";
                    echo json_encode($valid);
                    return;
                }   
            } else {
                $productImage = $defaultImageUrl;
            }
        } else {
            $productImage = $defaultImageUrl;
        }         
    } else {
        $productImage = $defaultImageUrl;
    }

    $sql = "INSERT INTO product (product_name, product_image, brand_id, categories_id, quantity, rate, active, status) 
            VALUES ('$productName', '$productImage', '$brandName', '$categoryName', '$quantity', '$rate', '$productStatus', 1)";

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
?>
