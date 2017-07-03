<?php echo validation_errors(); ?>

<?php echo form_open('notificacion/update/'.$notificacion["id"]); ?>
<?php include("_form.php"); ?>

<button>Guardar</button> <button type="button" class="cancelar" href="<?php echo base_url(); ?>notificacion/admin">Cancelar</button>
</form>