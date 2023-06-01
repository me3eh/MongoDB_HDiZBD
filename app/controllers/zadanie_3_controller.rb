# frozen_string_literal: true
class Zadanie2Controller < ApplicationController
  # Wybierz 5 pierwszych dokumentów z kolekcji Title, które były wyprodukowane w roku 2010, są z kategorii
  # filmów Romance, ich czas trwania jest większy niż 90 minut, ale nie przekracza 120 minut. Zwracane dokumenty
  # powinny zawierać tytuł, rok produkcji, kategorię oraz czas trwania. Dane uporządkuj rosnąco wg tytułu filmu.
  # Sprawdź również, ile dokumentów zwróciłoby zapytanie po wyłączeniu ograniczenia w postaci 5 pierwszych
  # dokumentów. Wyszukując łańcuchy skorzystaj z operatora $regex
  def index
    query_result = ::Zadanka::Zadanie2Query.new.call
    json = {
      first_5: query_result.first(5).pluck(:primaryTitle, :startTime, :genres, :runtimeMinutes),
      size_of_all: query_result.size
    }
    render json: json
  end
end
