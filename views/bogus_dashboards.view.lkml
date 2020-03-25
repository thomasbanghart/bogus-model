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

  dimension: png {
    type: string
    html: <img src="data:image/png;base64,{{value}}"/> ;;
    sql: ${TABLE}.png  ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
