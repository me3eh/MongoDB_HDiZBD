# frozen_string_literal: true
class ZadaniaController < ApplicationController
  def index
  end

  def show
    id = params[:id].to_i
    return render json: { message: "wrong number amigo. From 1 to 17"} if id > 17 || id < 1

    json_output = instance_eval("Zadanka::Zadanie#{id}Query.new.call")
    render json: json_output
  end
end
