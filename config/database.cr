database_name = "multiverse_travels_booker"

AppDatabase.configure do |settings|
    settings.credentials = Avram::Credentials.parse(ENV["DATABASE_URL_ENV"]) 
end

Avram.configure do |settings|
  settings.database_to_migrate = AppDatabase

  # In production, allow lazy loading (N+1).
  # In development and test, raise an error if you forget to preload associations
  settings.lazy_load_enabled = LuckyEnv.production?

  # Always parse `Time` values with these specific formats.
  # Used for both database values, and datetime input fields.
  # settings.time_formats << "%F"
end
