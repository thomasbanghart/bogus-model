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

  dimension: test_dimension {
    type: string
    sql: "test" ;;
  }

  dimension: block_name2 {
    label: "Block Name"
    group_label: "ERD"
    type: string
    sql: ${TABLE}.name ;;
    action: {
      label: "Make Recipes"
      icon_url: "https://cdn.shopify.com/s/files/1/1061/1924/products/100_Emoji_large.png?v=1571606035"
      url: "https://us-central1-spencer-white-tckt87992.cloudfunctions.net/createbogus-1"
      form_param: {
        name: "filename"
        type: string
        label: "ERD Filename (.tsv)"
        required: yes
        default: "{{ value }}"
      }
    }
  }

  dimension: block_name3 {
    label: "Block Name (Dashboards)"
    type: string
    sql: ${TABLE}.name ;;
    action: {
      label: "Make Dashboards"
      icon_url: "https://cdn.shopify.com/s/files/1/1061/1924/products/100_Emoji_large.png?v=1571606035"
      url: "https://us-central1-spencer-white-tckt87992.cloudfunctions.net/makepdfs"
      form_param: {
        label: "Dataset"
        name: "dataset"
        type: string
        required: yes
      }
      form_param: {
        label: "Variant Case"
        name: "modelbogus"
        type: string
        required: yes
        default: "{case: many_to_one | one_to_many }"
      }
      form_param: {
        label: "Add or replace dashboards?"
        name: "reset_db"
        type: select
        required: yes
        option: {
          label: "Add"
          name: "add"
        }
        option: {
          label: "Replace"
          name: "replace"
        }
      }
    }
  }


  measure: block_count {
    type: count
    drill_fields: [id, block_name]
  }
}
