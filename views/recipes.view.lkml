view: recipes {
  sql_table_name: `spencer-white-tckt87992.bogus.recipes`
    ;;

  dimension: field_recipe {
    primary_key: yes
    type: string
    sql: ${TABLE}.recipe ;;
    action: {
      label: "Modify Recipe"
      icon_url: "https://cdn.shopify.com/s/files/1/1061/1924/products/100_Emoji_large.png?v=1571606035"
      url: "https://us-central1-spencer-white-tckt87992.cloudfunctions.net/modifyrecipe"
      form_param: {
        name: "updated"
        type: textarea
        label: "Recipe"
        required: yes
        default: "{{ value }}"
      }
    }
  }

  dimension: table_name {
    type: string
    sql: JSON_EXTRACT_SCALAR(${recipes.field_recipe}, '$.table_name') ;;
  }
  dimension: field_name {
    type: string
    sql: JSON_EXTRACT_SCALAR(${recipes.field_recipe}, '$.field_name') ;;
  }
  dimension: dist {
    type: string
    sql: JSON_EXTRACT_SCALAR(${recipes.field_recipe}, '$.dist') ;;
  }
  dimension: fk_type {
    type: string
    sql: JSON_EXTRACT_SCALAR(${recipes.field_recipe}, '$.fk_type') ;;
  }

  measure: recipe_count {
    type: count
    drill_fields: []
  }
}
