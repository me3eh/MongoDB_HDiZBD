# frozen_string_literal: true
class ZadaniaController < ApplicationController
  def index
  end

  def show
    id = params[:id].to_i
    if id > 13 || id < 1
      return render json: { message: "wrong number amigo. From 1 to 13 EXCEPT FOR 6, 8" }
    end

    return render json: { message: "It's change in model" } if id == 6


    @message = "siku"
    return render :show if id == 8

    json_output = instance_eval("Zadanka::Zadanie#{id}Query.new.call")
    render json: json_output
  end

  def zadanie8_show

  end

  def zadanie8
    result = Zadanka::Zadanie8Query.new(params: params).call

    if result[:result] == :failure
      @message = result[:message]
      render :zadanie8_failure_answer
    else
      @title = result[:title]
      @year = result[:year]
      @rating = result[:rating]
      render :zadanie8_success_answer
    end
  end
end
