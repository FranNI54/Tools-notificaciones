<h4><strong>Fecha de inicio:</strong> <?php if(isset($marquesina['inicio'])) {echo date('d/m/Y H:i', strtotime($marquesina['inicio'])); }; 
?></h4>
<h5><strong>Categoria:</strong> <?php echo $marquesina["categoria_nombre"];  ?></h5>
<?php if(isset($marquesina["nombre"])&&$marquesina["nombre"]!=""){ ?>
<h5><strong>Nombre:</strong> <?php echo $marquesina["nombre"];  ?></h5>
<?php } ?>
<?php if($marquesina["estado"]==1){ ?>
<h5 style="color:red;">Marquesina desactivada</h5>
<?php } ?>

<a href="<?php echo base_url(array("marquesina","update",$marquesina['id'])); ?>">Editar Datos</a><br><br>



<form id="uploader" action="<?php echo site_url(array('marquesina','upload')); ?>" style="width:90%;" class="dropzone"></form>
<br>
<button id="reordenar" type="button">Reordenar elementos</button>
<p id="indicaciones" style="display:none;">Arrastre los elementos al orden deseado</p>
<button id="save" style="display:none;margin-bottom:10px;" type="button">Guardar Orden</button>

<h3 id="saving" style="display:none;">Guardando...</h3>
<div id="imagenesMarquesina" style="opacity:0;">
<?php 
$lastOrden=0;
foreach($marquesina["imagenes"] as $imagen){ ?>
<div class="preview" imageId='<?php echo $imagen['id']; ?>' orden='<?php echo $imagen['orden']; ?>'>
	<div class="dz-image">
		<img src="<?php echo base_url().'uploads/'.$imagen['marquesina'].'/'.$imagen['id'].$imagen['formato']; ?>" />
	</div><br>
	<div class="delete" >Borrar</div>
</div>
<?php $lastOrden=$imagen["orden"]; } ?>
</div>


<script>
var lastOrden=<?php echo ++$lastOrden; ?>;
var uploading=false;
Dropzone.options.uploader = {
  addRemoveLinks: true,
  init: function() {
	this.on("sending", function(file, xhr, formData){
						try{
						$("#imagenesMarquesina").sortable( "disable" );
						}catch(error){}
						uploading=true;
						$("#reordenar").hide();
						$("#indicaciones").hide();
						$("#save").hide();
                        formData.append("marquesina", "<?php echo $marquesina['id']; ?>");
                        formData.append('<?php echo $this->security->get_csrf_token_name(); ?>' , '<?php echo $this->security->get_csrf_hash(); ?>');
                        formData.append("orden", lastOrden);
						lastOrden++;


                });
	this.on("success", function(file,response,event){
		console.log(response);
		response=JSON.parse(response);
		$("#imagenesMarquesina").append("<div class='preview' imageId='"+response.id+"' orden='"+response.orden+"' >"+file.previewElement.innerHTML+"<br><div class='delete' >Borrar</div></div>");

		AddTimer();
	});
	
	 this.on("complete", function (file) {
      if (this.getUploadingFiles().length === 0 && this.getQueuedFiles().length === 0) {
        console.log("queue terminado");
		uploading=false;
		$("#reordenar").show();
		$("#indicaciones").hide();
		
      }
    });
	
  }

  

};

 $( function() {
  
  } );

function AddTimer(){
	$(".dz-success").each(function(){
		
		if($(this).attr("timer")==null){
			$(this).attr("timer",4);
		}
	});
}

setInterval(function(){CheckCompletes();},1000);

function CheckCompletes(){
	$(".dz-success").each(function(){
		
		if($(this).attr("timer")==null){
			$(this).attr("timer",4);
		}else{
			$(this).attr("timer",$(this).attr('timer')-1);
		}
		if($(this).attr("timer")==0){
			$(this).remove();
		}
	});
}

$("body").on("click","#reordenar",function(){
	if(!uploading){
		$(".delete").hide();
	  $( "#imagenesMarquesina" ).sortable();
	   $( "#imagenesMarquesina" ).sortable( "option", "disabled", false );
		$( "#imagenesMarquesina" ).disableSelection();
		$("#uploader").hide();
		$("#save").show();
		$("#reordenar").hide();
		$("#indicaciones").show();
	}
});

$("body").on("click",".delete",function(){
	var auxId=$(this).parent().attr('imageId');
	var auxParent= $(this).parent();
	$(auxParent).css("opacity",0.5);
	$(auxParent).append("<div class='deleting'>Borrando...</div>")
	$(this).hide();
	$.post('<?php echo base_url(); ?>marquesina/deleteImagen/'+auxId,{'<?php echo $this->security->get_csrf_token_name(); ?>' : '<?php echo $this->security->get_csrf_hash(); ?>'},function(){
		$(auxParent).remove();
	});
});

$("body").on("click","#save",function(){
	var auxOrden=1;
	var auxIds= {};
	$("#imagenesMarquesina > .preview").each(function(){
		//console.log($(this).attr("imageId"));
		$(this).attr("orden",auxOrden);
		auxIds[$(this).attr("imageId")]=auxOrden;
		auxOrden++;
	});
	var auxJson={marquesina:<?php echo $marquesina["id"]; ?>};
	auxJson["ids"]= auxIds;
	$("#imagenesMarquesina").sortable( "disable" );
	$("#save").hide();
	$("#saving").show();
	
	$.post('<?php echo base_url(); ?>marquesina/orden',{json:JSON.stringify(auxJson),'<?php echo $this->security->get_csrf_token_name(); ?>' : '<?php echo $this->security->get_csrf_hash(); ?>'},function(response,data){
		$("#saving").hide();
		console.log(response);
		$("#reordenar").show();
		$("#indicaciones").hide();
		
		$("#uploader").show();
		$(".delete").show();
	});
	  
	  
});

$(document).ready(function(){
	$("#imagenesMarquesina").css("opacity","1");
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