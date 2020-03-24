SELECT COUNT(prod.id)
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
  product_prop AS value2 ON
                         prod.id = value2.product_id AND
                         value2.property_id = (SELECT id
                                             FROM property
                                             WHERE title = "Новинка") AND
                         value2.value = 1