<?php require_once 'includes/header.php'; ?>


<div class="row">
	<div class="col-md-12">

		<ol class="breadcrumb">
		  <li><a href="dashboard.php">Accueil</a></li>		  
		  <li class="active">Série</li>
		</ol>

		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="page-heading"> <i class="glyphicon glyphicon-edit"></i>Gérer les series
				</div>
			</div> <!-- /panel-heading -->
			<div class="panel-body">

				<div class="remove-messages"></div>

				<div class="div-action pull pull-right" style="padding-bottom:20px;">
					<button class="btn btn-default button1" data-toggle="modal" data-target="#addBrandModel"> <i class="glyphicon glyphicon-plus-sign"></i><A></A>Ajouter un série </button>
				</div> <!-- /div-action -->				
				
				<table class="table" id="manageBrandTable">
					<thead>
						<tr>							
							<th>Série</th>
							<th>N:</th>
							<th style="width:15%;">Options</th>
						</tr>
					</thead>
				</table>
				<!-- /table -->

			</div> <!-- /panel-body -->
		</div> <!-- /panel -->		
	</div> <!-- /col-md-12 -->
</div> <!-- /row -->

<div class="modal fade" id="addBrandModel" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
    	
    	<form class="form-horizontal" id="submitBrandForm" action="php_action/createBrand.php" method="POST">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title"><i class="fa fa-plus"></i>Ajouter un Série</h4>
	      </div>
	      <div class="modal-body">

	      	<div id="add-brand-messages"></div>

	        <div class="form-group">
	        	<label for="brandName" class="col-sm-3 control-label">Série  </label>
	        	<label class="col-sm-1 control-label">: </label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="brandName" placeholder="Nom de la Série" name="brandName" autocomplete="off">
				    </div>
	        </div> <!-- /form-group-->	         	        
	        <div class="form-group">
	        	<label for="brandStatus" class="col-sm-3 control-label">N: </label>
	        	<label class="col-sm-1 control-label">: </label>
				    <div class="col-sm-8">
				      <select class="form-control" id="brandStatus" name="brandStatus">
				      	<option value="">~~Sélectionner~~</option>
				      	<option value="1">BC</option>
				      	<option value="2">Marché</option>
				      </select>
				    </div>
	        </div> <!-- /form-group-->	         	        

	      </div> <!-- /modal-body -->
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
	        
	        <button type="submit" class="btn btn-primary" id="createBrandBtn" data-loading-text="Loading..." autocomplete="off"> Sauvegarder les modifications</button>
	      </div>
	      <!-- /modal-footer -->
     	</form>
	     <!-- /.form -->
    </div>
    <!-- /modal-content -->
  </div>
  <!-- /modal-dailog -->
</div>
<!-- / add modal -->

<!-- edit brand -->
<div class="modal fade" id="editBrandModel" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
    	
    	<form class="form-horizontal" id="editBrandForm" action="php_action/editBrand.php" method="POST">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title"><i class="fa fa-edit"></i> Modifier la Série</h4>
	      </div>
	      <div class="modal-body">

	      	<div id="edit-brand-messages"></div>

	      	<div class="modal-loading div-hide" style="width:50px; margin:auto;padding-top:50px; padding-bottom:50px;">
						<i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i>
						<span class="sr-only">Loading...</span>
					</div>

		      <div class="edit-brand-result">
		      	<div class="form-group">
		        	<label for="editBrandName" class="col-sm-3 control-label">Série: </label>
		        	<label class="col-sm-1 control-label">: </label>
					    <div class="col-sm-8">
					      <input type="text" class="form-control" id="editBrandName" placeholder="Série Name" name="editBrandName" autocomplete="off">
					    </div>
		        </div> <!-- /form-group-->	         	        
		        <div class="form-group">
		        	<label for="editBrandStatus" class="col-sm-3 control-label">N: </label>
		        	<label class="col-sm-1 control-label">: </label>
					    <div class="col-sm-8">
					      <select class="form-control" id="editBrandStatus" name="editBrandStatus">
					      	<option value="">~~Sélectionner~~</option>
					      	<option value="1">BC</option>
					      	<option value="2">Marché</option>
					      </select>
					    </div>
		        </div> <!-- /form-group-->	
		      </div>         	        
		      <!-- /edit brand result -->

	      </div> <!-- /modal-body -->
	      
	      <div class="modal-footer editBrandFooter">
	        <button type="button" class="btn btn-default" data-dismiss="modal"> <i class="glyphicon glyphicon-remove-sign"></i> Fermer</button>
	        
	        <button type="submit" class="btn btn-success" id="editBrandBtn" data-loading-text="Loading..." autocomplete="off"> <i class="glyphicon glyphicon-ok-sign"></i> Save Changes</button>
	      </div>
	      <!-- /modal-footer -->
     	</form>
	     <!-- /.form -->
    </div>
    <!-- /modal-content -->
  </div>
  <!-- /modal-dailog -->
</div>
<!-- / add modal -->
<!-- /edit brand -->

<!-- remove brand -->
<div class="modal fade" tabindex="-1" role="dialog" id="removeMemberModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><i class="glyphicon glyphicon-trash"></i> Remove Brand</h4>
      </div>
      <div class="modal-body">
        <p>Do you really want to remove ?</p>
      </div>
      <div class="modal-footer removeBrandFooter">
        <button type="button" class="btn btn-default" data-dismiss="modal"> <i class="glyphicon glyphicon-remove-sign"></i> Close</button>
        <button type="button" class="btn btn-primary" id="removeBrandBtn" data-loading-text="Loading..."> <i class="glyphicon glyphicon-ok-sign"></i> Sauvegarder les modifications</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- /remove brand -->

<script src="custom/js/brand.js"></script>

<?php require_once 'includes/footer.php'; ?>