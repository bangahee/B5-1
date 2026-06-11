PRAGMA foreign_keys = ON;

-- Query 1: 모든 고객 목록을 조회한다.
SELECT * FROM customers;

-- Query 2: 가격이 4000원 이상인 메뉴를 조회한다. WHERE 사용.
SELECT name, category, price
FROM menu_items
WHERE price >= 4000;

-- Query 3: 메뉴를 가격이 높은 순서대로 정렬한다. ORDER BY 사용.
SELECT name, price
FROM menu_items
ORDER BY price DESC;

-- Query 4: 가장 저렴한 메뉴 3개를 조회한다. LIMIT 사용.
SELECT name, price
FROM menu_items
ORDER BY price ASC
LIMIT 3;

-- Query 5: 주문 정보와 고객 이름을 함께 조회한다. INNER JOIN 사용.
SELECT orders.id AS order_id, customers.name, orders.order_date, orders.status
FROM orders
INNER JOIN customers ON orders.customer_id = customers.id;

-- Query 6: 주문 상세와 메뉴명을 함께 조회한다. INNER JOIN 사용.
SELECT order_items.id, orders.id AS order_id, menu_items.name, order_items.quantity
FROM order_items
INNER JOIN orders ON order_items.order_id = orders.id
INNER JOIN menu_items ON order_items.menu_item_id = menu_items.id;

-- Query 7: 고객별 주문 목록을 조회한다. INNER JOIN 사용.
SELECT customers.name, orders.id AS order_id, orders.order_date, orders.status
FROM customers
INNER JOIN orders ON customers.id = orders.customer_id
ORDER BY customers.name;

-- Query 8: 모든 고객과 주문 여부를 조회한다. LEFT JOIN 사용.
SELECT customers.name, orders.id AS order_id, orders.status
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id;

-- Query 9: 전체 주문 수를 계산한다. COUNT 사용.
SELECT COUNT(*) AS total_orders
FROM orders;

-- Query 10: 주문 상태별 주문 수를 계산한다. COUNT와 GROUP BY 사용.
SELECT status, COUNT(*) AS order_count
FROM orders
GROUP BY status;

-- Query 11: 카테고리별 평균 메뉴 가격을 계산한다. AVG와 GROUP BY 사용.
SELECT category, AVG(price) AS average_price
FROM menu_items
GROUP BY category;

-- Query 12: 주문별 총 결제 금액을 계산한다. SUM과 GROUP BY 사용.
SELECT orders.id AS order_id,
       customers.name,
       SUM(menu_items.price * order_items.quantity) AS total_amount
FROM orders
INNER JOIN customers ON orders.customer_id = customers.id
INNER JOIN order_items ON orders.id = order_items.order_id
INNER JOIN menu_items ON order_items.menu_item_id = menu_items.id
GROUP BY orders.id, customers.name;

-- Query 13: 평균 가격보다 비싼 메뉴를 조회한다. 서브쿼리 사용.
SELECT name, price
FROM menu_items
WHERE price > (
    SELECT AVG(price)
    FROM menu_items
);

-- Query 14: 특정 메뉴의 가격을 수정한다. UPDATE 사용.
UPDATE menu_items
SET price = 3200
WHERE name = 'Americano';

SELECT name, price
FROM menu_items
WHERE name = 'Americano';

-- Query 15: 취소된 주문의 상세 데이터를 삭제한다. DELETE 사용.
DELETE FROM order_items
WHERE order_id IN (
    SELECT id
    FROM orders
    WHERE status = 'cancelled'
);

SELECT *
FROM order_items
WHERE order_id = 6;

-- Index Explanation:
-- orders.customer_id는 고객별 주문을 자주 조회할 때 사용되는 컬럼이므로 인덱스를 생성했다.
-- 이 인덱스는 customers와 orders를 JOIN하거나 특정 고객의 주문을 찾을 때 검색 속도를 높이는 데 도움이 된다.