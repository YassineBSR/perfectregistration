<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfect Registration - Notification</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <style>
@import url('https://fonts.googleapis.com/css2?family=Pacifico&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Arvo:wght@400;700&display=swap');
        * {
            font-family: 'Montserrat', sans-serif;
        }

        body {
            background: linear-gradient(90deg, rgba(238, 174, 202, 1) 0%, rgba(148, 187, 233, 1) 100%);;
        }
        .title{
    font-family: 'Pacifico', cursive !important; 
   
    background-clip: text;
    color: transparent;
    background: linear-gradient(90deg, rgba(238,174,202,1) 0%, rgba(148,187,233,1) 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    font-size: xx-large;
    
}

.card{
    border-radius: 20px;
}
</style>
</head>

<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-white shadow p-3 mb-5 ">
            <div class="container-fluid">
                <h2><a class="navbar-brand title" href="/">Perfect Registration</a></h2>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse flex-row-reverse" id="navbarNavAltMarkup">
                    <nav class="navbar-nav">
                        <a class="nav-link" href="/">Home</a>
                        <a class="nav-link" href="/admin">Retour panneau admin</a>
                    </nav>
                </div>
            </div>
        </nav>
    </header>
    <div class="container card mb-3 shadow" >
        <h1>Envoie de notification</h1>
        <form method="post" action="notification.php">
        <div class="form mb-3 mt-3">
                <label for="title" class="form-label">Titre</label>
                <input type="text" class="form-control" name="title">
            </div>
            <div class="form mb-3">
                <label for="message" class="form-label">Message</label>
                <input type="text" class="form-control" name="message">
            </div>
            <div class="form mb-3">
                <label for="link" class="form-label">Lien</label>
                <input type="text" class="form-control" name="link">
            </div> 
            <div class="d-grid gap-2 col-6 mx-auto mt-3 mb-3">
                <button type="submit" class="btn btn-primary">Envoyer</button>  
            </div>
        </form>
    </div>
</body>
</html>


<?php 

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
    "click_action" => $_REQUEST['link']));

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