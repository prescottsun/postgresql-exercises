CREATE TABLE restaurant (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    address TEXT,
    category TEXT
);

CREATE TABLE reviewer (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT,
    karma INTEGER CHECK (karma >= 0 AND karma <= 7)

);

CREATE TABLE review (
    id SERIAL PRIMARY KEY,
    reviewer_id  INTEGER REFERENCES reviewer (id),
    stars INTEGER CHECK (stars >= 1 AND stars <= 5),
    title TEXT,
    review TEXT,
    restaurant_id INTEGER REFERENCES restaurant (id)

);

INSERT INTO restaurant (name, address, category)
    VALUES ('American restaurant', '123 Generic St', 'American'),
    ('Chinese restaurant', '321 Somewhere Rd', 'Chinese'),
    ('Mexican restaurant', '456 Up Ln', 'Mexican'),
    ('Greek restaurant', '654 Down Dr', 'Greek')

;

INSERT INTO reviewer (name, email, karma)
    VALUES ('Tim', 'tim@gmail.com', 6),
    ('Susie', 'susie@gmail.com', 4),
    ('John', 'john@gmail.com', 2)
;


INSERT INTO review (reviewer_id, stars, title, review, restaurant_id)
    VALUES (1, 4, 'American restaurant review', 'American food is good', 1),
    (2, 3, 'Greek restaurant review', 'Greek food is alright', 4),
    (3, 5, 'Mexican restaurant review', 'Mexican food is amazing', 3),
    (1, 2, 'Mexican restaurant review by Tim', 'I do not like the food', 3),
    (2, 3, 'Chinese restaurant review', 'Chinese food is ok', 2)
;


select review.*
    from review
    inner join restaurant on review.restaurant_id = restaurant.id
    where restaurant.id = 3;

select review.*
    from review
    inner join restaurant on review.restaurant_id = restaurant.id
    where restaurant.name = 'Greek restaurant';

select review.*
    from review
    inner join reviewer on review.reviewer_id = reviewer.id
    where reviewer.name = 'Tim';

select restaurant.name, review.review
    from review
    inner join restaurant on review.restaurant_id = restaurant.id;

select restaurant.name, AVG(review.stars)
    from restaurant
    inner join review on review.restaurant_id = restaurant.id
    group by restaurant.name;

select restaurant.name, count(review.id)
    from review
    inner join restaurant on review.restaurant_id = restaurant.id
    group by restaurant.name;

select restaurant.name, review.review, reviewer.name
    from review
    inner join restaurant on review.restaurant_id = restaurant.id
    inner join reviewer on review.reviewer_id = reviewer.id;

select reviewer.name, avg(review.stars)
    from reviewer
    inner join review on reviewer.id = review.reviewer_id
    group by reviewer.name;

select reviewer.name, min(review.stars)
    from reviewer
    inner join review on reviewer.id = review.reviewer_id
    group by reviewer.name;

select restaurant.category, count(restaurant.id)
    from restaurant
    group by restaurant.category;

select restaurant.name, count(review.stars) as five_star_count
    from restaurant
    inner join review on restaurant.id = review.restaurant_id
    where review.stars = 5
    group by restaurant.name;

select restaurant.category, avg(review.stars) as avg_rating
    from restaurant
    inner join review on restaurant.id = review.restaurant_id
    group by restaurant.category;
