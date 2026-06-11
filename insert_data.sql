PRAGMA foreign_keys = ON;

INSERT INTO customers (name, email, phone, created_at) VALUES
('Kim Minji', 'minji@example.com', '010-1111-1111', '2026-06-01'),
('Lee Junho', 'junho@example.com', '010-2222-2222', '2026-06-01'),
('Park Sora', 'sora@example.com', '010-3333-3333', '2026-06-02'),
('Choi Yuna', 'yuna@example.com', '010-4444-4444', '2026-06-02'),
('Jung Hoon', 'hoon@example.com', '010-5555-5555', '2026-06-03'),
('Kang Daeun', 'daeun@example.com', '010-6666-6666', '2026-06-03'),
('Yoon Jisoo', 'jisoo@example.com', '010-7777-7777', '2026-06-04'),
('Han Seojun', 'seojun@example.com', '010-8888-8888', '2026-06-04'),
('Oh Nari', 'nari@example.com', '010-9999-9999', '2026-06-05'),
('Shin Taeho', 'taeho@example.com', '010-0000-0000', '2026-06-05');

INSERT INTO menu_items (name, category, price, is_available) VALUES
('Americano', 'Coffee', 3000, 1),
('Latte', 'Coffee', 4000, 1),
('Vanilla Latte', 'Coffee', 4500, 1),
('Green Tea Latte', 'Tea', 4500, 1),
('Iced Tea', 'Tea', 3500, 1),
('Chocolate Cake', 'Dessert', 5500, 1),
('Cheesecake', 'Dessert', 5000, 1),
('Bagel', 'Bakery', 3500, 1),
('Croissant', 'Bakery', 3800, 1),
('Sandwich', 'Food', 6500, 1);

INSERT INTO orders (customer_id, order_date, status) VALUES
(1, '2026-06-01', 'completed'),
(2, '2026-06-01', 'completed'),
(3, '2026-06-02', 'completed'),
(4, '2026-06-02', 'ordered'),
(5, '2026-06-03', 'completed'),
(6, '2026-06-03', 'cancelled'),
(7, '2026-06-04', 'completed'),
(8, '2026-06-04', 'ordered'),
(9, '2026-06-05', 'completed'),
(10, '2026-06-05', 'completed');

INSERT INTO order_items (order_id, menu_item_id, quantity) VALUES
(1, 1, 2),
(1, 6, 1),
(2, 2, 1),
(2, 8, 2),
(3, 3, 1),
(3, 7, 1),
(4, 4, 2),
(4, 9, 1),
(5, 10, 1),
(5, 1, 1),
(6, 5, 2),
(6, 6, 1),
(7, 2, 2),
(7, 7, 2),
(8, 3, 1),
(8, 8, 1),
(9, 1, 3),
(9, 10, 1),
(10, 4, 1),
(10, 9, 2);
