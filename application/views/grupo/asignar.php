
<h3><strong>Grupo:</strong> <?php echo $grupo["nombre"]; ?></h3>
<div id="botones-filtro">
<button onclick="Marcar();" >Marcar filtrados</button> <button onclick="DesMarcar();">Desmarcar filtrados</button>
</div>
<div id="estado"></div>
<div id="table-container">
<table id="table" style="width:100%;">
<thead> <tr>
			
			<th style="min-width:50px;">Número de cliente</th>
            <th style="min-width:100px;">Nombre</th>
            <th style="min-width:100px;">Tipo</th>

        </tr>
	</thead>
<tbody>
<?php 
foreach($clientes as $cliente){ 
	
	if(!in_array($cliente["CUST_NO"],$asignados)){
		array_push($asignados,$cliente["CUST_NO"]);
	?>
	
	
	
	<tr>
	
	<td><?php echo $cliente['CUST_NO']; ?> </td>
	<td><?php echo $cliente['CUST_NAME']; ?> </td>
	<td><?php echo $cliente['CUST_TYPE_DESCR']; ?> </td>
	
	
	</tr>
	<?php
	}else{
		?><?php 
	}
}

?>
</tbody>
</table>
</div>
<button type="button" onclick="Agregar();" id="agregar-btn">Agregar</button>
<script>
var table;
$(document).ready(function(){
    table=$('#table').DataTable({
    columnDefs: [
        { targets: [0, 1,2], visible: true},
       
    ]
} );
	$("[type='search']").attr("placeholder","Búsqueda");
	table.on('search.dt', function() {

    
	
	}); 
   $('table tbody').on( 'click', 'tr', function () {
	   console.log("click")
        $(this).toggleClass('active');
        $(this).find('active').removeClass("active");
    } );
 	
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

function Marcar(){

 var auxFilter=table.rows( { filter : 'applied'} ).data();
 var indexes=table.rows( { filter : 'applied'} ).indexes();
	
	$.each(auxFilter,function(index){
		console.log(table.row( indexes[index]).node());
		$(table.row( indexes[index]).node()).addClass("active");
		
	});
	console.log(auxFilter);
}

function DesMarcar(){
var auxFilter=table.rows( { filter : 'applied'} ).data();
 var indexes=table.rows( { filter : 'applied'} ).indexes();
	
	$.each(auxFilter,function(index){
		$(table.row( indexes[index]).node()).removeClass("active");
	});
	console.log(auxFilter);
}

function Agregar(){
	$("#botones-filtro").hide();
	$("#agregar-btn").hide();
	var seleccionadas=table.rows('.active').data();
	var idsSeleccionados=new Array();
	$(seleccionadas).each(function(){
		idsSeleccionados.push(this[0]);
	});
	$("#estado").html("<p>Cargando clientes...</p>");
	$("#table-container").hide();
	$.post('<?php echo base_url(); ?>grupo/asignarClientes/<?php echo $grupo["id"]; ?>',{json:JSON.stringify(idsSeleccionados),'<?php echo $this->security->get_csrf_token_name(); ?>' : '<?php echo $this->security->get_csrf_hash(); ?>'},function(response,data){
			$("#estado").html("<p style='color:green;'>Clientes asignados</p>");
			setTimeout(function(){ 
			window.location.assign('<?php echo base_url(); ?>grupo/view/<?php echo $grupo["id"]; ?>');
			},3000);
	});
	
}


</script>

<style>
.active{background-color:green;}
tbody td{cursor:pointer;}
</style>