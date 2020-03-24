<?php

define("COUNT_ON_PAGE", 3);

try {
    $message = "";

    $config = json_decode(file_get_contents("assets/data/config.json"), true);// Подключаемся к БД
    $mysqli = new Mysqli(
        $config['host'],
        $config['username'],
        $config['password'],
        $config['dbname']
    );

    
    // Считаем общее количество строк
    $query = file_get_contents("assets/data/query_count.sql");
    $result = $mysqli->query($query);
    $row_count = $result->fetch_row()[0];

    if ($row_count > 0) {
        $page_count = ceil($row_count / COUNT_ON_PAGE);// Всего сколько страниц
        $page = ($_GET['page']) ? $_GET['page'] : 1;//текущая страница        
        $start = ($page - 1) * COUNT_ON_PAGE;//первая запись

        // Запрос
        $query = file_get_contents("assets/data/query_rows.sql") . " LIMIT $start, " . COUNT_ON_PAGE;
        $result = $mysqli->query($query);
    } else {
        $message = "Нет записей";
    }

} catch (Exception $exept) {
    echo 'Исключение: ', $exept->getMessage(), "\n";
}

?>

<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Задание 2</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
<div class="container">
    <?php if ($message): ?>
        <p><?= $message; ?></p>
    <?php endif; ?>
    <ul>
        <li class="head">          
            <span>Название</span>
            <span>Размер</span>
            <span>Цвет</span>
        </li>
        <?php while ($product = $result->fetch_assoc()): ?>
            <li>
                <span><?= $product['title']; ?></span>
                <span><?= $product['size']; ?></span>
                <span><?= $product['color']; ?></span>
            </li>
        <?php endwhile; ?>
    </ul>
    <div class="pagination">
        <?php for ($i = 1; $i <= $page_count; $i++): ?>
            <a <?= ($i == $page) ? "class='active'" : ""; ?> href="index.php?page=<?= $i; ?>"><?= $i; ?></a>
        <?php endfor; ?>
    </div>
</div>
</body>
</html>
