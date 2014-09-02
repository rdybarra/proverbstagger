class KeywordAssociationsController < ApplicationController

  def create
    @verse = Verse.find(params[:verse_id])

    @keyword = Keyword.where('value = ?', params[:keyword][:value]).take(1).first

    unless @keyword.present?
      @keyword = Keyword.new
      @keyword.value = params[:keyword][:value]
      @keyword.save
    end

    @association = KeywordAssociation.new
    @association.verse_id = @verse.id
    @association.keyword_id = @keyword.id
    @association.count = 1
    @association.ip_address = request.remote_ip
    @verse.keyword_associations << @association

    @verse.save

    render json: @association.as_json(
                  include: { keyword: {
                              only: :value
                             }
                           }
                 )
  end

  def update
    @association = KeywordAssociation.find(params[:id])

    @association.count = @association.count + 1
    @association.save
    
    render json: @association.as_json(
                  include: { keyword: {
                              only: :value
                             }
                           }
                 )
  end

  def delete
    @association = KeywordAssociation.find(params[:id])
    keyword_id = @association.keyword_id

    @association.destroy

    @associations = KeywordAssociation.where('keyword_id = ?', keyword_id)

    unless @associations.present?
       Keyword.find(keyword_id).destroy
    end

    render nothing: true
  end

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
