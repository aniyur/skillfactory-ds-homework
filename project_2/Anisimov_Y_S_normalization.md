
# Описание нормализации

### В какой форме, почему 

Таблица "customer" уже находится в 3-й нормальной форме.
Таблица "transaction" не находится в 3-й нормальной форме
(хотя находится в 1й и 2й, поскольку все ячейки содержат скаляры, нет дублей строк,
ПК состоит из одной колонки, соответственно тут не может быть противоречий ни 1й ни 2й форме),
поскольку в ней присутствуют транзитивные функциональные
зависимости:
```
{transaction_id} -> {product_id, standard_cost, transaction_date}
{product_id, standard_cost, transaction_date} -> {brand, product_line, product_class, product_size}
{transaction_id} -> {brand, product_line, product_class, product_size}
```

Т.е. зависимость `{transaction_id} -> {brand, product_line, product_class, product_size}`
транзитивна.

### Пояснения

Здесь я исходил из предположения, что у нас тут есть товары,
определяемые множеством атрибутов `{brand, product_line, product_class, product_size}`,
по товару на конкретную дату определяется его стоимость `standard_cost` и
присваивается `product_id`, уникальный для этого же товара с этой же стоимостью на эту дату.
Затем такой товар продаётся в трансакциях. Отсюда вышеописанные рассуждения и структура.

В результирующей структуре таблица `transaction` для приведения к 3й 
нормальной форме декомпозирована на таблицы `transactions`, `offers`, `items`,
чем устранены транзитивные зависимости. Все *результирующие таблицы* находятся в *3й нормальной форме*.

Так, в таблицу `items` вынесены атрибуты `brand`, `product_line`, `product_class` и `product_size`, добавлен суррогатный ПК `item_id`.

В таблицу `offers` вынесены `product_id`, `standard_cost` и `transaction_date`, добавлен суррогатный ПК `offer_id` и атрибут `item_id` для связи с таблицей `items`.

А в таблице `transactions` остались уже имевшиеся атрибуты `transactions_id` (ПК), `customer_id`, `online_order`, `order_status` и `list_price`, добавлен атрибут `offer_id` для связи с таблицей `offers`.
