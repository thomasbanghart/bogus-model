view: blocks {
  sql_table_name: `spencer-white-tckt87992.bogus.blocks`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    action: {
      label: "Make Data"
      url: "https://us-central1-spencer-white-tckt87992.cloudfunctions.net/makedata"
      form_param: {
        name: "filename"
        type: string
        label: "Bogus Filename"
        required: yes
        default: "{{ value }}"
      }
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
        name: "disp"
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


  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
