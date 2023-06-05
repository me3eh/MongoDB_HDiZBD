# frozen_string_literal: true

module Zadanka
  class Zadanie5Query
    def initialize; end

    # Utwórz indeks tekstowy dla pola primaryName w kolekcji Name. Następnie używając tego indeksu znajdź
    # dokumenty opisujące osoby o nazwisku Fonda oraz Coppola. Przy wyszukiwaniu włącz opcję, która będzie
    # uwzględniać wielkie/małe litery.
    #   a) Ile dokumentów zwraca zapytanie?
    # b) Wyświetl 5 pierwszych dokumentów (dokument powinien zwracać dwa pola: primaryName,
    #                                                                    primaryProfession).
    #
    #
    #
    #
    # Index jest w modelu name
    def call
      names = Name.only(:primaryName, :primaryProfession).where({primaryName: /fonda|coppola/i })

      { first_5: names.first(5).map(&:attributes), size: names.size }
    end
  end
end
