<?php echo validation_errors(); ?>

<?php echo form_open('user/create'); ?>
	<div class="form-group">
		<label for="username">Nombre de usuario</label>
		<textarea class="form-control" type="text" name="username" autocomplete="off"  style="resize:none;height:34px;" /><?php if(isset($user["username"])){ echo $user['username']; } ?></textarea>
	</div>
	<div class="form-group">
		<label for="passwd">Password</label>
		<input id="pass" class="form-control" type="password" autocomplete="new-password" name="passwd" value="" />
	</div>
	<div class="form-group">
		<label for="email">Email</label>
		<input class="form-control" name="email" value="<?php if(isset($user["email"])){ echo $user['email']; } ?>" />
	</div>
	<div class="form-group">
		<label for="auth_level">Rol</label>
		<select class="form-control" name="auth_level">
			<option disabled selected>Seleccione rol</option>
			<option value="1" <?php if(isset($user["auth_level"])&&$user["auth_level"]==1){?> selected <?php } ?> >Usuario Básico</option>
			<option value="9" <?php if(isset($user["auth_level"])&&$user["auth_level"]==9){?> selected <?php } ?> >Admin</option>
		</select>
	</div>
	

	
	<button>Crear</button> <button type="button" class="cancelar" href="<?php echo base_url(); ?>user/admin">Cancelar</button>
</form>