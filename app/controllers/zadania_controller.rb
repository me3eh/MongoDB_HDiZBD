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


    return render :show if id == 8

    json_output = instance_eval("Zadanka::Zadanie#{id}Query.new.call")
    render json: json_output
  end

  def zadanie8
    # result = Zadanka::Zadanie8Query.new(params: params).call
    #
    # if result[:result] == :failure
    #   @message = result[:message]
    #   return render turbo_stream: turbo_stream.append("generate-lol", partial: "zadania/zadanie8_failure_answer")
    # else
    #
    #
    #   @title = result[:title]
    #   @year = result[:year]
    #   @rating = result[:rating]
    @message = " dupa"
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("generate-lol", partial: "zadanie8_failure_answer")
      end
    end
    # end
  end
end
