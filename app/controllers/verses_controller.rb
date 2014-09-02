class VersesController < ApplicationController

  def show
    @verse = Verse.find(params[:verse_id])
    render nothing: true
  end

end