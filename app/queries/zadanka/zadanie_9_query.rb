# frozen_string_literal: true

module Zadanka
  class Zadanie9Query
    def initialize; end
    # Do filmu Blade Runner z roku 1982 dodaj pole rating, które będzie tablicą dokumentów z polami:
    # averageRating oraz numVotes. Wartości pól w zagnieżdżonym dokumencie powinny posiadać odpowiednie
    # wartości pobrane z kolekcji Rating.
    def call
      title = Title.find_by(primaryTitle: "Blade Runner", startYear: "1982")
      { result: :failure, "message": "Blade Runner does not exist" } if title.nil?

      title.update("rating2": { averageRating: title.rating.averageRating, numVotes: title.rating.numVotes })
      { result: :success, "message": title }
    end
  end
end
