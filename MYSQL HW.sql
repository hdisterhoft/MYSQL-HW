use sakila

select first_name, last_name
from actor;

select concat(first_name, " ", last_name) as "Actor Name"
from actor;

select actor_id, first_name, last_name
from actor
where first_name = "Joe";

SELECT *
FROM actor
WHERE last_name LIKE '%GEN%';

SELECT last_name, first_name
FROM actor
where last_name LIKE '%LI%';

#Couldn't get this one to run
SELECT country_id, country
from country
Where country = ("Afghanistan","Bangladesh","China");

ALTER TABLE actor
ADD column description blob(100) AFTER last_name;

ALTER TABLE actor
DROP COLUMN description;

#couldn't figure this one out
SELECT 
count(last_name) as "count"
FROM 
(SELECT distinct(last_name)
from actor);

#Skipping the rest of 4 because i couldnt figure out the first part

SHOW CREATE TABLE address;

Select staff.first_name, staff.last_name, address.address
from address
join staff on 
staff.address_id=address.address_id;

Select * from payment;


#I don't know why it only shows one staff member
#if I do a right join, it shows one member, if I do a left, it shows the other
select staff.staff_id, staff.first_name, staff.last_name, sum(payment.amount)
from staff
join payment on
staff.staff_id=payment.staff_id
where payment.payment_date like '2005-08-%';

#yeah, i have no idea how to do this
select film.title, count(distinct(film_actor.actor_id))
from film_actor
join film on
film.film_id=film_actor.film_id;

Select count(title) as "Number of Copies of Hunchback Impossible"
from film
where title like "Hunchback Impossible";

