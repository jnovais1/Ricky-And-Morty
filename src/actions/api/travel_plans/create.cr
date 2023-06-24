class Api::TravelPlans::Create < ApiAction
  post "/travel_plans" do 
    travel_stops = params.from_json["travel_stops"]
    new_travel = SaveTravelPlan.create!(travel_stops: travel_stops)

    if new_travel
      response.status = HTTP::Status::CREATED
      response.content_type = "application/json"
      json(TravelPlanSerializer.new(new_travel))
    else
      head 400
    end
  end
end
