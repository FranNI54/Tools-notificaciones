<?php echo validation_errors(); ?>

<?php echo form_open('grupo/create'); ?>
<?php include("_form.php"); ?>
<button>Crear</button> <button type="button" class="cancelar" href="<?php echo base_url(); ?>grupo/admin">Cancelar</button>
</form>