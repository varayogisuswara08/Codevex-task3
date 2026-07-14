select transaction_id, count(*)
from transactions
group by transaction_id
having count(*)>1;

select t.transaction_id,t.account_id
from transactions t
left join accounts a on t.account_id=a.account_id
where a.account_id is null;

select a.account_id,a.customer_id
from accounts a
left join customers c on a.customer_id=c.customer_id
where c.customer_id is null;

select transaction_id,amount
from transactions
where amount<=0;

select transaction_id,transaction_hour
from transactions 
where transaction_hour < 0 or transaction_hour > 23;

select customer_id,credit_score
from customers
where credit_score < 300 or credit_score > 850;

create or replace view account_txn_summary as 
select
  account_id,
  count(*)             as txn_count,
  round(avg(amount),2) as avg_amount,
  round(max(amount),2) as max_amount
from transactions
group by account_id;
