
select * from KMS

-----1) product category with the hightest sales
SELECT TOP 1 product_Category,sum(sales) as hightest_sale
from KMS
GROUP  by Product_Category
order by hightest_sale desc
------ 2) top 3 region with hight sales
SELECT TOP 3 Region, sum(sales) as  hightest_sale
from kms
GROUP BY  Region
order by hightest_sale desc
------- 2b) the 3 region with  the lowest sales
SELECT TOP 3 Region, sum(sales) as hightest_sale
from kms
group by Region
order by hightest_sale
------  3) total sale for ontario region
SELECT sum(sales) as total_sales
from kms
where product_sub_category ='appliances' and region ='ontario'
 



select sum(sales) as ontario_appliance_total_sales
from kms
where product_sub_category = 'appliances' and region ='ontario'


---------- 5) the shipp mode with the most shipping cost-----
SELECT TOP 1 SHIP_MODE, SUM(SHIPPING_COST) as total_shipping_cost
FROM KMS
GROUP BY SHIP_MODE
ORDER BY total_SHIPPING_COST desc


-------6a) 10 most valuable customers-----------
select top 10 customer_name,product_category,
count(product_category)as number_purchased,
sum(sales) as total_sales
from kms
group by customer_name,
         product_category
order by total_sales desc

----6b) 10 most valuable customer base on segment------
select top 10 customer_segment, product_category,
count(product_category)as number_purchasrd,
sum(sales)as total_sales
from kms
group by customer_segment,
          product_category
order by total_sales desc

------ 7) small business customer with the hightest sales-----
select top 1 customer_name, sum(sales) as hightest_total_sales
from kms
where customer_segment ='small business'
group by customer_name
order by hightest_total_sales 

-----8) corprate customer with the most order 2009-212----
select top 1 customer_name, max([order_quantity]) as total_purchased
from kms
where customer_segment = 'corporate'
group by customer_name
order by total_purchased desc

-------- 9) the most profitable customer----

select top 1 customer_name, sum(profit) as toal_profit
from kms
group by customer_name
order by sum(profit) desc


-- 10)------ view created----
create  view vw_kms as
select 
kms.Customer_Name,KMS.Customer_Segment,[ORDER].Status
FROM KMS
JOIN [Order] 
ON KMS.Order_ID = [Order].Order_ID

---- customers that retured iterms and their segment----
select * from vw_kms

------- 4) 10 most bottom  customers in terms of revenue-----------
select top 10 customer_name,product_category,
count(product_category)as number_purchased,
sum(sales) as total_sales
from kms
group by customer_name,
         product_category
order by total_sales 
 

------ ADVISE ON TO INCREASE REVENUE OF THE 10 BOTTOM CUSTOMERS-----
--1
--SALES, IN TERMS OF SALES FOR THE BOTTOM 10 CUSTOMERS THE COMPANY SHOULD GIVE A RESNABLR DISCOUNT TO THE 
CUSTOMERS IN THAT WAY IT WILL GREATLY AFFECT THIER PURACHING POWER POSTIVELY IN TURN INCREASE THEIER REVENUE.

----SHIPPING: IF THE SHIPPING COST IS HIGHT IT AFFECT THE PRICE OF THE PRODUCT WHICH WILL BE TO EXPENSIVE FOR  
 THE BOTTOM CUSTOMERS, THEREFORE THE MANGEMENT SHOULD CUT DOWN ON THE SHIPPING COST, IN THAT WAY IT WILL
 AFFECT THE PRICE OF THE PRODUCT THUS INCREASING THE REVENUE DERIVED FROM THE BOTTOM CUSTOMERS.

----CUSTOMER BEHAVIOUR: CUSTOMERS PURCHASING POWER IS BASE ON THEIR INCOME, SO WHEN THE PRICE OF THE PRODUCT
IS LOW THE CUSTOMER WILL PURACHE MORE THEREFORE THE MANGEMENT SHOULD BUT INTO CONSIDRATION THE INCOME OF THEIR
CUSTOMERS VIS-AVIS THE COST OF THE PRODUCT.



---- 11) Appropriation of Shipping Costs Based on Order Priority--
select order_priority, count(order_priority) as total_order,sum(shipping_cost) as total_cost,Ship_Mode
from KMS
group by Order_Priority, Ship_Mode
order by Ship_Mode

---   MY OBSERVATION 
BASE ON THE QUERY IT DOES SHOW THAT THE ORDER_PRIORITY, IMPACT THE SHIPPING_COST
--- A. BUT  NO, BASE ON THE QUERY, DELIVERY TRUCK WHICH IS MORE ECONOMICAL, IS USED TO DELIVER HIGH AND 
CRITICAL PRODUCT WHICH IS AT RISK FOR LATE DELIVERY AND PRODUCT BEEN DAMAGED, WHICH COULD CAUSE CUTOMER
DISSATISFACTION, SAVING ON COST AT THE EXPENSE OF SERVICE QUALITY
-
-----B.BASE ON MY QUERY, THE HIGHEST SHIPPING_COST DOESN'T MATCH THE HIGHTEST  ORDER_PRIORITY THUS 
SHIPPING_COST ARE NOT STRICTLY BASED ON URGENCY, BUT BASE ON PROFIT MAXIMIZATION.

-----MY ADVICE---

----THE EXPRESS AIR SHOULD BE USED FOR PRODUCT OF HIGH, URGENT AND CRITICAL ORDER_PRIORITY
----THE REGULAR AIR SHOULD BE USED FOR MEDIUM AND NOT SPECIFIED ORDER_PRIORITY
----THE  DELIVERY TRUCK SHOULD BE USED FOR LOW  ORDER_PRIORITY.
THIS WAY THE COMPANY WILL BE ABLE TO GIVE MAXIMUM SATTISFACTION TO HIS CUSTOMER WHY MAXIMIZING SHIPPING_COST
AND IN TERMS ALSO MAXIMIZING PROFIT.




select * from KMS

