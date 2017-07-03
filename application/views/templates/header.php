<!DOCTYPE HTML>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta id="viewport" name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">

<link rel="icon" href="<?php echo base_url(); ?>favicon.ico">
				
                <title>Makro Tools</title>
				<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/jquery-ui.min.css">
				<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/bootstrap.css">
				<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/bootstrap-datetimepicker.css">
				<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/bootstrap-theme.css">
				<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/datatables/datatables.min.css"/>
				<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/dropzone.css">
				<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/style.css">
				<script src="<?php echo base_url(); ?>assets/js/jquery.min.js"></script>
				<script src="<?php echo base_url(); ?>assets/js/jquery-ui.min.js"></script>
				<script src="<?php echo base_url(); ?>assets/js/bootstrap.js"></script>
				<script src="<?php echo base_url(); ?>assets/js/bootstrap-datetimepicker.js"></script>
				<script src="<?php echo base_url(); ?>assets/js/dropzone.js"></script>
				<script src="<?php echo base_url(); ?>assets/datatables/datatables.js"></script>
				<script src="<?php echo base_url(); ?>assets/js/js.js"></script>
				
				
        </head>
        <body>
		<div class="loading"></div>
<div class="row">
<?php if($this->auth_level){ ?>
<div class="col-md-3" style="padding-left:0;"><?php 
if(isset($sidebar)){
	include($sidebar.".php"); 
}else{
	include("sidebar.php"); 
}
?></div><div class="col-md-9 main-content" style="height:100vh;overflow:auto;padding-bottom:30px;">              <?php if(isset($title)){ ?><h1><?php echo $title; ?><?php } ?></h1>
<?php }else{ ?>
	<div class="col-md-12 main-content" style="height:100vh;overflow:auto;">
<?php } ?>