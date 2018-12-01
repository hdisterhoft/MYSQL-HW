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
Where country IN ("Afghanistan","Bangladesh","China");

ALTER TABLE actor
ADD column description blob(100) AFTER last_name;

ALTER TABLE actor
DROP COLUMN description;

#4A
SELECT 
last_name, count(last_name) from actor
group by(last_name);

SELECT 
last_name, count(last_name) from actor
group by(last_name)
having count(last_name) >1;

UPDATE actor
set first_name = "HARPO"
where first_name = "Groucho"
and last_name = "Williams";

UPDATE actor
set first_name = "GROUCHO"
WHERE first_name = "HARPO"
and last_name = "Williams";

SHOW CREATE TABLE address;

#6A
Select staff.first_name, staff.last_name, address.address
from address
join staff on 
staff.address_id=address.address_id;

#6B
select staff.staff_id, staff.first_name, staff.last_name, sum(payment.amount)
from staff
join payment on
staff.staff_id=payment.staff_id
where payment.payment_date like '2005-08-%'
group by staff_id;

#6C
select film.title, count(distinct(film_actor.actor_id))
from film_actor
join film on
film.film_id=film_actor.film_id
GROUP BY title;

#6D
Select count(title) as "Number of Copies of Hunchback Impossible"
from film
where title like "Hunchback Impossible";

#6E
select customer.first_name, customer.last_name, sum(payment.amount) as "Total Amount Paid"
from customer
join payment on
customer.customer_id=payment.customer_id
group by last_name
order by last_name;

#7A
select title
from film
where title like "Q%"
or title like "K%"
and language_id like 1;

#7B
select actor.first_name, actor.last_name, film.title
from actor
join film_actor on
film_actor.actor_id=actor.actor_id
join film on 
film.film_id=film_actor.film_id
having title like "Alone Trip";

#7C
select customer.first_name, customer.last_name, address.address, city.city, address.postal_code, country.country
from address
join customer on
customer.address_id=address.address_id
join city on
city.city_id=address.city_id
join country on
country.country_id=city.country_id
having country like "Canada";

#7D
select film.title, category.name as "Category", film_category.category_id
from film
join film_category on
film.film_id=film_category.film_id
join category on
category.category_id=film_category.category_id
having name like "Family";

#7E
select film.title, sum(rental.rental_id) as "Number of Times Rented", inventory.inventory_id
from film
join inventory on
inventory.film_id=film.film_id
join rental on
rental.inventory_id=inventory.inventory_id
group by title
order by sum(rental.rental_id) desc;

select * from payment;

#7F
select store.store_id, sum(payment.amount) as "Total Revenue"
from staff
join payment on
payment.staff_id=staff.staff_id
join store on
store.store_id=staff.store_id
group by store_id;

#7G
select store.store_id, city.city, country.country
from store
join address on
address.address_id=store.address_id
join city on
city.city_id=address.city_id
join country on
country.country_id=city.country_id
group by store_id;

#7H
select category.name as "Genre", sum(payment.amount) as "Gross Revenue"
from category
join film_category on
category.category_id=film_category.category_id
join inventory on
inventory.film_id=film_category.film_id
join rental on
inventory.inventory_id=rental.inventory_id
join payment on
payment.rental_id=rental.rental_id
group by name
order by sum(payment.amount) desc
limit 5;

#8A
Create view gross_revenue2 as
select category.name as "Genre", sum(payment.amount) as "Gross Revenue"
from category
join film_category on
category.category_id=film_category.category_id
join inventory on
inventory.film_id=film_category.film_id
join rental on
inventory.inventory_id=rental.inventory_id
join payment on
payment.rental_id=rental.rental_id
group by name
order by sum(payment.amount) desc
limit 5;

#8B
select * from gross_revenue2;

#8C
Drop view gross_revenue2;

