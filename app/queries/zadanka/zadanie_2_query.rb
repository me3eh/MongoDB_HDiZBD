# frozen_string_literal: true
module Zadanka
  class Zadanie2Query
    def initialize; end

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
