<?php 

require("db.php"); // подключаюсь к БД

	$city = $_POST['city']; // получаем POST 

	//проверка символов в POST запросе, чтобы не добавлялись пустые

		if (!empty($city)) { 

		$query = "INSERT INTO `city` SET title = '$city'";
	  	mysqli_query($connect, $query);
	    
		}

		header("Location: index.php"); // редирект на главную

 ?>