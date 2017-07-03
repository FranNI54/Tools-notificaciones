<br>
<br>
<table id="table" style="width:100%;">
<thead> <tr>
			<th style="min-width:30px;">Fecha</th>
            <th style="min-width:30px;"></th>
			
        </tr>
	</thead>
<tbody>
<?php 
$numbers=array();
foreach($historial as $reporte){ 
	if($reporte!="."&&$reporte!=".."){
?>
	
	
	<tr>
	
	<td><?php echo str_replace(".csv",'',str_replace("reporte-","",$reporte)); ?> </td>
	
	<td class='btn-tablas'>
		<a download href='<?php echo base_url(); ?>/exports/<?php echo $reporte; ?>'><span class='glyphicon glyphicon-download-alt'></span></a>
	</td></tr>
	<?php
	
}}

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

<style>
#table thead th, #table2 thead th{border:none;}
</style>