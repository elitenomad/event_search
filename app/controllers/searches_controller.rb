class SearchesController < ApplicationController
  def index
    render :index, locals: {
      index_name: Event.algolia_index_name,
    }
  end
end
