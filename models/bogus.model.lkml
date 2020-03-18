connection: "brick-layer"

# include all the views
include: "/views/**/*.view"

explore: campaign {
  join: subscription_event {
    sql_on: ${campaign.id} = ${subscription_event.campaign_id} ;;
    relationship: one_to_many
    type: full_outer
  }
}
