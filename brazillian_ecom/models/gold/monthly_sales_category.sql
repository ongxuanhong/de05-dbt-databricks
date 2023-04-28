SELECT
  category
  , {{ dbt_utils.pivot(
      'monthly',
      dbt_utils.get_column_values(ref('sales_values_by_category'), 'monthly', order_by="monthly ASC"),
      then_value="total_bills",
      agg='max',
      prefix=""
  ) }}
FROM {{ ref('sales_values_by_category') }}
GROUP BY
  category
