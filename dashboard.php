<?php require_once 'includes/header.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<link rel="stylesheet" href="custom/css/style.css">
</head>

</html>
<?php 

$sql = "SELECT * FROM product WHERE status = 1";
$query = $connect->query($sql);
$countProduct = $query->num_rows;

$orderSql = "SELECT * FROM orders WHERE order_status = 1";
$orderQuery = $connect->query($orderSql);
$countOrder = $orderQuery->num_rows;

$totalRevenue = 0;
while ($orderResult = $orderQuery->fetch_assoc()) {
	$totalRevenue += (float) $orderResult['paid'];
}


$lowStockSql = "SELECT * FROM product WHERE quantity <= 3 AND status = 1";
$lowStockQuery = $connect->query($lowStockSql);
$countLowStock = $lowStockQuery->num_rows;

$userwisesql = "SELECT users.username , SUM(orders.grand_total) as totalorder FROM orders INNER JOIN users ON orders.user_id = users.user_id WHERE orders.order_status = 1 GROUP BY orders.user_id";
$userwiseQuery = $connect->query($userwisesql);
$userwieseOrder = $userwiseQuery->num_rows;

$connect->close();

?>


<style type="text/css">
	.ui-datepicker-calendar {
		display: none;

	}
	a{
		text-decoration: none;
	}
</style>

<!-- fullCalendar 2.2.5-->
    <link rel="stylesheet" href="assests/plugins/fullcalendar/fullcalendar.min.css">
    <link rel="stylesheet" href="assests/plugins/fullcalendar/fullcalendar.print.css" media="print">


<div class="row">
	<?php  if(isset($_SESSION['userId']) && $_SESSION['userId']==1) { ?>
	<div class="col-md-4">
		<div class="panel panel-success">
			<div class="panel-heading">
				
				<a href="product.php" style="text-decoration:none;color:black;">
					Produit total
					<span class="badge pull pull-right"><?php echo $countProduct; ?></span>	
				</a>
				
			</div> <!--/panel-hdeaing-->
		</div> <!--/panel-->
	</div> <!--/col-md-4-->
	
	<div class="col-md-4">
		<div class="panel panel-danger">
			<div class="panel-heading">
				<a href="product.php" style="text-decoration:none;color:black;">
					 Stock faible
					<span class="badge pull pull-right"><?php echo $countLowStock; ?></span>	
				</a>
				
			</div> <!--/panel-hdeaing-->
		</div> <!--/panel-->
	</div> <!--/col-md-4-->
	
	
	<?php } ?>  
		<div class="col-md-4">
			<div class="panel panel-info">
			<div class="panel-heading">
				<a href="orders.php?o=manord" style="text-decoration:none;color:black;">
					Total des commandes
					<span class="badge pull pull-right"><?php echo $countOrder; ?></span>
				</a>
					
			</div> <!--/panel-hdeaing-->
		</div> <!--/panel-->
		</div> <!--/col-md-4-->

	

	<div class="col-md-4">
		<div class="card">
		  <div class="cardHeader">
		    <h1><?php echo date('d'); ?></h1>
		  </div>

		  <div class="cardContainer">
		    <p><?php echo date('l') .' '.date('d').', '.date('Y'); ?></p>
		  </div>
		</div> 
		<br/>

		

	</div>
	
	<?php  if(isset($_SESSION['userId']) && $_SESSION['userId']==1) { ?>
	<div class="col-md-8">
		<div class="panel panel-default">
			<div class="panel-heading"> <i class="glyphicon glyphicon-calendar"></i> Commande par utilisateur</div>
			<div class="panel-body">
				<table class="table" id="productTable">
			  	<thead>
			  		<tr>			  			
			  			<th style="width:40%;">Nom</th>
			  			<th style="width:20%;">Commande en roupies</th>
			  		</tr>
			  	</thead>
			  	<tbody>
					<?php while ($orderResult = $userwiseQuery->fetch_assoc()) { ?>
						<tr>
							<td><?php echo $orderResult['username']?></td>
							<td><?php echo $orderResult['totalorder']?></td>
							
						</tr>
						
					<?php } ?>
				</tbody>
				</table>
				<!--<div id="calendar"></div>-->
			</div>	
		</div>
		
	</div> 
	<style>
		.card1{
			/* text-align: center; */
		}
		.card1 img{
			margin-bottom: 20px;
			
		}
		
		.aa{
			margin-bottom: 20px;
			color:#0031EB;
			width: 200px;
			margin-right: 20px;
			text-align: center;
			font-size: 25px;
			font-weight: 700;
			border: 1px solid #0031EB;
			border-radius: 20px;
			padding: 8px 0px;
			transition: transform 0.5s ease-in-out;
		}
		.a1{
			background-color: #000;
			margin-bottom: 20px;
			color:#0031EB;
			width: 200px;
			margin-right: 20px;
			text-align: center;
			font-size: 25px;
			font-weight: 700;
			border: 3px solid #ffa700;
			border-radius: 20px;
			padding: 8px 0px;
			transition: transform 0.5s ease-in-out;
		}
		.a1 a{
			color:#ffa700;
		}
		.aa a{
			color:#0031EB;
		}
		
		.aa:hover, .aa a:hover{
			color:white;
			background-color: #0031EB ;
			transform: scale(1.1);


		}
		.aa a:hover{
			border-bottom: #fff solid 3px;

		}
		.a1:hover, .a1 a:hover{
			color:black;
			background-color: #ffa700 ;
			transform: scale(1.1);
			


		}
		.a1 a:hover{
			border-bottom: #000 solid 3px;

		}
		
		
		
		
	</style>
	

	<?php  } ?>
	
</div>
<div style="display: flex;">
	<div class="card1" style="width: 20%;  margin-right: 10px;">
	<a href="brand.php">		<img style="width: 200px;"src="imgdashboard\toppng.com-report-icon-png-download-daily-reports-350x350.png" alt="">
</a>		
		<div class="aa"> <a style="text-decoration: none;" href="brand.php">BC/MARCHÉ</a> </div>		
	</div>
	<div class="card1" style="width: 20%;">
		<a href="categories.php">
	<img style="width: 200px;"src="imgdashboard/—Pngtree—3d illustration of an empty_13319647.jpg" alt="">

		</a>
	<div class="a1">	<a style="text-decoration: none;" href="categories.php">OBJET</a>
</div>

	</div>
	<div class="card1" style="width: 20%;">
		<a href="product.php">
		<img style="width: 200px;"src="imgdashboard/overhead-view-two-shopping-carts-blue-green-background.jpg" alt="">

		</a>
		<div class="aa"><a style="text-decoration: none;" href="product.php">ARTICLE</a>
</div>

	</div>
	<div class="card1" style="width: 20%;">
		<a href="orders.php">
		<img style="width: 200px;" src="imgdashboard/pngtree-flourishing-e-commerce-industry-3d-illustration-of-online-marketplaces-image_3822994.jpg" alt="">

		</a>
	<div class="a1"><a style="text-decoration: none;" href="orders.php?o=add">COMMANDES</a>
</div>

	</div>
	<div class="card1" style="width: 20%;">
		<a href="report.php">
		<img style="width: 200px;"src="imgdashboard\—Pngtree—report line filled icon_3789634.png" alt="">

		</a>
		<div class="aa"><a style="text-decoration: none;" href="report.php">RAPPORT</a>
</div>

	</div>
	
</div>
 <!--/row-->

<!-- fullCalendar 2.2.5 -->
<script src="assests/plugins/moment/moment.min.js"></script>
<script src="assests/plugins/fullcalendar/fullcalendar.min.js"></script>


<script type="text/javascript">
	$(function () {
			// top bar active
	$('#navDashboard').addClass('active');

      //Date for the calendar events (dummy data)
      var date = new Date();
      var d = date.getDate(),
      m = date.getMonth(),
      y = date.getFullYear();

      $('#calendar').fullCalendar({
        header: {
          left: '',
          center: 'title'
        },
        buttonText: {
          today: 'today',
          month: 'month'          
        }        
      });


    });
</script>

<?php require_once 'includes/footer.php'; ?>