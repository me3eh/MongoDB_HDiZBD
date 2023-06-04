# frozen_string_literal: true
module Zadanka
  class Zadanie2Query
    def initialize; end

    # Wybierz 5 pierwszych dokumentów z kolekcji Title, które były wyprodukowane w roku 2010, są z kategorii
    # filmów Romance, ich czas trwania jest większy niż 90 minut, ale nie przekracza 120 minut. Zwracane dokumenty
    # powinny zawierać tytuł, rok produkcji, kategorię oraz czas trwania. Dane uporządkuj rosnąco wg tytułu filmu.
    #   Sprawdź również, ile dokumentów zwróciłoby zapytanie po wyłączeniu ograniczenia w postaci 5 pierwszych
    # dokumentów. Wyszukując łańcuchy skorzystaj z operatora $regex.
    def call
      query_result = Title.only(:primaryTitle, :startYear, :genres, :runtimeMinutes)
                          .where(startYear: "2010")
            .where({ "$expr" => { "$gte" => [{ "$toInt" => "$runtimeMinutes" }, 90]}})
           .where({ "$expr" => { "$lt" => [{ "$toInt" => "$runtimeMinutes" }, 120] }})
           .where({ genres: { "$regex": /Romance/ } })
           .order_by("primaryTitle" => 1)
      {
        first_5: query_result.first(5).map(&:attributes),
        size_of_all: query_result.size
      }
    end
  end
end
