<?php 

require_once 'core.php';

if($_POST) {

    $startDate = $_POST['startDate'];
    $date = DateTime::createFromFormat('m/d/Y', $startDate);
    $start_date = $date->format("Y-m-d");

    $endDate = $_POST['endDate'];
    $format = DateTime::createFromFormat('m/d/Y', $endDate);
    $end_date = $format->format("Y-m-d");

    $sql = "SELECT product.product_id, product.product_name, product.product_image, product.brand_id,
        product.categories_id, product.quantity, product.rate, product.active, product.status, 
        brands.brand_name, brands.brand_active, categories.categories_name, categories.categories_date 
        FROM product 
        INNER JOIN brands ON product.brand_id = brands.brand_id 
        INNER JOIN categories ON product.categories_id = categories.categories_id  
        WHERE categories.categories_date >= '$start_date' AND categories.categories_date <= '$end_date'";
    $query = $connect->query($sql);

    $table = '
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #ff4d4d;
            text-align: center;
            margin-top: 20px;
        }
        .report-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        .report-table, .report-table th, .report-table td {
            border: 1px solid #ddd;
        }
        .report-table th, .report-table td {
            padding: 12px;
            text-align: center;
        }
        .report-table th {
            background-color: #f2f2f2;
            color: #333;
        }
        .report-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .report-table tr:hover {
            background-color: #f1f1f1;
        }
        .report-table th {
            background-color: #4CAF50;
            color: white;
        }
        .report-table td.status-disponible {
            background-color: #dff0d8;
            color: #3c763d;
        }
        .report-table td.status-pas-disponible {
            background-color: #f2dede;
            color: #a94442;
        }
        .report-table td.active-bc {
            background-color: #d9edf7;
            color: #31708f;
        }
        .report-table td.active-marche {
            background-color: #fcf8e3;
            color: #8a6d3b;
        }
        .report-table img {
           display: block;
            text-align:center;
        }
    </style>
    <img src="ensa.png" width="200px">
    <h1>Rapport des produits</h1>
    <table class="report-table">
        <tr>
            <th>Date</th>
            <th>Nom du Produit</th>
            <th>Quantité</th>
            <th>Status</th>
            <th>Série du Marque</th>
            <th>État du Marque</th>
            <th>Catégories</th>
        </tr>';

    $totalAmount = 0;
    while ($result = $query->fetch_assoc()) {
        $active = ($result['brand_active'] == 1) ? 'BC' : 'Marche';
        $status = ($result['active'] == 1) ? 'Disponible' : 'Pas Disponible';

        $statusClass = ($status == 'Disponible') ? 'status-disponible' : 'status-pas-disponible';
        $activeClass = ($active == 'BC') ? 'active-bc' : 'active-marche';

        $table .= '
        <tr>
            <td>'.$result['categories_date'].'</td>
            <td>'.$result['product_name'].'</td>
            <td>'.$result['quantity'].'</td>
            <td class="'.$statusClass.'">'.$status.'</td>
            <td>'.$result['brand_name'].'</td>
            <td class="'.$activeClass.'">'.$active.'</td>
            <td>'.$result['categories_name'].'</td>
        </tr>';    
    }

    $table .= '
    </table>';

    echo $table;
}
?>
