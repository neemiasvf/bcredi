class Search < ApplicationRecord
  API_URL = "https://api.github.com/".freeze

  validates :languages, presence: true

  before_save :get_results

  def get_results
    ## Merging results
    # Since GitHub's API does not consistently support searching repositories written in a given set of languages at once,
    # it's necessary to search once for each language and then merge all results into one.
   self[:results] = []
    self[:languages].each do |language|
      git_response = JSON.parse(RestClient.get "#{Search::API_URL}search/repositories?q=language=#{language}&sort=stars", {content_type: :json, accept: :json})
      self[:results] += git_response["items"]
    end

    # Sort all items from all chosen languages by the numbers of stars given
   self[:results].sort_by! { |result| result["stargazers_count"] }
   self[:results].reverse!
  end
end
