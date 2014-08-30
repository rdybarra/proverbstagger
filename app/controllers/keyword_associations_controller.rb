class KeywordAssociationsController < ApplicationController

  def filter
    @keyword = Keyword.where('value = ?', params[:keyword]).first
    @verses = Array.new


    if @keyword.present?
      @keyword.keyword_associations.each do |association|
        @verses << association.verse
      end
    end

    render json: { "verses" => @verses.map do |verse|
                      verse.as_json(
                        include: { keyword_associations: {
                           include: { keyword: {
                                        only: :value } },
                           only: :count } }
                      )
                    end
                 }
  end
end
