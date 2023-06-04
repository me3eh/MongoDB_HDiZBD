class Rating
  include Mongoid::Document
  include Mongoid::Timestamps
  field :tconst, type: String
  field :averageRating, type: Float
  field :numVotes, type: Integer
  belongs_to :title, foreign_key: :tconst, primary_key: :tconst
  # embedded_in :title
end
