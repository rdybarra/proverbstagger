class VersesController < ApplicationController

  def show
    @verse = Verse.find(params[:verse_id])
    render nothing: true
  end

  def apply_keyword
    @verse = Verse.find(params[:verse_id])

    @keyword = Keyword.where('value = ?', params[:keyword][:value]).take(1).first

    unless @keyword.present?
      @keyword = Keyword.new
      @keyword.value = params[:keyword][:value]
      @keyword.save
    end

    @association = @verse.keyword_associations.where('keyword_id = ?', @keyword.id).take(1).first

    unless @association.present?
      @association = KeywordAssociation.new
      @association.verse_id = @verse.id
      @association.keyword_id = @keyword.id
      @association.count = 1
      @verse.keyword_associations << @association
    else
      @association.count = @association.count + 1
      @association.save
    end

    @verse.save

    render nothing: true
  end

end