class Api::TravelPlans::Index < ApiAction
  get "/travel_plans" do
    travel_plans = TravelPlanQuery.new
    json TravelPlanSerializer.for_collection(travel_plans)
  end
end
