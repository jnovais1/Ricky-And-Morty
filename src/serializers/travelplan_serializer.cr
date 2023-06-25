class TravelPlanSerializer < BaseSerializer
  def initialize(@travel_plan : TravelPlan)
  end

  def self.collection_key
    "travel_plans"
  end

  def self.object_key
    "travel_plan"
  end

  def render
    {
      id: @travel_plan.id,
      travel_stops: @travel_plan.travel_stops
    }
  end
end