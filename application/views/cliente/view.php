<form name="myform" action="<?php echo base_url(array("notificacion","create")); ?>" method="post" target="_blank">

  <input type="hidden" name='<?php echo $this->security->get_csrf_token_name(); ?>'  value="<?php echo $this->security->get_csrf_hash(); ?>" />
  <input type="hidden" name='grupo'  value="2" />
  <input type="hidden" name='destinatario'  value="<?php echo $cliente['CUST_NO']; ?>" />
  <button style="color:white;">Enviar a este cliente</button>
</form>

<h4><strong>Numero de cliente:</strong> <?php echo $cliente["CUST_NO"]; ?></h4>
<h4><strong>Nombre:</strong> <?php echo $cliente["CUST_NAME"]; ?></h4>
<h4><strong>Pasaporte:</strong> <?php echo $cliente["PASSPORT_NO"]; ?></h4>
<h4><strong>Tipo:</strong> <?php echo $cliente["CUST_TYPE_DESCR"]; ?> </h4>
<h4><strong>Sucursal:</strong> <?php echo $cliente["STORE_NO"]; ?> </h4>
<?php if($this->auth_level==9){ ?>
<hr>
<h4><strong>Email:</strong> <?php echo $cliente["EMAIL"]; ?> </h4>
<h4><strong>Telefono:</strong> <?php echo $cliente["PHONE"]; ?> </h4>
<h4><strong>Estado:</strong> <?php echo $cliente["STATUS_NO"]; ?></h4>
<h4><strong>TS:</strong> <?php echo date('d/m/Y H:i', strtotime($cliente['TS'])); ?></h4>
<hr>
<h3>Dispositivos</h3>
<?php 
$suscritos=0;
 ?>
<ul <?php if(!isset($_GET["data"])){ ?> style="display:none;" <?php } ?>>
<?php foreach($suscripciones as $suscripcion){ ?>
<li><h4 style="word-break:break-word;"><strong>Device ID:</strong> <?php echo $suscripcion["DEVICE_ID"]; ?></h4>
<h4 style="word-break:break-word;"><strong>Token:</strong> <?php if(isset($suscripcion["TOKEN_ID"])){echo $suscripcion["TOKEN_ID"]; $suscritos++;}else{echo "Sin token";}; ?> </h4>
</li>
<?php } ?>
</ul>

<p><?php echo count($suscripciones) ?> dispositivos, <?php echo $suscritos; ?> subscritos.</p>
<hr>
<?php } ?>




<?php if(false){ ?>
<a href="<?php echo base_url(array("cliente","update",$cliente['CUST_NO'])); ?>">Editar Datos</a><br><br><?php } ?>
<a href="<?php echo base_url(array("cliente","notificaciones",$cliente['CUST_NO'])); ?>">Notificaciones individuales a este cliente</a><br><br>


<?php if(isset($grupos)&&count($grupos)>0){ ?>
<br>
<h3>Grupos a los que pertenece</h3>
<?php } ?>