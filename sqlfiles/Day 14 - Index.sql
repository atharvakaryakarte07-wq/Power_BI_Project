use db4;

select * from sales;

select * from sales
where city = 'Pune';

explain select * from sales
where city = 'Pune';

create index index_city_name
on sales(city);

desc sales;     -- describe sales

#Modifying data type of city

alter table sales
modify city varchar(50);   ## we changed the data type of city from text to varchar 

create index index_city_name
on sales(city);


