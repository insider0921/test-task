-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 24 2020 г., 03:27
-- Версия сервера: 10.3.13-MariaDB-log
-- Версия PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `braind_two`
--

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `title`, `category`, `price`) VALUES
(1, 'Велосипед', 'Транспорт', 15000),
(2, 'Чайник', 'Посуда', 2000),
(3, 'Монитор', 'Техника', 3000),
(4, 'Кастрюля', 'Посуда', 600),
(5, 'Самокат', 'Транспорт', 4200),
(6, 'Гироскутер', 'Транспорт', 2000),
(7, 'Клавиатура', 'Техника', 1300),
(8, 'Кружка', 'Посуда', 500),
(9, 'Сковорода', 'Посуда', 850),
(10, 'Системный блок', 'Техника', 60000);

-- --------------------------------------------------------

--
-- Структура таблицы `product_prop`
--

CREATE TABLE `product_prop` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_prop`
--

INSERT INTO `product_prop` (`id`, `product_id`, `property_id`, `value`) VALUES
(1, 1, 3, '1'),
(2, 2, 3, '1'),
(3, 4, 3, '1'),
(4, 3, 3, '1'),
(5, 5, 3, '1'),
(6, 6, 3, '1'),
(7, 7, 3, '1'),
(8, 8, 3, '1'),
(9, 1, 1, 'Зеленый'),
(10, 4, 1, 'Зеленый'),
(11, 5, 1, 'Зеленый'),
(12, 6, 1, 'Зеленый'),
(13, 7, 1, 'Зеленый'),
(14, 8, 1, 'Зеленый'),
(15, 9, 1, 'Зеленый'),
(16, 10, 1, 'Зеленый'),
(19, 1, 1, 'Красный'),
(20, 2, 1, 'Белый'),
(21, 1, 2, 'Большой'),
(22, 2, 2, 'Маленький'),
(23, 3, 2, 'Средний'),
(24, 4, 2, 'Маленький'),
(25, 5, 2, 'Большой'),
(26, 6, 2, 'Большой'),
(27, 7, 2, 'Средний'),
(28, 8, 2, 'Маленький'),
(29, 9, 2, 'Средний'),
(30, 10, 2, 'Большой');

-- --------------------------------------------------------

--
-- Структура таблицы `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `property`
--

INSERT INTO `property` (`id`, `title`) VALUES
(1, 'Цвет'),
(2, 'Размер'),
(3, 'Новинка');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_prop`
--
ALTER TABLE `product_prop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `property_id` (`property_id`);

--
-- Индексы таблицы `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `product_prop`
--
ALTER TABLE `product_prop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `product_prop`
--
ALTER TABLE `product_prop`
  ADD CONSTRAINT `product_prop_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_prop_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
