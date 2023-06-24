class TravelPlans::FormFields < BaseComponent
  needs operation : SaveTravelPlan

  def render
    mount Shared::Field, operation.travel_stops, &.text_input(autofocus: "true")
  end
end
