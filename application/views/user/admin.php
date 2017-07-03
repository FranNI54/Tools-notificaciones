<table id="table" style="width:100%;">
<thead> <tr>
           
            <th style="min-width:300px;">Nombre de usuario</th>
            <th style="min-width:300px;">Email</th>
            <th style="min-width:70px;"></th>
        </tr>
	</thead>
<tbody>
<?php 
foreach($usuarios as $usuario){ ?>
	
	
	<td><?php echo $usuario['username']; ?></td>
	<td><?php echo $usuario['email']; ?></td>
	<td class='btn-tablas'><a href='<?php echo base_url(array("user","view",$usuario['user_id'])); ?>'><span class='glyphicon glyphicon-file'></span> </a>
		<a href='<?php echo base_url(array("user","update",$usuario['user_id'])); ?>'><span class='glyphicon glyphicon-pencil'></span></a>
		<p class='delete' href='<?php echo base_url(array("user",'delete',$usuario['user_id'])); ?>'><span class='glyphicon glyphicon-trash'></span> </p>
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