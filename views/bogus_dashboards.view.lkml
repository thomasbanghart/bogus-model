explore: bogus_dashboards {}

view: bogus_dashboards {
  sql_table_name: `spencer-white-tckt87992.bogus.bogus_dashboards`
    ;;

  dimension: dashboard_id {
    type: number
    sql: ${TABLE}.dashboard_id ;;
  }

  dimension: dataset {
    type: string
    sql: ${TABLE}.dataset ;;
  }

  dimension: image {
    type: string
    html: <img height="400px" src="https://storage.cloud.google.com/brick-layer-testing/bogus_test/{{value}}"/> ;;
    sql: ${TABLE}.image  ;;
  }


  measure: count {
    type: count
    drill_fields: []
  }
}
