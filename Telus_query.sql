SELECT * 
FROM `wls.billing`
AS billing;

SELECT * 
FROM `wls.demographics`
AS demographics;

CREATE TABLE IF NOT EXISTS `wls.total` AS (
SELECT *
FROM `wls.churn`
AS churn
INNER JOIN `corded-shadow-372218.wls.billing` as billing
ON churn.Customer_churn_ID = billing.Customer_billing_ID
INNER JOIN `corded-shadow-372218.wls.demographics` as demographics
ON billing.Customer_billing_ID = demographics.Customer_demo_ID);

select * except(Customer_billing_ID, Customer_demo_ID) from `corded-shadow-372218.wls.total`;