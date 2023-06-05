# frozen_string_literal: true

module Zadanka
  class Zadanie13Query
    def initialize; end
    # Z kolekcji Title usuń dokumenty, które reprezentują filmy wyprodukowane przed 1989 rokiem. Ile takich
    # dokumentów zostało usuniętych
    def call

      title = Title.where({ "$expr" => { "$lt" => [
        {
          "$convert": {
            input: "$startYear",
            to: "int",
            onError: nil,
            onNull: nil
          }
        }, 1989]}})

      # title.delete_all
      { result: :success, "message": "Deleted: #{title.size}" }
    end
  end
end
