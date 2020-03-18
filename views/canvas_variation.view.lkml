view: canvas_variation {
  sql_table_name: `brazedev.CANVAS_VARIATION`
    ;;

  dimension: canvas_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.canvas_id ;;
  }

  dimension: canvas_updated_at {
    type: string
    sql: ${TABLE}.canvas_updated_at ;;
  }

  dimension: name {
    type: number
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [name, canvas.name, canvas.id]
  }
}
