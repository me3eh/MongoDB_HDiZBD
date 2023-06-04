# frozen_string_literal: true
module Zadanka
  class Zadanie1Query
    def initialize; end

    # Sprawdź liczbę dokumentów w kolekcjach Title/Rating/Name.
    def call
      { name_size: Name.all.size, title_size: Title.all.size, rating_size: Rating.all.size}
    end
  end
end
