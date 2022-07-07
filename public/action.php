<?php 
	if(isset($_POST['token'])) {
		require 'DbConnect.php';
		$db = new DbConnect;
		$conn = $db->connect();
		$created_date = date('Y-m-d');
		$stmt = $conn->prepare('INSERT INTO tokens VALUES(null, :token, :created_date)');
		$stmt->bindParam(':token', $_POST['token']);
		$stmt->bindParam(':created_date', $created_date);
		if($stmt->execute()) {
			echo 'Token Saved..';
		} else {
			echo 'Failed to saved token..';
		}
	}

 ?>