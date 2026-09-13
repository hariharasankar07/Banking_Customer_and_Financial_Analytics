use banking_analysis;
-- Customer Analysis 
-- Q1. How many customers does the bank have and how are they distributed across occupation?
select occupation, count(customer_id) as No_of_customers
from customers
group by occupation;

-- Q2. Which cities have the highest numbers of customers?
select city as cities, count(customer_id) as No_of_customers
from customers
group by cities
order by No_of_customers desc limit 5;

-- Q3. Which occupations have the highest average annual income?
select occupation, round(avg(annual_income),2) as average_annual_income
from customers
group by occupation
order by average_annual_income desc;

-- Transaction Analysis
-- Q4. Which transaction types are used most frequently?
select transaction_type, count(transaction_type) as frequently_using
from transactions
group by transaction_type
order by frequently_using desc limit 3;

-- Q5. Which transaction types have the highest total transaction value?
select transaction_type, round(sum(transaction_amount),2) as total_transaction_amount
from transactions
group by transaction_type
order by total_transaction_amount desc limit 3;

-- Q6. What is the success rate of each transaction type?
select transaction_type,
count(transaction_type) as frequently_using, 
sum(case when transaction_status = 'Successful' then 1 else 0 end ) as successful_transaction,
round(100.0*(sum(case when transaction_status = 'Successful' then 1 else 0 end )/count(*)),2) as success_rate
from transactions
group by transaction_type
order by success_rate desc;

-- Q7. Which months have the highest transaction activity?
select transaction_month, count(*) as transaction_activity
from transactions
group by transaction_month
order by transaction_activity desc limit 5;

-- Loan Analysis
-- Q8. Which loan types are most common ?
select loan_type, count(*) as frequently_using
from loans
group by loan_type 
order by frequently_using desc limit 3;

-- Q9. Which loan types have the highest average loan amount?
select loan_type, round(avg(loan_amount),2) as average_loan_amount
from loans
group by loan_type
order by average_loan_amount desc limit 3;

-- Q10. What is the distribution of loan statuses accross different loan types?
select loan_type, loan_status, count(*) as loan_count
from loans
group by loan_type, loan_status
order by loan_type, loan_count desc;

-- Account analysis 
-- Q11. which account type has a highest account balance?
select account_type, round(sum(balance),2) as account_balance
from accounts
group by account_type
order by account_balance desc;

-- Cross table analysis
-- Q12. Which loan types are associated with the highest average customer income?
select l.loan_type as loan_type, round(avg(c.annual_income),2) as average_income
from loans l inner join customers c on
l.customer_id = c.customer_id
group by loan_type
order by average_income desc ;











