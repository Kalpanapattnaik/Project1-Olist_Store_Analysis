create database olist;
use olist;


SHOW variables LIKE "secure_file_priv";

CREATE TABLE  olist_customers_dataset (
customer_id varchar(255),	
customer_unique_id varchar(255),	
customer_zip_code_prefix varchar(255),	
customer_city varchar(255),	
customer_state varchar(255)
   );

CREATE TABLE  olist_geolocation_dataset (
    geolocation_zip_code_prefix varchar(255),
    geolocation_lat varchar(255),
    geolocation_lng varchar(25),
    geolocation_city varchar(255),
    geolocation_state varchar(255)
);

CREATE TABLE  olist_order_items_dataset  (
   order_id	varchar(255),
   order_item_id varchar(255),
   product_id varchar(255),
   seller_id varchar(255), 
   shipping_limit_date varchar(255),
   price varchar(255),
   freight_value varchar(255)
   );

CREATE TABLE  olist_order_payments_dataset (
order_id varchar(255),
payment_sequential	varchar(255),
payment_type	varchar(255),
payment_installments	varchar(255),
payment_value	varchar(255)
   );

drop table olist_order_reviews_dataset;
CREATE TABLE  olist_order_reviews_dataset (
review_id varchar(255),	
order_id varchar(255),	
review_score varchar(255),	
review_comment_title varchar(255),	
review_comment_message varchar(5000),	
review_creation_date varchar(255),	
review_answer_timestamp varchar(255)
   );
   
drop table olist_orders_dataset;
CREATE TABLE  olist_orders_dataset (
order_id varchar(255),	
customer_id varchar(255),	
order_status varchar(255),	
order_purchase_timestamp varchar(255),	
order_approved_at varchar(255),	
order_delivered_carrier_date varchar(255),	
order_delivered_customer_date varchar(255),	
order_estimated_delivery_date varchar(255),
day_week varchar(255)
   );
   
   

CREATE TABLE  olist_products_dataset (
product_id varchar(255),	
product_category_name varchar(255),	
product_name_lenght varchar(255),	
product_description_lenght varchar(255),	
product_photos_qty varchar(255),	
product_weight_g varchar(255),	
product_length_cm varchar(255),	
product_height_cm varchar(255),	
product_width_cm varchar(255)
   );

CREATE TABLE  olist_sellers_dataset (
seller_id varchar(255),	
seller_zip_code_prefix varchar(255),	
seller_city varchar(255),	
seller_state varchar(255)
   );

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\olist_sellers_dataset.csv' INTO TABLE olist_sellers_dataset
  FIELDS TERMINATED BY ',' ENCLOSED BY '"'  
  LINES terminated by '\n'
  ignore 1 lines;
  
  
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\olist_products_dataset.csv' INTO TABLE olist_products_dataset
  FIELDS TERMINATED BY ',' ENCLOSED BY '"'  
  LINES terminated by '\n'
  ignore 1 lines;
  
  
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\olist_orders_dataset.csv' INTO TABLE olist_orders_dataset
  FIELDS TERMINATED BY ',' ENCLOSED BY '"'  
  LINES terminated by '\n'
  ignore 1 lines;
  
  
  
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\olist_order_reviews_dataset.csv' INTO TABLE olist_order_reviews_dataset
  FIELDS TERMINATED BY ',' ENCLOSED BY '"'  
  LINES terminated by '\n'
  ignore 1 lines;
  
  
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\olist_order_payments_dataset.csv' INTO TABLE olist_order_payments_dataset
  FIELDS TERMINATED BY ',' ENCLOSED BY '"'  
  LINES terminated by '\n'
  ignore 1 lines;
  
  
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\olist_order_items_dataset.csv' INTO TABLE olist_order_items_dataset
  FIELDS TERMINATED BY ',' ENCLOSED BY '"'  
  LINES terminated by '\n'
  ignore 1 lines;
  
  
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\olist_geolocation_dataset.csv' INTO TABLE olist_geolocation_dataset
  FIELDS TERMINATED BY ',' ENCLOSED BY '"'  
  LINES terminated by '\n'
  ignore 1 lines;
  
  
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\olist_customers_dataset.csv' INTO TABLE olist_customers_dataset
  FIELDS TERMINATED BY ',' ENCLOSED BY '"'  
  LINES terminated by '\n'
  ignore 1 lines;