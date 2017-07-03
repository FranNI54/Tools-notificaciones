<?php
#API access key from Google API's Console
    define( 'API_ACCESS_KEY', 'AIzaSyAwhRVO9O-Ck5_Ks3VEg2OLVbowVD7j-Aw' );
    //$registrationIds = $_GET['id'];
#prep the bundle
if(isset($_GET["msg"])){
$msg= $_GET["msg"];
}else{
	$msg="Hola";
}

     $msg = array
          (
		/*'body' 	=> 'Notificación loca',*/
		'title'	=> $msg,
		"sound" => "default"
          );
	$fields = array
			(
				'to'		=> "/topics/makro-campana-de-prueba-1",
				'notification'	=> $msg
			);
	
	
	$headers = array
			(
				'Authorization: key=' . API_ACCESS_KEY,
				'Content-Type: application/json'
			);
#Send Reponse To FireBase Server	
		$ch = curl_init();
		curl_setopt( $ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send' );
		curl_setopt( $ch,CURLOPT_POST, true );
		curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
		curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
		curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
		curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
		$result = curl_exec($ch );
		curl_close( $ch );
#Echo Result Of FireBase Server
echo $result;