select
    customerid,
    segement,
    country,
    sum(orderprofit) as profit
from {{ ref('stg_orders') }}
group by 
    customerid,
    segement,
    country