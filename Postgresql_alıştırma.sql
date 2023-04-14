--İsminde en az 4 adet e harfi bulunan filmler
SELECT title FROM film
WHERE title ILIKE '%e%e%e%e%'

-- Her kategoriye ait film sayısı ve kategorilerin isimleri
SELECT category.name, COUNT(*) FROM film
JOIN film_category ON film_category.film_id = film.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name

--En çok film bulunan film kategorisi
SELECT COUNT(title),rating FROM film
GROUP BY rating
ORDER BY COUNT(title)DESC
LIMIT 1

-- K harfiyle başlayan en uzun ve replacement_cost en düşük 3 film
SELECT title, length,replacement_cost FROM film
WHERE title LIKE 'K%'
ORDER BY length DESC, replacement_cost ASC
LIMIT 3

--En çok alışveriş yapan müşterinin adı, soyadı, alışveriş tutarı
SELECT customer.first_name, customer.last_name, SUM(amount) FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.first_name, customer.last_name
ORDER BY SUM(amount) DESC
LIMIT 1
