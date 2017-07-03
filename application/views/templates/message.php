<br>
<br>
<h4 style="word-break:break-word;"><?php if(isset($message)){echo $message;} ?></h4>
<?php if($this->auth_level==9){ ?>
<?php if(isset($debug)){ ?>
<hr>
<hr>
<h4>Debug</h4>
<p><?php echo $debug; ?></p>

<?php } ?>
<?php } ?>