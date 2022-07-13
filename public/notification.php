<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfect Registration - Notification</title>
</head>
<body>
    <form method="post" action="notification.php">
Title<input type="text" name="title">
Message<input type="text" name="message">
<input type="submit" value="Send notification">
<a href="/admin">aa</a>
</form>
</body>
</html>


<?php 
// Server key from Firebase Console define( 'API_ACCESS_KEY', 'AAAA----FE6F' );

function sendNotification(){

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
    "title" => $_REQUEST['title'], 
    "body" => $_REQUEST['message'], 
    "click_action" => "https://127.0.0.1:8000"));

$data_string = json_encode($data);



$headers = array ( 
    'Authorization: key=AAAAc1UNWVA:APA91bEA_G-AJE6G_nEJCZXshBSsxDmjC5ovw_G6Ro9B5ZG0GHTtswejW94KcekRtTqypBnd1LK4eMHkVRrRIEFSrNJ0mL6Gr9ZxBeRkefk4IcImxtDJHkZs44ImvS8Ig54NCAsWAwV6', 
    'Content-Type: application/json' );
	
$ch = curl_init(); 
curl_setopt( $ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send' );
curl_setopt( $ch,CURLOPT_POST, true );
curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
curl_setopt( $ch,CURLOPT_POSTFIELDS, $data_string);
 curl_exec($ch);

// echo $result;
curl_close ($ch);

}
@sendNotification();
