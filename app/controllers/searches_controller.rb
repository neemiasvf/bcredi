class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy, :update_results]
  after_action :get_results, only: [:create, :update, :update_results]

  def index
    @searches = Search.all
  end

  def show
    @search_result_count = @search.results.count
  end

  def new
    @search = Search.new
  end

  def edit
  end

  def create
    @search = Search.new(search_params)
    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'Search was successfully created.' }
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :new }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { render :show, status: :ok, location: @search }
      else
        format.html { render :edit }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_results
    respond_to do |format|
      format.html { redirect_to @search, notice: 'Search results were successfully updated.' }
      format.json { render :show, status: :ok, location: @search }
    end
  end

  def get_results
    ## Merging results
    # Since GitHub's API does not consistently support searching repositories written in a given set of languages at once,
    # it's necessary to search once for each language and then merge all results into one.
    @search.results = []
    @search.languages.each do |language|
      git_response = JSON.parse(RestClient.get "#{Search::API_URL}search/repositories?q=language=#{language}&sort=stars", {content_type: :json, accept: :json})
      @search.results += git_response["items"]
    end

    # Sort all items from all chosen languages by the numbers of stars given
    @search.results.sort_by { |item| item["stargazers_count"] }
    @search.save
  end

  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url, notice: 'Search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_search
    @search = Search.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def search_params
    params.require(:search).permit(:name, languages: [])
  end
end
