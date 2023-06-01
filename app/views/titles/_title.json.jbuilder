json.extract! title, :id, :tconst, :titleType, :primaryTitle, :originalTitle, :isAdult, :startYear, :endYear, :runtimeMinutes, :genres, :created_at, :updated_at
json.url title_url(title, format: :json)
