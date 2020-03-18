view: card_extra {
  sql_table_name: `brazedev.CARD_EXTRA`
    ;;

  dimension: card_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.card_id ;;
  }

  dimension: card_updated_at {
    type: string
    sql: ${TABLE}.card_updated_at ;;
  }

  dimension: key {
    type: number
    sql: ${TABLE}.key ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [card.name, card.id]
  }
}
