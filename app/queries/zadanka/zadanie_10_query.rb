# frozen_string_literal: true

module Zadanka
  class Zadanie10Query
    def initialize; end
    # Zmodyfikuj pole rating w dokumencie z Zadania 9, dodając jeszcze jeden dokument z polami
    # averageRating oraz numVotes oraz z wartościami: 10 oraz 12345
    def call
      title = Title.find_by(primaryTitle: "Blade Runner", startYear: "1982")
      { result: :failure, "message": "Blade Runner does not exist" } if title.nil?

      title.update("rating2": [ title["rating2"], { averageRating: 10, numVotes: 12345 } ] )
      { result: :success, "message": "Succesfully updated rating for Blade Runner" }
    end
  end
end
