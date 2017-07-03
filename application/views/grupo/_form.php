	<div class="form-group">
		<label for="nombre">Nombre</label>
		<input class="form-control" name="nombre" value="<?php if(isset($grupo['nombre'])){echo $grupo['nombre'];} ?>"/>
	</div>
	
	<?php if(isset($grupo['keyname'])){ ?>
	<?php if(false){ ?>
	<div class="form-group">
		<label for="keyname">Keyname</label>
		<input class="form-control" name="keyname" value="<?php echo $grupo['keyname']; ?>"/>
	</div>
	<?php } ?>
	<input type="hidden" class="form-control" name="keyname" value="<?php echo $grupo['keyname']; ?>"/>
	<?php } ?>
	
	
	
	