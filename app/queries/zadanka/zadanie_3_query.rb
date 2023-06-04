# frozen_string_literal: true
module Zadanka
  class Zadanie3Query
    def initialize; end

    # Sprawdź ile filmów różnego typu (pole titleType) było wprodukowanych w roku 2000. Wynik zapytania
    # powinien zwracać nazwę typu oraz liczbę filmów.
    def call
      result_grouped = Title.where({startYear: "2000"})
                         .collection.aggregate([{ "$group" => { "_id" => "$titleType", count:{"$sum"=>1} } }])
                         .first(100000)
      {
        values: result_grouped
      }
    end
  end
end
