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
    sql: ${TABLE}.image  ;;
  }

  measure: image_pivot {
    html: <img height="400px" src="https://storage.cloud.google.com/brick-layer-testing/bogus_test/{{ image._value}}"/> ;;
    type: sum
    sql: 1 ;;
  }

  dimension: run_time {
    hidden: yes
    type: number
    sql:  ${TABLE}.run_time ;;
  }

  dimension: render_task_run_time {
    sql: CONCAT(${run_time}, ' ', "sec") ;;
  }


  measure: count {
    type: count
    drill_fields: []
  }
}
