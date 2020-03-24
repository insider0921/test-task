<?php 

require("db.php"); // подключил файл для БД

	$query = 'SELECT * FROM `city`'; // запрос к таблице
	$city = mysqli_query($connect, $query);

?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Города</title>
	<link rel="stylesheet" href="assets/style.css">
</head>
<body>
	
	<form action="add.php" method="POST">

		<input type="text" placeholder="Введите название города" name="city" required>
		<button type="submit">Добавить</button>

	</form>

	<h2>Все города</h2>

		<?php while ($town = mysqli_fetch_assoc($city)): ?>

			<p><?php echo $town['title']."<br>"; ?></p>

		<?php endwhile; ?>
		
</body>
</html>

