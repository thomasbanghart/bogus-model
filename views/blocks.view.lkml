view: blocks {
  sql_table_name: `spencer-white-tckt87992.bogus.blocks`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: block_name {
    label: "Block Name"
    type: string
    sql: ${TABLE}.name ;;
    action: {
      label: "Make Data"
      icon_url: "https://cdn.shopify.com/s/files/1/1061/1924/products/100_Emoji_large.png?v=1571606035"
      url: "https://us-central1-spencer-white-tckt87992.cloudfunctions.net/makedata"
      form_param: {
        name: "dataset"
        type: string
        label: "Dataset Name"
        required: yes
        default: "{{ value }}"
      }
      form_param: {
        name: "modelbogus"
        type: textarea
        label: "Model Bogus"
        required: yes
        default: "
{
  \".\": 100
}"
      }
      form_param: {
        name: "mode"
        type: select
        label: "Append or Drop&Replace"
        required: yes
        option: {
          label: "Append"
          name: "w+"
        }
        option: {
          label: "Drop&Replace"
          name: "w"
        }
      }
    }
  }

  dimension: block_name2 {
    label: "Block Name"
    group_label: "ERD"
    type: string
    sql: ${TABLE}.name ;;
    action: {
      label: "Make Recipes"
      icon_url: "https://cdn.shopify.com/s/files/1/1061/1924/products/100_Emoji_large.png?v=1571606035"
      url: "https://us-central1-spencer-white-tckt87992.cloudfunctions.net/createbogus"
      form_param: {
        name: "filename"
        type: string
        label: "ERD Filename (.tsv)"
        required: yes
        default: "{{ value }}"
      }
    }
  }


  measure: block_count {
    type: count
    drill_fields: [id, block_name]
  }
}
