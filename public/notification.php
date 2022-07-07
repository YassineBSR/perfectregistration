<?php 
// Server key from Firebase Console define( 'API_ACCESS_KEY', 'AAAA----FE6F' );
require 'DbConnect.php';
	$db = new DbConnect;
	$conn = $db->connect();
	$stmt = $conn->prepare('SELECT * FROM tokens');
	$stmt->execute();
	$tokens = $stmt->fetchAll(PDO::FETCH_ASSOC);

	foreach ($tokens as $token) {
		$registrationIds[] = $token['token'];
	}


$data = array(
    "registration_ids" => $registrationIds, 
    "notification" => array( 
        "title" => "Perfect Registration", 
        "body" => "Une notification", 
        "click_action" => "https://127.0.0.1:8000"));
$data_string = json_encode($data);
echo "The Json Data : ".$data_string;
$headers = array ( 
    'Authorization: key=AAAAc1UNWVA:APA91bEA_G-AJE6G_nEJCZXshBSsxDmjC5ovw_G6Ro9B5ZG0GHTtswejW94KcekRtTqypBnd1LK4eMHkVRrRIEFSrNJ0mL6Gr9ZxBeRkefk4IcImxtDJHkZs44ImvS8Ig54NCAsWAwV6', 
    'Content-Type: application/json' );
$ch = curl_init(); curl_setopt( $ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send' );
curl_setopt( $ch,CURLOPT_POST, true );
curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
curl_setopt( $ch,CURLOPT_POSTFIELDS, $data_string);

$result = curl_exec($ch);
curl_close ($ch);

?>