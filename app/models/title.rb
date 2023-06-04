class Title
  include Mongoid::Document
  include Mongoid::Timestamps
  field :tconst, type: String
  field :titleType, type: String
  field :primaryTitle, type: String
  field :originalTitle, type: String
  field :isAdult, type: String
  field :startYear, type: String
  field :endYear, type: String
  field :runtimeMinutes, type: String
  field :genres, type: String
  has_one :rating, foreign_key: :tconst, primary_key: :tconst
end
