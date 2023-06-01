class Rating
  include Mongoid::Document
  include Mongoid::Timestamps
  field :tconst, type: String
  field :averageRating, type: Float
  field :numVotes, type: Integer
end
