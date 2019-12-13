create view trans_agg 
as
select account_id,count(trans_id)as trans_num, max(date) as trans_date,
sum(case when operation = 'VYBER KARTOU' then 1 else 0 end) as credit_card_withdrawal,
sum(case when operation = 'VKLAD' then 1 else 0 end ) as credit_in_cash,
sum(case when operation = 'VYBER' then 1 else  0 end ) as withdrawal_in_cash,
sum(case when operation = 'PREVOD Z UCTU' then 1 else  0 end ) as collection_from_another_bank,
sum(case when operation = 'PREVOD NA UCET' then 1 else  0 end ) as remittance_to_another_bank,
avg(case when operation = 'VYBER KARTOU' then amount end) as credit_card_withdrawal_amount,
avg(case when operation = 'VKLAD' then amount end) as credit_in_cash_amount,
avg(case when operation = 'VYBER' then amount end) as withdrawal_in_cash_amount,
avg(case when operation = 'PREVOD Z UCTU' then amount end ) as collection_from_another_bank_amount,
avg(case when operation = 'PREVOD NA UCET' then amount end ) as remittance_to_another_bank_amount
from dbo.transData 
Group By  account_id


