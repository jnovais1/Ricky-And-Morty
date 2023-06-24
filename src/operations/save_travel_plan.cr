class SaveTravelPlan < TravelPlan::SaveOperation
  permit_columns travel_stops


end
