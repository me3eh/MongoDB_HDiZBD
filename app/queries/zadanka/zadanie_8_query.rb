# frozen_string_literal: true

module Zadanka
  class Zadanie8Query
    def initialize(params:)
      @params = params[:title]
    end
    # W oparciu o kolekcje Title oraz Rating sprawdź średnią ocenę dowolnego filmu o określonym tytule oraz roku
    # produkcji. Zapytanie powinno zwrócić nazwę filmu, rok produkcji oraz średnią ocenę.
    def call
      title = Title.find_by(primaryTitle: @params[:title], startYear: @params[:year])
      if title.nil?
        return {
          result: :failure,
          message: "No title with name #{@params[:title]} and start year #{@params[:year]} found"
        }
      end
      {
        result: :success,
        title: title.primaryTitle,
        year: title.startYear,
        rating: title.rating&.averageRating
      }
    end
  end
end
