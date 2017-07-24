
<p>Formato de archivo valido: csv.</p>

<form id="uploader" action="<?php echo site_url(array('cliente','parse')); ?>" style="width:90%;display:none;" class="dropzone"></form>
<button type="button" onclick="$('#uploader').click();">Seleccionar archivo</button>
<br>



<form id="formErrores" name="myform" action="<?php echo base_url(array("cliente","exportTable")); ?>" method="post" target="_blank" style="display:none;">

  <input type="hidden" name='<?php echo $this->security->get_csrf_token_name(); ?>'  value="<?php echo $this->security->get_csrf_hash(); ?>" />
  <input type="hidden" name='table' id="tablaErrores"  value='' />
  <button style="color:white;">Exportar Errores</button>
</form>


<div id="grupo-container" style="display:none;" class="form-group">
<h3 id="asignar-label">Asignar a un grupo</h3>
<select class="form-control" name="grupo" id="grupo" style="max-width:300px;">
<option value="0">No asignar</option>
<?php foreach($grupos as $grupo){ ?>
<option value="<?php echo $grupo['id'] ?>"><?php echo $grupo["nombre"] ?></option>
<?php } ?>
</select>
</div>
<div id="table-container">
	
</div>



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
		$("#table-container").append("<button type='button' class='save'>Cargar Usuarios</button>");
		$("table").attr("id","table");
		table=$('table').DataTable({"columnDefs": [ {

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
		$("#tablaErrores").val(response["error"]);
		$("#formErrores").show();

		$("#grupo-container").show();
			
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
	$("#asignar-label").css("color","initial");
	$("#grupo-container").hide();
	$("#table-container").html("<p>Enviando...</p>");
	$.post('<?php echo base_url(); ?>cliente/upload',{json:JSON.stringify(successTable),'<?php echo $this->security->get_csrf_token_name(); ?>' : '<?php echo $this->security->get_csrf_hash(); ?>',grupo:$("#grupo").val()},function(response,data){
		if(response!=""){
			$("#table-container").html(response);
		}else{
			$("#table-container").html("<p style='color:green;'>Cargados con éxito</p>");
		}
	});
});

</Script>



<style>
#imagenesMarquesina .preview > div,#imagenesMarquesina .preview > .dz-remove{display:none;}
#imagenesMarquesina .preview > .dz-image,#imagenesMarquesina .preview > .left-arrow,#imagenesMarquesina .preview > .right-arrow{display:inline-block;}
#imagenesMarquesina .preview{display:inline-block;padding:5px;}
#imagenesMarquesina .preview img{max-width:100px;}
#imagenesMarquesina .preview .deleting{color:red;display: block !important;}
#imagenesMarquesina .preview .delete{color:red;display: block;cursor:pointer;}
#indicaciones{border: 1px solid #c7c7c7;padding:5px;color:green;}
#imagenesMarquesina{transition:0.5s;}
#imagenesMarquesina .preview > .dz-image{max-width:100px;max-height:100px;overflow:hidden;}
</style>
<br><br>