<?php

	$connect = mysqli_connect('localhost', 'root', '', 'braind_city');

		if (mysqli_connect_errno()) {
			echo "Ошибка подключения к базе данных. Код ошибки - ", mysqli_connect_errno(), mysqli_connect_error();
			exit();
		}

 ?>