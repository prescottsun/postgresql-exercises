CREATE TABLE restaurant (
    id SERIAL PRIMARY KEY, 
    name text NOT NULL,
    distance INTEGER,
    stars INTEGER,
    category TEXT,
    favorite_dish TEXT,
    takeout BOOLEAN,
    ate_last TIMESTAMP
);

INSERT INTO restaurant (name, distance, stars, category, favorite_dish, takeout, ate_last)
    VALUES ('Holy Taco', 20, 5, 'Mexican', 'Pork Belly Taco', TRUE, '2019-08-24 19:00:00'),
    ('Chipotle', 1, 5, 'Mexican', 'Chicken Bowl', TRUE, '2019-10-08 12:00:00'),
    ('Lovies', 1, 5, 'BBQ', 'Combo Plate', TRUE, '2019-09-17 13:00:00'),
    ('NaanStop', 1, 3, 'Indian', 'Chicken Tikka', TRUE, '2019-09-23');



select name from restaurant where stars = 5;
select favorite_dish from restaurant where stars = 5;
select id from restaurant where name = 'Chipotle';
select * from restaurant where category = 'BBQ';
select * from restaurant where takeout = TRUE;
select * from restaurant where takeout = TRUE and category = 'BBQ';
select * from restaurant where distance <= 2;
select * from restaurant where ate_last < '2019-10-02';
select * from restaurant where ate_last < '2019-10-02' and stars = 5;

select * from restaurant order by distance;
select * from restaurant order by distance limit 2;
select * from restaurant order by stars desc limit 2;
select * from restaurant where distance < 2 sort by stars desc limit 2;
select count(id) from restaurant;
select category, count(id) from restaurant group by category;
select category, avg(stars) from restaurant group by category;
select category, max(stars) from restaurant group by category;