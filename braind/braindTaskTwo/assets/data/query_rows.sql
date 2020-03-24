SELECT
  prod.id,
  prod.title,
  value1.value AS color,
  value3.value AS size
FROM
  product AS prod
  INNER JOIN
  product_prop AS value1 ON
                         prod.id = value1.product_id AND
                         value1.property_id = (SELECT id
                                             FROM property
                                             WHERE title = "Цвет") AND
                         value1.value = "Зеленый"
  INNER JOIN
  product_prop AS val2 ON
                         prod.id = val2.product_id AND
                         val2.property_id = (SELECT id
                                             FROM property
                                             WHERE title = "Новинка") AND
                         val2.value = 1
  INNER JOIN
  product_prop AS value3 ON
                         prod.id = value3.product_id AND
                         value3.property_id = (SELECT id
                                             FROM property
                                             WHERE title = "Размер")
ORDER BY prod.id