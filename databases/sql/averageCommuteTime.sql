-- https://www.interviewquery.com/questions/average-commute-time

select commuter_id, avg_commuter_time, avg_time
from (
    select 
    commuter_id,
    floor(avg(timestampdiff(minute, start_dt, end_dt))) as avg_commuter_time, 
    city
    from rides
    where city = 'NY'
    group by commuter_id
) t1
left join 
(
    select 
        city, 
        floor(avg(timestampdiff(minute, start_dt, end_dt))) as avg_time
    from rides
    where city = 'NY'
    group by city
) t2
on t1.city = t2.city
