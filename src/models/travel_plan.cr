class TravelPlan < BaseModel
  table do
    column travel_stops : JSON::Any
  end
end
