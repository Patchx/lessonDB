class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :destroy]
  before_action :trim_list

  # GET /searches
  # GET /searches.json
  def index
    @searches = Search.all
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
    @results = Lesson.fuzzy_search(@search.query)
    @lessons = Lesson.all
  end

  # GET /searches/new
  def new
    @search = Search.new
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.new(search_params)

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search }
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :new }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    @search = Search.new(search_params)
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to @search }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
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
      params.require(:search).permit(:query, :user_id)
    end

    # Deletes the first search in the list if search list gets too big
    def trim_list
      @searches = Search.all
      @searches[0].destroy if @searches.length > 1000
    end
end
