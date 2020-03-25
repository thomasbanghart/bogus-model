connection: "brick-layer"

# include all the views
include: "/views/**/*.view"
include: "/*.dashboard.lookml"

explore: blocks {
  join: recipes {
    view_label: "Blocks"
    sql_on: ${blocks.block_name} = JSON_EXTRACT_SCALAR(${recipes.field_recipe}, '$.block') ;;
    relationship: one_to_many
  }
}
