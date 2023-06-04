# frozen_string_literal: true

module Zadanka
  class Zadanie12Query
    def initialize; end
    # Do filmu Pan Taduesz z 1999 roku dodaj pole avgRating z wartością 9.1. Jeśli nie ma takiego filmu,
    # polecenie powinno zadziałać jak upsert
    def call
      title = Title.find_or_create_by(primaryTitle: "Pan Tadeusz", startYear: "1999")
      title.update("avgRating": 9.1)

      { result: :success, "message": "Succesfully updated rating for Pan Tadeusz" }
    end
  end
end
