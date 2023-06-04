# frozen_string_literal: true

module Zadanka
  class Zadanie7Query
    def initialize; end


    # Dla każdego filmu (kolekcja Title), który ma najwyższą średnią ocenę (10.0), dodaj pole max z wartością równą
    # 1. W poleceniu skorzystaj z kolekcji Rating, która zawiera informacje o średniej ocenie filmu.
    #
    def call
      ratings = Rating.where(averageRating: 10.0).pluck(:tconst)
      Title.where(tconst: { "$in": ratings }).update_all(max: 1)
      { size_of_changed: Title.where(max: 1).size }
    end
  end
end
