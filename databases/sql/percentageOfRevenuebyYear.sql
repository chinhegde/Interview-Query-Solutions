-- https://www.interviewquery.com/questions/percentage-of-revenue-by-year

select 
    round(first_revenue*100/total_revenue, 2) as percent_first,
    round(last_revenue*100/total_revenue, 2) as percent_last
from (
    select sum(amount) as first_revenue
    from annual_payments 
    where year(created_at) in (
        select min(year(created_at))
        from annual_payments
    )
) t1, 

(
    select sum(amount) as last_revenue
    from annual_payments 
    where year(created_at) in (
        select max(year(created_at))
        from annual_payments
    )
) t2,

(
    select sum(amount) as total_revenue
    from annual_payments
) t3