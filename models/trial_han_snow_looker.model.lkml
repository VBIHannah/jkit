connection: "snowflake_demo"

# include all the views
include: "/views/**/*.view"

datagroup: trial_han_snow_looker_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: trial_han_snow_looker_default_datagroup

explore: call_center {}

explore: catalog_page {}

explore: catalog_returns {}

explore: catalog_sales {}

explore: customer {}

explore: customer_address {}

explore: customer_demographics {}

explore: date_dim {}

explore: dbgen_version {}

explore: household_demographics {}

explore: income_band {}

explore: inventory {
   join: date_dim {
    type: inner
    relationship: many_to_one
    sql_on: ${date_dim.d_date_sk} =${inventory.inv_date_sk} ;;
  }
}

explore: item {}

explore: promotion {}

explore: reason {}

explore: ship_mode {}

explore: store {}

explore: store_returns {
  join:  customer{
    type: inner
    relationship: many_to_one
    sql_on: ${store_returns.sr_customer_sk} = ${customer.c_customer_sk} ;;
  }
  join:  date_dim{
    type: inner
    relationship: many_to_one
    sql_on: ${store_returns.sr_returned_date_sk} =  ${date_dim.d_date_sk};;
  }
  join:  item{
    type: inner
    relationship: many_to_one
    sql_on: ${store_returns.sr_item_sk} =  ${item.i_item_sk};;
  }
  join:  store{
    type: inner
    relationship: many_to_one
    sql_on: ${store_returns.sr_store_sk} =  ${store.s_store_sk};;
  }

}

explore: store_returns_bkp {}

explore: store_sales {
  join:  customer{
    type: inner
    relationship: many_to_one
    sql_on: ${store_sales.ss_customer_sk} = ${customer.c_customer_sk} ;;
  }
  join:  date_dim{
    type: inner
    relationship: many_to_one
    sql_on: ${store_sales.ss_sold_date_sk} =  ${date_dim.d_date_sk};;
  }
  join:  item{
    type: inner
    relationship: many_to_one
    sql_on: ${store_sales.ss_item_sk} =  ${item.i_item_sk};;
  }
  join:  store{
    type: inner
    relationship: many_to_one
    sql_on: ${store_sales.ss_store_sk} =  ${store.s_store_sk};;
  }
}

explore: store_sales_bkp {}

explore: time_dim {}

explore: warehouse {}

explore: web_page {}

explore: web_returns {
  join:  item{
    type: inner
    relationship: many_to_one
    sql_on: ${web_returns.wr_item_sk} =  ${item.i_item_sk};;
  }
  join:  web_page{
    type: inner
    relationship: many_to_one
    sql_on: ${web_returns.wr_web_page_sk} =  ${web_page.wp_web_page_sk};;
  }
}

explore: web_returns_bkp {}

explore: web_sales {
  join:  web_page{
    type: inner
    relationship: many_to_one
    sql_on: ${web_sales.ws_web_page_sk} =  ${web_page.wp_web_page_sk};;
  }
  join:  web_site{
    type: inner
    relationship: many_to_one
    sql_on: ${web_sales.ws_web_site_sk} =  ${web_site.web_site_sk};;
  }

  join: date_dim {
    type: inner
    relationship: many_to_one
    sql_on: ${date_dim.d_date_sk} = ${web_sales.ws_ship_date_sk} ;;
  }

  join: customer {
    type: inner
    relationship: many_to_one
    sql_on: ${customer.c_customer_sk}=${web_sales.ws_bill_customer_sk} ;;
  }
}

explore: web_sales_bkp {}

explore: web_site {}
