<?php echo validation_errors(); ?>

<?php echo form_open('marquesina/update/'.$marquesina["id"]); ?>
<?php include("_form.php"); ?>
<div class="form-group">
		<label for="estado">Estado</label>
		<select class="form-control" name="estado">			
			<option value="0" <?php if(isset($marquesina['estado'])&&$marquesina['estado']==0){?>selected<?php } ?>>Activada</option>
			<option value="1" <?php if(isset($marquesina['estado'])&&$marquesina['estado']==1){?>selected<?php } ?>>Desactivada</option>
			
		</select>
	</div>
<button>Guardar</button> <button type="button" class="cancelar" href="<?php echo base_url(); ?>marquesina/admin">Cancelar</button>
</form>