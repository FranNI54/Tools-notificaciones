<?php echo validation_errors(); ?>

<?php echo form_open('grupo/update/'.$grupo["id"]); ?>
<?php include("_form.php"); ?>

<button>Guardar</button> <button type="button" class="cancelar" href="<?php echo base_url(); ?>grupo/admin">Cancelar</button>
</form>