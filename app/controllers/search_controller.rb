class SearchController < ApplicationController
  def search
    @partners = SearchPartner.new(query_params[:query]).search
  end

  private

  def query_params
    params.permit(:query)
  end
end
