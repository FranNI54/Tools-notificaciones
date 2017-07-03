<?php echo validation_errors(); ?>
<?php if(isset($error)){ ?>
<p style="color:red;"><?php echo $error; ?></p>
<?php } ?>

<?php echo form_open('marquesina/create'); ?>
<?php include("_form.php"); ?>
<button>Crear</button> <button type="button" class="cancelar" href="<?php echo base_url(); ?>marquesina/admin">Cancelar</button>
</form>