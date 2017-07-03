<?php echo validation_errors(); ?>

<?php echo form_open('notificacion/create'); ?>
<?php include("_form.php"); ?>
<button>Crear</button> <button type="button" class="cancelar" href="<?php echo base_url(); ?>grupo/view/<?php echo $notificacion['grupo']; ?>#mensajes">Cancelar</button>
</form>