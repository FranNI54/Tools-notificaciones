<?php if(isset($fecha)&&$fecha==1){ ?>
<p ><?php echo  "La fecha de envío es demasiado reciente. Programe un envio a una hora y día mayores al actual. "?></p>
<?php } ?>
<?php if(isset($link)&&$link==1){ ?>
<p ><?php echo  "El link ingresado no es una url válida."; ?></p>
<?php } ?>
<h3></h3>
	<div class="form-group">
		<label for="fecha">Fecha de envío</label>
		<div class="input-group date form_date col-md-6" data-date="<?php echo date('d/m/Y H:i', time()) ?>" data-date-format="dd/mm/yyyy hh:ii" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd hh:ii">
			<input class="form-control" placeholder="Elegí Fecha" size="16" type="text" value="<?php if(isset($notificacion['fecha'])) {echo date('d/m/Y H:i', strtotime($notificacion['fecha'])); }?>" readonly >
			<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
		</div>
		<input type="hidden" id="dtp_input2" value="<?php if(isset($notificacion['fecha'])) {echo $notificacion['fecha']; }?>"  name="fecha" />
		<script>
			jQuery('.form_date').datetimepicker({
			language:  'ar',
			weekStart: 0,
			todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 0,
			forceParse: 0
			});
		</script>
    </div>
	
	<input type="hidden" name='grupo'  value="<?php if(isset($notificacion['grupo'])){echo $notificacion['grupo'];} ?>" />
  <input type="hidden" name='destinatario'  value="<?php if(isset($notificacion['destinatario'])){echo $notificacion['destinatario'];} ?>" />

	<div class="form-group">
		<label for="destinatario">Destinatario</label>
		<input class="form-control" disabled  value="<?php if(isset($destinatario)){echo $destinatario;} ?>"/>
	</div>
	
	<div class="form-group">
		<label for="titulo">Titulo</label>
		<input class="form-control" name="titulo" value="<?php if(isset($notificacion['titulo'])){echo $notificacion['titulo'];} ?>"/>
	</div>
	
	<div class="form-group">
		<label for="texto">Texto</label>
		<textarea class="form-control" name="texto"><?php if(isset($notificacion['texto'])){echo $notificacion['texto'];} ?></textarea>
	</div>
	<?php if(false){ ?>
	<div class="form-group">
		<label for="params">Params</label>
		<textarea class="form-control" name="params"><?php if(isset($notificacion['params'])){echo $notificacion['params'];} ?></textarea>
	</div>
	<?php } ?>
	
	<div class="form-group">
		<label for="link">Link</label>
		<input class="form-control" name="link" value="<?php if(isset($notificacion['link'])){echo $notificacion['link'];} ?>"/>
	</div>