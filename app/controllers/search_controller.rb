class SearchController < ApplicationController
  def index
    @search = WordFacade.new(params[:search])
  end
end
