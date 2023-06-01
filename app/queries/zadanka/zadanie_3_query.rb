# frozen_string_literal: true
module Zadanka
  class Zadanie3Query
    def initialize; end

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
