class TravelPlans::ShowPage < MainLayout
  needs travel_plan : TravelPlan
  quick_def page_title, "TravelPlan with id: #{travel_plan.id}"

  def content
    link "Back to all TravelPlans", TravelPlans::Index
    h1 "TravelPlan with id: #{travel_plan.id}"
    render_actions
    render_travel_plan_fields
  end

  def render_actions
    section do
      link "Edit", TravelPlans::Edit.with(travel_plan.id)
      text " | "
      link "Delete",
        TravelPlans::Delete.with(travel_plan.id),
        data_confirm: "Are you sure?"
    end
  end

  def render_travel_plan_fields
    ul do
      li do
        text "travel_stops: "
        strong travel_plan.travel_stops.to_s
      end
    end
  end
end
