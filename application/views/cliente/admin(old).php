
<table id="table" style="width:100%;">
<thead> <tr>
			<th style="min-width:50px;">Numero de cliente</th>
            <th style="min-width:100px;">Nombre</th>
            <th style="min-width:100px;">Tipo</th>
            <th style="min-width:70px;"></th>
        </tr>
	</thead>
<tbody>
<?php 
foreach($clientes as $cliente){ ?>
	
	
	
	<tr>
	<td><?php echo $cliente['numero']; ?> </td>
	<td><?php echo $cliente['nombre']; ?> </td>
	<td><?php if(isset($cliente['tipo'])){if($cliente['tipo']==1){echo "Tienda"; }else{echo "Individuo"; }}else{ echo "Indefinido"; } ?> </td>
	
	<td class='btn-tablas'>
		<a href='<?php echo base_url(array("cliente","view",$cliente['id'])); ?>'><span class='glyphicon glyphicon-pencil'></span></a>
		<p class='delete' href='<?php echo base_url(array("cliente",'delete',$cliente['id'])); ?>'><span class='glyphicon glyphicon-trash'></span> </p>
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