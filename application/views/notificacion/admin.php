
<table id="table" style="width:100%;">
<thead> <tr>
			<th style="min-width:100px;">Fecha</th>
			 <th style="min-width:100px;">Nombre del grupo</th>
            <th style="min-width:100px;">Título</th>
            <th style="min-width:100px;">Estado</th>
            <th style="min-width:100px;">Respuesta</th>
           
            <th style="min-width:70px;"></th>
        </tr>
	</thead>
<tbody>
<?php 
foreach($notificaciones as $notificacion){ 
	 $response= json_decode($notificacion["response"]);
	if(isset($notificacion['envio'])) {
		if(isset($response->failure)&&$response->failure>=1){ ?>
		<td class="marquesina-vencida">	
		<?php }else{ ?>
		<td class="marquesina-activa">
		<?php } ?>
	<?php }else{ ?>
	<td class="marquesina-pendiente">
	<?php } ?>
	
	<span style="display:none;"><?php echo strtotime($notificacion['fecha']); ?></span><?php if(isset($notificacion['envio'])) {?>&#10004;<?php } ?> <?php echo date('d/m/Y H:i', strtotime($notificacion['fecha'])); ?>
	</td>
	<td><?php echo $notificacion["nombre_destinatario"]; ?></td>
	<td><?php echo $notificacion['titulo']; ?> </td>
	<td> <?php if(isset($notificacion['envio'])) {echo "Enviado: <br>".date('d/m/Y H:i', strtotime($notificacion['envio'])); }else{ echo "Pendiente";}; 
?></td>
	<td class="response"><?php
		if(false){
			if(isset($response->success)&&$response->success>=1){
				echo "Recibido con éxito.";
			}
			if(isset($response->failure)&&$response->failure>=1){
				echo "Error al enviar";
			}
			if(isset($response->message_id)){
			echo 'ID de envío: '. str_replace('}',"", str_replace('{"message_id":',"",$notificacion["response"]));
			}
		}
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
	?></td>
	<td class='btn-tablas'>
		<a style="margin:1em !important;display:inline-block;" href='<?php echo base_url(array("notificacion","view",$notificacion['id'])); ?>'><span class='glyphicon glyphicon-search'></span></a>
		<?php if(false){ ?>
		<p class='delete' href='<?php echo base_url(array("notificacion",'delete',$notificacion['id'])); ?>'><span class='glyphicon glyphicon-trash'></span> </p>
		<?php } ?>
	</td></tr>
	<?php
}

?>
</tbody>
</table>

<script>
var table;
$(document).ready(function(){
    table=$('#table').DataTable({"columnDefs": [ {
"targets": 3,
"orderable": false
} ]});
	$("[type='search']").attr("placeholder","Búsqueda");
});

jQuery(document).on('click','.delete',function() {
	if(!confirm('¿Seguro que desea borrar este elemento?')) return false;
	$(".loading").show();
	var row=this;
	
	$.post( $(this).attr('href'),{'<?php echo $this->security->get_csrf_token_name(); ?>' : '<?php echo $this->security->get_csrf_hash(); ?>'}, function( data ) {
		console.log("borrado");
		 table
        .row( $(row).parents('tr') )
        .remove()
        .draw();
		$(".loading").hide();
		
	});
	
});

</script>

<style>
#table td, #table2 td{font-size:14px;line-height:18px;}
</style>