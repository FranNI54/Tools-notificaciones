<?php

#API access key from Google API's Console
    define( 'API_ACCESS_KEY', 'AIzaSyAwhRVO9O-Ck5_Ks3VEg2OLVbowVD7j-Aw' );
    
#prep the bundle


    if(false){
	$fields = array
			(
				
				   "operation"=> "create",
				   //nombre de grupo colapsado y limpiado
				   "notification_key_name"=> "poyo2",
				   //aqui va el hash del user
				   "registration_ids"=> ["dXWf54G7oz0:APA91bEdFDuorL9uAc9m3JfC8TSlljTW3V25CM1lQZjboGi_4bOoKOUBg-eZFV-zV3HI4TX9Ch-NGI7dV_LC1frDqF3ZzmcTD6HebED3CuoATEPHqboucD3PXF8pyEwjir729N3_rR1W"]
				
			);
	}			
	if(true){
	$fields = array
			(
				
				   "operation"=> "add",
				   //nombre de grupo colapsado y limpiado
				   "notification_key_name"=> "grupoPrueba1",
				   "notification_key"=> "APA91bE8rDLbb14r72qwamMg6kdGxl4ZjasafjPLvIxlSX9nV5YOcjuRleUhf0Y5OyuA4PYYoZz2V2caBWxQtuEPoWvGGIn4fUkML_ri-tlpkdVObEgvA74",
				   //aqui va el hash del user
				   "registration_ids"=> ["dXWf54G7oz0:APA91bEdFDuorL9uAc9m3JfC8TSlljTW3V25CM1lQZjboGi_4bOoKOUBg-eZFV-zV3HI4TX9Ch-NGI7dV_LC1frDqF3ZzmcTD6HebED3CuoATEPHqboucD3PXF8pyEwjir729N3_rR1W"]
				
			);
	}
	if(false){
	$fields = array
			(
				
				   "operation"=> "remove",
				   //nombre de grupo colapsado y limpiado
				   "notification_key_name"=> "grupoPrueba1",
				   "notification_key"=> "APA91bG7IK5nz9bIt8awJehAXlQPO5EGqv2KyPWHK-IVNJHsjXRWgt6DqNHUPzNVXGehW0DTx3DouL3ftaxVMCOKnT8zwBA8nTYouwE7bLasvPF0G4zGOGw",
				   //aqui va el hash del user
				   "registration_ids"=> ["cik0W9HbPqM:APA91bEWdhBLBsaboCm5MAqmAlqQ5bCuEcbRE6SMTLnY23F_tS4N_8orHmDkjbuja9tbdkab6satwhKg8onW0NSxqG0Xbv52Ffix3psn5iDzbmgVU03AvFVXoHZG2Ax2nja15z5w6yit"]
				
			);
	}		
	//response de crear grupo de prueba creado, lo qu debería esperar y parsear el model al crear el grupo. json_decode($response)["notification_key"];
	//deberia de chequear que su largo sea mayor a 100, en cuyo caso devuelve error.
	//{"notification_key":"APA91bFMSI3-sXYEVwHBpPw8p-IXUH3HzUtw229njFN652itiaZDC5jXhs8uuQReF0gbxhSt8fgmmtOj2aJt2Fi2kgh6utUbM5kw8gm0XoGccB2SLkLTt0Q"}
	
	//al agregar parece que devuelve nuevamente la key?
	
	$headers = array
			(
				'Authorization: key=' . API_ACCESS_KEY,
				'Content-Type: application/json',
				"project_id: 609592838656"
			);
#Send Reponse To FireBase Server	
		$ch = curl_init();
		curl_setopt( $ch,CURLOPT_URL, 'https://android.googleapis.com/gcm/notification' );
		curl_setopt( $ch,CURLOPT_POST, true );
		curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
		curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
		curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
		curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
		$result = curl_exec($ch );
		curl_close( $ch );
#Echo Result Of FireBase Server
echo $result;