<p><strong>Username: </strong><?php if(isset($user["username"])){echo $user["username"];} ?></p>
<p><strong>Email: </strong><?php if(isset($user["email"])){echo $user["email"];} ?></p>
<p><strong>Rol: </strong><?php if(isset($user["auth_level"])){
if($user["auth_level"]==1){
	echo "Usuario";
}else if($user["auth_level"]==9){
	echo "Admin";
}
}?></p>

<a href="<?php echo base_url(array("user","update",$user['user_id'])); ?>">Editar</a>