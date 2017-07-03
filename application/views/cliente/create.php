<?php echo validation_errors(); ?>

<?php echo form_open('cliente/create'); ?>
<?php include("_form.php"); ?>
<button>Crear</button> <button type="button" class="cancelar" href="<?php echo base_url(); ?>cliente/admin">Cancelar</button>
</form>