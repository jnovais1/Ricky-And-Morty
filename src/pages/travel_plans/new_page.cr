class TravelPlans::NewPage < MainLayout
  needs operation : SaveTravelPlan
  quick_def page_title, "New TravelPlan"

  def content
    h1 "New TravelPlan"
    render_travel_plan_form(operation)
  end

  def render_travel_plan_form(op)
    form_for TravelPlans::Create do
      # Edit fields in src/components/travel_plans/form_fields.cr
      mount TravelPlans::FormFields, op

      submit "Save", data_disable_with: "Saving..."
    end
  end
end
