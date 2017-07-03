<?php echo validation_errors(); ?>

<?php echo form_open('cliente/update/'.$cliente["CUST_NO"]); ?>
<?php include("_form.php"); ?>

<button>Guardar</button> <button type="button" class="cancelar" href="<?php echo base_url(); ?>cliente/admin">Cancelar</button>
</form>