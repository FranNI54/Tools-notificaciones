
<table id="table" style="width:100%;">
<thead> <tr>
			<th style="min-width:50px;">Fecha</th>
            <th style="min-width:100px;">Título</th>
            <th style="min-width:100px;">Estado</th>
            <th style="min-width:70px;"></th>
        </tr>
	</thead>
<tbody>
<?php 
foreach($notificaciones as $notificacion){ ?>
	
	
	
	<?php if(isset($notificacion['envio'])) {  ?>
	<td class="marquesina-activa">
	<?php }else{ ?>
	<td class="marquesina-pendiente">
	<?php } ?>
	
	<span style="display:none;"><?php echo strtotime($notificacion['fecha']); ?></span><?php if(isset($notificacion['envio'])) {?>&#10004;<?php } ?> <?php echo date('d/m/Y H:i', strtotime($notificacion['fecha'])); ?>
	</td>
	<td><?php echo $notificacion['titulo']; ?> </td>
	<td> <?php if(isset($notificacion['envio'])) {echo "Enviado: ".date('d/m/Y H:i', strtotime($notificacion['envio'])); }else{ echo "Pendiente";}; 
?></td>
	<td class='btn-tablas'>
		<a href='<?php echo base_url(array("notificacion","view",$notificacion['id'])); ?>'><span class='glyphicon glyphicon-pencil'></span></a>
		<p class='delete' href='<?php echo base_url(array("notificacion",'delete',$notificacion['id'])); ?>'><span class='glyphicon glyphicon-trash'></span> </p>
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