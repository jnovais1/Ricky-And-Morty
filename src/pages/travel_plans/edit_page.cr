class TravelPlans::EditPage < MainLayout
  needs operation : SaveTravelPlan
  needs travel_plan : TravelPlan
  quick_def page_title, "Edit TravelPlan with id: #{travel_plan.id}"

  def content
    link "Back to all TravelPlans", TravelPlans::Index
    h1 "Edit TravelPlan with id: #{travel_plan.id}"
    render_travel_plan_form(operation)
  end

  def render_travel_plan_form(op)
    form_for TravelPlans::Update.with(travel_plan.id) do
      # Edit fields in src/components/travel_plans/form_fields.cr
      mount TravelPlans::FormFields, op

      submit "Update", data_disable_with: "Updating..."
    end
  end
end
