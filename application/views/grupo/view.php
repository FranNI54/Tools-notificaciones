<h4><strong>Nombre:</strong> <?php echo $grupo["nombre"]; ?></h4>
<?php if(false){ ?>
<h4><strong>Keyname:</strong><?php echo $grupo["keyname"]; ?></h4>
<?php } ?>


<a href="<?php echo base_url(array("grupo","update",$grupo['id'])); ?>">Editar Datos</a><br><br>
<?php if(false){ ?><a href="<?php echo base_url(array("grupo","asignar",$grupo['id'])); ?>">Asignar clientes</a><br><br>
<a href="<?php echo base_url(array("grupo","notificaciones",$grupo['id'])); ?>">Notificaciones a este grupo</a><br><br><?php } ?>





<style>
.active{background-color:green;}
</style>

<ul class="tab-list">
<li class="tab-button button-active" tab="#clientes">Clientes</li><li class="tab-button" tab="#mensajes">Mensajes</li>
</ul>
<div class="tabs">
<div class="tab active-tab" id="clientes">


<button type="button"  onclick="ModalCarga();">Cargar Clientes</button>

<table id="table" style="width:100%;">
<thead> <tr>
			
			<th style="min-width:50px;">Número de cliente</th>
            <th style="min-width:100px;">Nombre</th>
            <th style="min-width:100px;">Tipo</th>
            <th style="min-width:70px;"></th>
        </tr>
	</thead>
<tbody>
<?php 
foreach($clientes as $cliente){ ?>
	
	<tr>
	
	<td><?php echo $cliente['CUST_NO']; ?> </td>
	<td><?php echo $cliente['CUST_NAME']; ?> </td>
	<td><?php echo $cliente['CUST_TYPE_DESCR']; ?> </td>
	
	<td class='btn-tablas'>
		<p class='delete' href='<?php echo base_url(array("grupo",'quitar',$cliente['rel'])); ?>'><span class='glyphicon glyphicon-trash'></span> </p>
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
	table.on('search.dt', function() {
    //number of filtered rows
    
	
	}); 
 
 	
});

jQuery(document).on('click','#table .delete',function() {
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
</div>
<div class="tab" id="mensajes">
<h3>Lista de Mensajes del grupo</h3>


<form name="myform" action="<?php echo base_url(array("notificacion","create")); ?>" method="post" >

  <input type="hidden" name='<?php echo $this->security->get_csrf_token_name(); ?>'  value="<?php echo $this->security->get_csrf_hash(); ?>" />
  <input type="hidden" name='grupo'  value="1" />
  <input type="hidden" name='destinatario'  value="<?php echo $grupo['id']; ?>" />
  <button style="color:white;">Nuevo</button>
</form>

<table id="table2" style="width:100%;">
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
		<a href='<?php echo base_url(array("notificacion","view",$notificacion['id'])); ?>'><span class='glyphicon glyphicon-search'></span></a>
		<?php if(false){ ?><p class='delete' href='<?php echo base_url(array("notificacion",'delete',$notificacion['id'])); ?>'><span class='glyphicon glyphicon-trash'></span> </p><?php } ?>
	</td></tr>
	<?php
}

?>
</tbody>
</table>

<script>
var table2;
$(document).ready(function(){
    table2=$('#table2').DataTable({"columnDefs": [ {
"targets": 3,
"orderable": false
} ]});
	$("[type='search']").attr("placeholder","Búsqueda");
});


</script>

</div>
</div>


<div id="carga-clientes" style="display:none;">
<div class="modal-clientes">
<p>Formato de archivo válido: csv.</p>

<form id="uploader" action="<?php echo site_url(array('cliente','parse')); ?>" style="width:90%;display:none;" class="dropzone"></form>
<button type="button" onclick="$('#uploader').click();"id="cargarClientes">Seleccionar archivo</button>
<br>







<input class="form-control" name="grupo" id="grupo" value="<?php echo $grupo['id'] ?>" type="hidden">

<div id="table-container">
	
</div>
<br>
<form id="formErrores" name="myform" action="<?php echo base_url(array("cliente","exportTable")); ?>" method="post" target="_blank" style="display:none;">

  <input type="hidden" name='<?php echo $this->security->get_csrf_token_name(); ?>'  value="<?php echo $this->security->get_csrf_hash(); ?>" />
  <input type="hidden" name='table' id="tablaErrores"  value='' />
  <button type='button' class='save' >Cargar Clientes</button>
  <button style="color:white;" class="error-button">Exportar Errores</button>
</form>


<button id="cancelar" type="button" onclick='$("#carga-clientes").hide();' >Cancelar</button>


<script>
var uploading=false;
var currentData="";
var errorTable="";
var successTable="";
Dropzone.options.uploader = {
  addRemoveLinks: true,
  acceptedFiles:".csv",
  init: function() {
	this.on("sending", function(file, xhr, formData){
						
						uploading=true;
						$("#table-container").html("<p>Cargando...</p>");
                        formData.append('<?php echo $this->security->get_csrf_token_name(); ?>' , '<?php echo $this->security->get_csrf_hash(); ?>');

                });
	this.on("success", function(file,response,event){
		console.log(response);
		
		response=JSON.parse(response);
		currentData=response["data"];
		$("#table-container").html("<h3>Preview</h3>");
		$("#table-container").append(response["table"]);
		$("table").attr("id","table");
		table=$('#table-containe table').DataTable({"columnDefs": [ {

"targets": [0,1,2],
"orderable": true
} ]});
		$("[type='search']").attr("placeholder","Búsqueda");
		if($("thead tr th:nth-child(1)").length>0){
			$("thead tr th:nth-child(1)").html("Numero cliente");
		}
		if($("thead tr th:nth-child(2)").length>0){
			$("thead tr th:nth-child(2)").html("Nombre");
		}
		
		if($("thead tr th:nth-child(3)").length>0){
			$("thead tr th:nth-child(3)").html("Suscripción");
		}
		errorTable=response["error"];
		successTable=response["success"];
		$("#tablaErrores").val(JSON.stringify(response["error"]));
		
			$("#formErrores").show();
		if(response["error"]!=""&&response["error"].length>0){
			$("#formErrores .error-button").show();
		}else{
			$("#formErrores .error-button").hide();
		}
		$("#formErrores .save").show();
		
		$("#formErrores").css("display","inline-block");
			
		$("#grupo-container").show();
		
		CenterToParent();
			
	});
	
	 this.on("complete", function (file) {
      if (this.getUploadingFiles().length === 0 && this.getQueuedFiles().length === 0) {
        
		uploading=false;
		
		
      }
    });
	
  }
};

$("body").on("click",".save",function(){
	if($("#grupo").val()==0){
		alert("Debe asignar un grupo.");
		$("#asignar-label").css("color","red");
		$(".main-content").scrollTop(0);
		return;
	}
	$("#cancelar").hide();
	$("#formErrores .save").hide();
	$("#asignar-label").css("color","initial");
	$("#grupo-container").hide();
	$("#table-container").html("<p>Enviando...</p>");
	CenterToParent();
	$.post('<?php echo base_url(); ?>cliente/upload',{json:JSON.stringify(successTable),'<?php echo $this->security->get_csrf_token_name(); ?>' : '<?php echo $this->security->get_csrf_hash(); ?>',grupo:$("#grupo").val()},function(response,data){
		if(response!=""){
			$("#table-container").html(response);
			CenterToParent();
		}else{
			$("#table-container").html("<p style='color:green;'>Cargados con éxito</p>");
			
			CenterToParent();
			setTimeout(function(){
				
				location.reload();
			},1500);
		}
	});
});

$(document).keyup(function(e) {
     if (e.keyCode == 27) { 
        $("#carga-clientes").hide();
    }
});

function ModalCarga(){
	$("#carga-clientes").show();
	$("#cancelar").show();
	CenterToParent();
}

function CenterToParent(){
	$(".modal-clientes").each(function(){
		$(this).css("margin-top",0);
		$(this).css("margin-bottom",0);
		
		
		var parent= $(this).parent();
		
		if($(this).outerHeight()>0){
			var paddingTop= ($(parent).innerHeight()/2)-($(this).outerHeight()/2);
			$(this).css("margin-top",paddingTop+"px");
		}
	});
}

$(document).ready(function(){
	if(window.location.hash&&window.location.hash=="#mensajes") {
	console.log("entra");
	
	$("[tab=#mensajes]").click();
}

});


</Script>
</div>
</div>

<style>
#carga-clientes{position:fixed;top:0px;left:0px;width:100%;height:100%;background-color:rgba(0,0,0,0.5);text-align:center;z-index:1000;}
#carga-clientes .modal-clientes{width:800px;background-color:white;padding:40px;text-align:center;display:inline-block;padding:20px;margin:40px;box-shadow:0px 0px 7px 0px rgba(0,0,0,0.5);border: 3px solid #df001d;}
.modal-clientes button{background-color:gray;}
#table-container table{display:inline-block;}
.modal-clientes #cargarClientes{background-color:#df001d;}
</style>

