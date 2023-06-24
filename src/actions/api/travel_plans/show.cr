class Api::TravelPlans::Show < ApiAction
  get "/travel_plans/:id" do
    travel_plan = TravelPlanQuery.new.find(id)
    
    json TravelPlanSerializer.new(travel_plan)
  end
end
