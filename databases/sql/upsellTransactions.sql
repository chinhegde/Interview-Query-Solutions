-- https://www.interviewquery.com/questions/upsell-transactions

select count(distinct t.user_id) as num_of_upsold_customers
from transactions as t 
join (
    select user_id, min(created_at) as first_purchase
    from transactions
    group by user_id
) as first_purchases
on t.user_id = first_purchases.user_id
where t.created_at > first_purchases.first_purchase