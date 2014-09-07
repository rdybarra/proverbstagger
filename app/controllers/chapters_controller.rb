class ChaptersController < ApplicationController

  def test
    render text: 'hi'
  end

  def view
    @verses = Verse.where("chapter = ?", params[:id])
    render json: { "verses" => @verses.map do |verse|
                      verse.as_json(
                        include: { keyword_associations: {
                           include: { keyword: {
                                        only: :value } },
                           #only: :count } }
                           } }
                      )
                    end
                 }
  end

end
