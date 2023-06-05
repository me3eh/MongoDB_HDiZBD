# frozen_string_literal: true

module Zadanka
  class Zadanie11Query
    def initialize; end
    # Usuń pole rating dodane do filmu Blade Runner w Zadaniu 10.
    def call
      title = Title.find_by(primaryTitle: "Blade Runner", startYear: "1982")
      { result: :failure, "message": "Blade Runner does not exist" } if title.nil?

      title.update("rating2": title["rating2"][0])
      { result: :success, "message": title }
    end
  end
end
