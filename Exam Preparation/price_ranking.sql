SELECT * FROM universities_db.universities;

SELECT u.name as university_name, c.name as city_name, u.address,
case
   when u.tuition_fee < 800 then "cheap"
   when u.tuition_fee < 1200 then "normal"
   when u.tuition_fee < 2500  then "high"
   ELSE "expensive"

end as price_rank,
u.tuition_fee

from universities u
join cities c on c.id = u.city_id
order by u.tuition_fee;