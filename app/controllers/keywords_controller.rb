class KeywordsController < ApplicationController

  def show
    @keywords = Keyword.all

    render json: @keywords.as_json

    # render json: { "keywords" => @keywords.map do |keyword|
    #                   keyword.as_json
    #                 end
    #              }
  end
end
