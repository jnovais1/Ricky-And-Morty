class CreateTravelPlans::V20230621141057 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(TravelPlan) do
      primary_key id : Int32
      add travel_stops : JSON::Any
      add_timestamps
    end
  end

  def rollback
    drop table_for(TravelPlan)
  end
end
