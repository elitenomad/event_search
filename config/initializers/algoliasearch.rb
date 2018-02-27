AlgoliaSearch.configuration = { application_id: ENV['ALGOLIA_APPLICATON_ID'], api_key: ENV['ALGOLIA_API_KEY'] }


AlgoliaSearch::AlgoliaJob.class_eval do
  retry_on Algolia::AlgoliaProtocolError, wait: :exponentially_longer, attempts: 10
end