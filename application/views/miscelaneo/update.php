<?php echo validation_errors(); ?>

<?php echo form_open('miscelaneo/'.strtolower($miscelaneo["tag"])); ?>
<?php include("_formUpdate.php"); ?>
</form>