class Name
  include Mongoid::Document
  include Mongoid::Timestamps
  field :nconst, type: String
  field :primaryName, type: String
  field :birthYear, type: String
  field :deathYear, type: String
  field :primaryProfession, type: String
  field :knownForTitles, type: String

  index({ primaryName: 1 })
  index({ birthYear: -1 })
end
