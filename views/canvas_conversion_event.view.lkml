view: canvas_conversion_event {
  sql_table_name: `brazedev.CANVAS_CONVERSION_EVENT`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: app_id {
    type: number
    sql: ${TABLE}.app_id ;;
  }

  dimension: canvas_conversion_behavior_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.canvas_conversion_behavior_id ;;
  }

  dimension: canvas_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.canvas_id ;;
  }

  dimension: canvas_step_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.canvas_step_id ;;
  }

  dimension: canvas_updated_at {
    type: string
    sql: ${TABLE}.canvas_updated_at ;;
  }

  dimension: canvas_variation_id {
    type: number
    sql: ${TABLE}.canvas_variation_id ;;
  }

  dimension: external_user_id {
    type: number
    sql: ${TABLE}.external_user_id ;;
  }

  dimension: time {
    type: string
    sql: ${TABLE}.time ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      canvas_conversion_behavior.id,
      canvas_step.canvas_step_name,
      canvas_step.id,
      canvas.name,
      canvas.id
    ]
  }
}
