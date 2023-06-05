# frozen_string_literal: true
module Zadanka
  class Zadanie4Query
    def initialize; end

    # W oparciu o kolekcje Title oraz Rating sprawdź średnią ocenę filmów dokumentalnych wprodukowanych w
    # latach 1999-2000. Wyświetl tytuł filmu, rok produkcji oraz jego średnią ocenę. Dane uporzadkuj malejąco wg
    # średniej oceny.
    #  sprawdź, ile takich dokumentów zwróci zapytanie
    #  wyświetl tylko 5 pierwszych dokumentów spełniających powyższe warunki
    def call
      titles = Title.includes(:rating).where(startYear: { "$in": ["1999", "2000"] })
                    .sort_by {|obj| obj.rating&.averageRating.to_f }.reverse

      final_json = [].tap do |arr|
        titles.each.with_index do |title, index|
          arr << { title: title.primaryTitle, year: title.startYear, rating: title.rating&.averageRating }
        end
      end
      {
        first_5: final_json.first(5),
        size: final_json.size
      }
    end
  end
end
