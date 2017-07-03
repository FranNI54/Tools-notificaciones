<h5 style="display:inline-block;"><strong>Fecha de envio:</strong> <?php if(isset($notificacion['fecha'])) {echo date('d/m/Y H:i', strtotime($notificacion['fecha'])); }; 
?></h5>
<h5 style="display:inline-block;padding-left: 10px;margin-left: 10px;border-left: 1px solid gray;"><strong>Estado:</strong> <?php if(isset($notificacion['envio'])) {echo "Enviado ".date('d/m/Y H:i', strtotime($notificacion['envio'])); }else{ echo "Pendiente";}; 
?></h5>
<h4 style="display:none;"><?php $response= json_decode($notificacion["response"]);
		if(isset($response->success)&&$response->success>=1){
			echo "Recibido con éxito.";
		}
		if(isset($response->failure)&&$response->failure>=1){
			echo "Error al enviar";
		}
		if(isset($response->message_id)){
		echo 'ID de envío: '. str_replace('}',"", str_replace('{"message_id":',"",$notificacion["response"]));
		}
	?></h4>
<?php if(false&&isset($response->details)){ ?>
<h5><?php echo $response->details; ?></h5>
<?php } ?>
<br>
<div class="notificacion-card">
<h5><strong>Destinatario:</strong> <?php if(isset($destinatario)){echo $destinatario;} ?></h5>
<h5><strong>Título:</strong> <?php echo $notificacion["titulo"];  ?></h5>
<?php if(isset($notificacion["texto"])&&$notificacion["texto"]!=""){ ?>
<h5><strong>Texto:</strong> <?php echo $notificacion["texto"];  ?></h5>
<?php } ?>
<?php if(isset($notificacion["link"])&&$notificacion["link"]!=""){ ?>
<h5><strong>Link:</strong> <a href='<?php echo $notificacion["link"];  ?>'><?php echo $notificacion["link"];  ?></a></h5>
<?php } ?>
</div>
<?php 
if($this->auth_level==9){
if($notificacion["response"]!=""){ ?>
<hr>
<h5 style="font-size:16px;"><strong>Respuesta</strong></h5>
<p style="font-size:14px;"><?php //echo $notificacion["response"]; 
$first=true;
if(is_object($response)){
		foreach($response as $key=>$value){
			if($first){
				$first=false;
			}else{
				echo "<br>";
			}
			echo "<strong>".$key."</strong>".":";
			if(is_array($value)){
				foreach($value as $key2=>$value2){
					if(is_object($value2)){
						foreach($value2 as $key3=>$value3){
							echo "<br>";
							echo '&nbsp;&nbsp;&nbsp;&nbsp;';
							echo "<strong>".$key3."</strong>".": ".$value3;
						}
					}else{
						echo "<br>";
						echo '&nbsp;&nbsp;';
						echo "<strong>".$key2."</strong>".": ".$value2;
					}
					
				}
			}else{
				echo $value;
			}
			
		}
		}
?></p>

<?php } } ?>
<?php if(!isset($notificacion['envio'])) { ?>
<?php if(false){ ?><a href="<?php echo base_url(array("notificacion","update",$notificacion['id'])); ?>">Editar Datos</a><br><br>
<button type="button" id="enviarAhora">Enviar ahora</button><?php } ?>
<?php } ?>

<br>
<br>
<a href="<?php echo base_url(); ?>grupo/view/<?php echo $notificacion['destinatario']; ?>#mensajes" class="button-like" style="margin-left:0;">Volver al grupo</a>

<br>
<br>
<br>

<script>
$("body").on("click","#enviarAhora",function(){
	if(!confirm('¿Seguro que desea enviar ahora elemento?')) return false;
	location.replace("<?php echo base_url(array("notificacion",'send',$notificacion['id'])); ?>");
});
</script>
<?php if(isset($notificacion['envio'])) { ?>
<h4>Clientes enviados:</h4>
<?php $this->load->view('cliente/admin',array("noButtons"=>true));

} ?>