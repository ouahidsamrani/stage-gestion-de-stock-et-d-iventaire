<?php

require_once 'core.php';

$orderId = $_POST['orderId'];

$sql = "SELECT order_date, client_name, client_contact, sub_total, vat, total_amount, discount, grand_total, paid, due, payment_place, gstn FROM orders WHERE order_id = $orderId";

$orderResult = $connect->query($sql);
$orderData = $orderResult->fetch_array();

$orderDate = $orderData[0];
$clientName = $orderData[1];
$clientContact = $orderData[2]; 
$subTotal = $orderData[3];
$vat = $orderData[4];
$totalAmount = $orderData[5]; 
$discount = $orderData[6];
$grandTotal = $orderData[7];
$paid = $orderData[8];
$due = $orderData[9];
$payment_place = $orderData[10];
$gstn = $orderData[11];

$orderItemSql = "SELECT order_item.product_id, order_item.rate, order_item.quantity, order_item.total,
product.product_name FROM order_item
   INNER JOIN product ON order_item.product_id = product.product_id 
 WHERE order_item.order_id = $orderId";
$orderItemResult = $connect->query($orderItemSql);

$table = '
<style>
    body {
        font-family: Arial, sans-serif;
    }
    .invoice-header {
        text-align: center;
        color: #e74c3c;
        text-decoration: underline;
        font-size: 25px;
        margin-bottom: 20px;
    }
    .invoice-table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 10px;
    }
    .invoice-table, .invoice-table th, .invoice-table td {
        border: 1px solid black;
    }
    .invoice-table th, .invoice-table td {
        padding: 12px;
        text-align: left;
    }
    .invoice-table th {
        background-color: #f2f2f2;
    }
    .right-text {
        text-align: right;
    }
    .contact-info {
        text-align: right;
        color: #3498db;
        margin-top: 10px;
    }
    .highlight {
        color: #e74c3c;
        font-weight: bold;
    }
    .email {
        color: #3498db;
        text-decoration: underline;
    }
</style>

<img src="ensa.png" alt="logo" width="200px" style="float: right; margin-bottom: 20px;">
<div class="invoice-header">TAX INVOICE</div>
<table class="invoice-table">
    <tr>
        <td colspan="5" class="right-text highlight">ORIGINAL</td>
    </tr>
    <tr>
        <td colspan="5" class="right-text highlight">DUPLICATE</td>
    </tr>
    <tr>
        <td colspan="5" class="right-text highlight">IMS</td>
    </tr>
    <tr>
        <td colspan="5" class="right-text">Nr. Your First Address,</td>
    </tr>
    <tr>
        <td colspan="5" class="right-text">Cityname, Pincode</td>
    </tr>
    <tr>
        <td colspan="5" class="right-text">Tele: 1234567890, 1478523690</td>
    </tr>
    <tr>
        <td colspan="5" class="right-text email">email0@email.co.in</td>
    </tr>
</table>

<table class="invoice-table">
    <tr>
        <td colspan="2">
            <table style="width: 100%; border: 1px solid black;">
                <tr>
                    <td class="highlight">TO:</td>
                    <td>'.$clientName.'</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
            </table>
        </td>
        <td colspan="3">
            <table style="width: 100%;">
                <tr>
                    <td class="highlight">Date:</td>
                    <td>'.$orderDate.'</td>
                </tr>
                <tr>
                    <td class="highlight">Mobile No:</td>
                    <td>'.$clientContact.'</td>
                </tr>
            </table>
        </td>
    </tr>
</table>
';

$connect->close();

echo $table;
?>
