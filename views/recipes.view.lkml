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

  measure: recipe_count {
    type: count
    drill_fields: []
  }
}
