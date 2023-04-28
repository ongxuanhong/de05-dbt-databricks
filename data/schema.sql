CREATE EXTERNAL TABLE brazillian_ecom.product_category_name_translation (
    product_category_name STRING,
    product_category_name_english STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS textfile
LOCATION '/mnt/dbt-databricks/warehouse/product_category_name_translation.csv/';

CREATE EXTERNAL TABLE brazillian_ecom.olist_products_dataset (
    product_id varchar(32),
    product_category_name varchar(64),
    product_name_lenght varchar(10),
    product_description_lenght varchar(10),
    product_photos_qty varchar(10),
    product_weight_g varchar(10),
    product_length_cm varchar(10),
    product_height_cm varchar(10),
    product_width_cm varchar(10)
)
USING json
LOCATION '/mnt/dbt-databricks/warehouse/olist_products_dataset.json/';

CREATE EXTERNAL TABLE brazillian_ecom.olist_orders_dataset (
  order_id STRING,
  customer_id STRING,
  order_status STRING,
  order_purchase_timestamp STRING,
  order_approved_at STRING,
  order_delivered_carrier_date STRING,
  order_delivered_customer_date STRING,
  order_estimated_delivery_date STRING

)
USING parquet
LOCATION '/mnt/dbt-databricks/warehouse/olist_orders_dataset.parquet/';

CREATE EXTERNAL TABLE brazillian_ecom.olist_order_payments_dataset (
  order_id varchar(32),
  payment_sequential varchar(32),
  payment_type varchar(32),
  payment_installments varchar(32),
  payment_value varchar(32)
)
USING avro
LOCATION '/mnt/dbt-databricks/warehouse/olist_order_payments_dataset.avro/';