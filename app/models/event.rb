class Event < ApplicationRecord
  include ::AlgoliaSearch

  algoliasearch per_environment: true, enqueue: true do
    # list of attribute used to build an Algolia record
    attributes :title, :description, :starts_at, :ends_at, :category, :state, :image_url

    # the `searchableAttributes` (formerly known as attributesToIndex) setting defines the attributes
    # you want to search in: here `title`, `subtitle` & `description`.
    # You need to list them by order of importance. `description` is tagged as
    # `unordered` to avoid taking the position of a match into account in that attribute.
    searchableAttributes ['title', 'unordered(description)']
    attributesToSnippet %w[description]

    # the `customRanking` setting defines the ranking criteria use to compare two matching
    # records in case their text-relevance is equal. It should reflect your record popularity.
    customRanking ['desc(starts_at)']
  end
end
