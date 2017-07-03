
<table id="table" style="width:100%;">
<thead> <tr>
			<th style="min-width:50px;">Inicio</th>
			<th style="min-width:100px;">Categoría</th>
            <th style="min-width:100px;">Título</th>
            
            <th style="min-width:70px;"></th>
        </tr>
	</thead>
<tbody>
<?php 
foreach($marquesinas as $marquesina){ ?>
	
	
	<?php if($vigentes[$marquesina["categoria"]]==$marquesina["id"]){  ?>
	<td class="marquesina-activa">
	<?php }else{ 
		if($marquesina["inicio"]<date("Y-m-d H:i:s")){ ?>
	<td class="marquesina-vencida">
	<?php }else{ ?>
	<td class="marquesina-pendiente">
	<?php } ?>
	
	<?php } ?>
	<span style="display:none;"><?php echo strtotime($marquesina['inicio']); ?></span><?php if($vigentes[$marquesina["categoria"]]==$marquesina["id"]){  ?>&#10004;<?php } ?><?php echo date('d/m/Y H:i', strtotime($marquesina['inicio'])); ?>
	</td>
	<td><?php echo $categorias[$marquesina["categoria"]]; ?></td>
	<td><?php echo $marquesina['nombre']; ?> <?php if($marquesina["estado"]==1){ ?> <span style="color:red;">(Desactivada)</span> <?php } ?></td>
	<?php  if(false){ ?>
	<td class='btn-tablas'><a href='<?php echo base_url(array("marquesina","view",$marquesina['id'])); ?>'><span class='glyphicon glyphicon-file'></span> </a>
		<a href='<?php echo base_url(array("marquesina","update",$marquesina['id'])); ?>'><span class='glyphicon glyphicon-pencil'></span></a>
		
		<p class='delete' href='<?php echo base_url(array("marquesina",'delete',$marquesina['id'])); ?>'><span class='glyphicon glyphicon-trash'></span> </p>
	</td></tr>
	<?php } ?>
	<td class='btn-tablas'>
		<a  href='<?php echo base_url(array("marquesina","view",$marquesina['id'])); ?>'><span class='glyphicon glyphicon-pencil'></span></a>
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