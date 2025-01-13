select name from airbnb.listings;
select count(id) from airbnb.listings;
select count(listing_id) from airbnb.booking_details;
select host_id from airbnb.listings;
select distinct(host_name) from airbnb.listings;
select distinct(neighbourhood_group) from airbnb.listings;
select distinct(neighbourhood) from airbnb.listings;
select distinct(room_type) from airbnb.listings;
select * from airbnb.listings where neighbourhood_group in ('Brooklyn','Manhattan');
select max(price) from airbnb.booking_details;
select min(price) from airbnb.booking_details;
select avg(price) from airbnb.booking_details;
select min(minimum_nights) from airbnb.booking_details;
select max(minimum_nights) from airbnb.booking_details;
select avg(availability_365) from airbnb.booking_details;
select listing_id ,availability_365 from airbnb.booking_details where availability_365 > 300;
select count(listing_id) from airbnb.booking_details where price between 300 and 400;
select count(listing_id) from airbnb.booking_details where minimum_nights < 5;
select count(listing_id) from airbnb.booking_details where minimum_nights >100;
select * from airbnb.booking_details;
select * from airbnb.listings;
select * from airbnb.booking_details,airbnb.listings;
select l.host_name ,b.price from airbnb.listings as l,airbnb.booking_details as b where l.id = b.listing_id;
select l.room_type ,b.price from airbnb.listings as l,airbnb.booking_details as b where l.id = b.listing_id;
select l.neighbourhood_group ,b.minimum_nights from airbnb.listings as l,airbnb.booking_details as b where l.id = b.listing_id;
select l.neighbourhood ,b.availability_365 from airbnb.listings as l,airbnb.booking_details as b where l.id = b.listing_id;

select l.neighbourhood_group ,sum(price) from airbnb.listings as l,airbnb.booking_details as b
 where l.id = b.listing_id 
 group by neighbourhood_group;

select l.neighbourhood_group ,max(price) from airbnb.listings as l,airbnb.booking_details as b
 where l.id = b.listing_id 
 group by neighbourhood_group;

select l.neighbourhood_group ,max(minimum_nights)from airbnb.listings as l,airbnb.booking_details as b
 where l.id = b.listing_id 
 group by neighbourhood_group;

select l.neighbourhood ,max(reviews_per_month) from airbnb.listings as l,airbnb.booking_details as b
 where l.id = b.listing_id 
 group by neighbourhood;

select l.room_type ,max(price) from airbnb.listings as l join airbnb.booking_details as b
on l.id = b.listing_id 
group by room_type;

select l.room_type ,avg(number_of_reviews) from airbnb.listings as l join airbnb.booking_details as b
on l.id = b.listing_id 
group by room_type;

select l.room_type ,avg(price) from airbnb.listings as l join airbnb.booking_details as b
on l.id = b.listing_id 
group by room_type;

select l.room_type ,avg(minimum_nights) from airbnb.listings as l join airbnb.booking_details as b
on l.id = b.listing_id 
group by room_type;

select l.room_type ,avg(price)  from airbnb.listings as l 
join airbnb.booking_details as b
on l.id = b.listing_id 
group by room_type
having avg(price)<100;

select l.neighbourhood ,avg(minimum_nights)  from airbnb.listings as l 
join airbnb.booking_details as b
on l.id = b.listing_id 
group by neighbourhood
having avg(minimum_nights) > 5;

select *  from airbnb.listings as l 
left join airbnb.booking_details as b
on l.id = b.listing_id 
where price in (select price from airbnb.booking_details where price > 200);

select *  from airbnb.listings 
where id in (select id from airbnb.booking_details 
 join airbnb.listings 
on id = listing_id 
where price > 200);


select *  from airbnb.booking_details 
where listing_id in (select listing_id from airbnb.booking_details 
 join airbnb.listings 
on id = listing_id 
and host_id =  314941);

select id ,host_id from airbnb.listings
join airbnb.booking_details
on id = listing_id
where id = host_id ; 

select * from airbnb.listings
join airbnb.booking_details
on id = listing_id
where name like "%cozy%" ; 

select neighbourhood_group ,price,host_id from airbnb.listings
join airbnb.booking_details
on id = listing_id
where neighbourhood_group = 'Manhattan'; 

select id,host_name, neighbourhood,price from airbnb.listings
join airbnb.booking_details
on id = listing_id
where neighbourhood in('Upper West Side','Williamsburg')
and price> 100; 

select id,host_name, neighbourhood,price from airbnb.listings
join airbnb.booking_details
on id = listing_id
where host_name = 'Elise'
and neighbourhood = 'Bedford-Stuyvesant'; 

select id,host_name, availability_365,minimum_nights from airbnb.listings
join airbnb.booking_details
on id = listing_id
where availability_365 >100
and minimum_nights >100; 

select id,host_name, number_of_reviews,reviews_per_month from airbnb.listings
join airbnb.booking_details
on id = listing_id
where number_of_reviews >500
and reviews_per_month > 5; 

select neighbourhood_group,sum(number_of_reviews) as total_review from airbnb.listings
join airbnb.booking_details
on id = listing_id
group by neighbourhood_group
order by total_review desc ; 

select host_name, sum(price) total_price from airbnb.listings
join airbnb.booking_details
on id = listing_id
group by host_name
order by total_price Asc ; 

select host_name, price from airbnb.listings
join airbnb.booking_details
on id = listing_id
where price in(select max( price) from airbnb.booking_details); 

select neighbourhood_group,price from airbnb.listings
join airbnb.booking_details
on id = listing_id and price< 100; 

select l.room_type ,max(price) as max_price,avg(availability_365)  from airbnb.listings as l 
join airbnb.booking_details as b
on l.id = b.listing_id 
group by room_type
order by max_price asc;
