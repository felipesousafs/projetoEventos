module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def generic_filter(filtering_params)
      results = self.where(nil)
      filtering_params.each do |key, value|
        if key == 'search_content'
          results = results.public_send('search_filter', value).uniq if value.present?
        else
          results = results.public_send(key, value) if value.present?
        end
      end
      results
    end

    def filter(params)
      results = self.where(nil)
      puts params
      if params[:search_content]
        results = results.public_send('search_filter', params[:search_content]) if params[:search_content].present?
      end
      if params[:contains_tags].to_a.size > 1
        results = results.public_send('contains_tags', params[:contains_tags]) if params[:contains_tags].present?
      end
      results
    end
  end
end