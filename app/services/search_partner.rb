# frozen_string_literal: true

class SearchPartner
  def initialize(query)
    @search_params = query.split(' ')
  end

  def search
    Partner.joins(:services).where((search_columns.map do |c|
                                      "#{c} like ?"
                                    end * @search_params.length).join(' OR '), *search_params.map do |key|
                                                                                 "%#{key}%"
                                                                               end).uniq
  end

  private

  def search_params
    ([@search_params] * search_columns.length).inject(&:zip).flatten
  end

  def search_columns
    %w[first_name last_name company description location services.name]
  end
end
