-- List of customers and their spending
select c.name, sum(car.price) 
from   public.sales s, public.customer c, public.car car 
where  s.customer_id = c.id and s.car_id = car.id
group by c.name order by c.name;

-- TOP 3 by quantity assuming 2020-80 is current month
select m.name, count(*) as car_count
from   public.sales s, public.mfacturer m, public.car c 
where  s.car_id = c.id and c.mfacturer_id = m.id 
and    TO_CHAR(txn_date, 'YYYY-MM') = '2020-08'
group by m.name order by car_count desc limit 3;

-- TOP 3 by price assuming 2020-80 is current month
select m.name, sum(c.price) as car_count
from   public.sales s, public.mfacturer m, public.car c 
where  s.car_id = c.id and c.mfacturer_id = m.id 
and    TO_CHAR(txn_date, 'YYYY-MM') = '2020-08'
group by m.name order by car_count desc limit 3;