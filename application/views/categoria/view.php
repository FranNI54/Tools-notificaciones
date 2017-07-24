<?php
if($categoria["actual"]==0){
	?> <h3>No hay marquesina vigente.</h3> <?php 
}else{ ?>
	<h3><a href="<?php echo base_url(array("marquesina","view",$categoria["actual"])); ?>">Ver Marquesina vigente.</a></h3>
<?php } ?>

<?php if($marquesinas==null){ ?>
	<h3>No hay marquesinas con esta categoria</h3>
<?php }else{ ?>
<table id="table" style="width:100%;">
<thead> <tr>
            <th style="min-width:300px;">Fecha inicio</th>
            <th style="min-width:300px;">Título</th>
            <th style="min-width:70px;"></th>
        </tr>
	</thead>
<tbody>
<?php 
foreach($marquesinas as $marquesina){ ?>
	
	<tr> 
	<?php if($categoria['actual']==$marquesina["id"]){  ?>
	<td class="marquesina-activa">
	<?php }else{ 
		if($marquesina["inicio"]<date("Y-m-d H:i:s")){ ?>
	<td class="marquesina-vencida">
	<?php }else{ ?>
	<td class="marquesina-pendiente">
	<?php } ?>
	<?php } ?>
	<span style="display:none;"><?php echo strtotime($marquesina['inicio']); ?></span><?php if($categoria['actual']==$marquesina["id"]){  ?>&#10004;<?php } ?><?php echo date('d/m/Y H:i', strtotime($marquesina['inicio'])); ?>
	</td>
	<td><?php echo $marquesina['nombre']; ?></td>
	<td class='btn-tablas'><a href='<?php echo base_url(array("marquesina","view",$marquesina['id'])); ?>'><span class='glyphicon glyphicon-file'></span> </a>
		<a href='<?php echo base_url(array("marquesina","update",$marquesina['id'])); ?>'><span class='glyphicon glyphicon-pencil'></span></a>
		<p class='delete' href='<?php echo base_url(array("marquesina",'delete',$marquesina['id'])); ?>'><span class='glyphicon glyphicon-trash'></span> </p>
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
"targets": 2,
"orderable": false
} ],"order": [[ 1, "desc" ]]});
	$("[type='search']").attr("placeholder","Busqueda");
});

jQuery(document).on('click','.delete',function() {
	if(!confirm('¿Seguro que desea borrar este elemento?')) return false;
	$(".loading").show();
	var row=this;
	
	$.post( $(this).attr('href'),{'<?php echo $this->security->get_csrf_token_name(); ?>' : '<?php echo $this->security->get_csrf_hash(); ?>'}, function( data ) {
		location.reload();
	});
	
});

</script>

<?php } ?>
