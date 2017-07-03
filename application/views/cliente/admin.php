
<table id="table" style="width:100%;">
<thead> <tr>
			<th style="min-width:50px;">Numero de cliente</th>
            <th style="min-width:100px;">Nombre</th>
            <th style="min-width:100px;">Tipo</th>
			<?php if(!isset($noButtons)){ ?> 
            <th style="min-width:70px;"></th>
			<?php } ?>
        </tr>
	</thead>
<tbody>
<?php 
$numbers=array();
foreach($clientes as $cliente){ 
	if(in_array($cliente["CUST_NO"],$numbers)){
		continue;
	}else{
		array_push($numbers,$cliente["CUST_NO"]);
	}
?>
	
	
	<tr>
	<td><?php echo $cliente['CUST_NO']; ?> </td>
	<td><?php echo $cliente['CUST_NAME']; ?> </td>
	<td><?php echo $cliente["CUST_TYPE_DESCR"] ?> </td>
	<?php if(!isset($noButtons)){ ?> 
	<td class='btn-tablas'>
		<a href='<?php echo base_url(array("cliente","view",$cliente['CUST_NO'])); ?>'><span class='glyphicon glyphicon-pencil'></span></a>
		<?php if(false){ ?><p class='delete' href='<?php echo base_url(array("cliente",'delete',$cliente['CUST_NO'])); ?>'><span class='glyphicon glyphicon-trash'></span> </p><?php } ?>
	</td></tr>
	<?php
	}
}

?>
</tbody>
</table>

<script>
var table;
$(document).ready(function(){
    table=$('#table').DataTable({"columnDefs": [ {
		<?php if(!isset($noButtons)){ ?>
"targets": 3,
"orderable": false
		<?php }else{ ?>
			
"targets": [0,1,2],
"orderable": true
		<?php }	?>
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