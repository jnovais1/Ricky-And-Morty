class TravelPlans::IndexPage < MainLayout
  needs travel_plans : TravelPlanQuery
  quick_def page_title, "All TravelPlans"

  def content
    h1 "All TravelPlans"
    link "New TravelPlan", to: TravelPlans::New
    render_travel_plans
  end

  def render_travel_plans
    ul do
      travel_plans.each do |travel_plan|
        li do
          link travel_plan.travel_stops, TravelPlans::Show.with(travel_plan)
        end
      end
    end
  end
end
