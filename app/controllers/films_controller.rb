class FilmsController < ApplicationController
  before_action :set_film, only: %i[ show edit update destroy ]

  # GET /films or /films.json
  def index
    @films = user_signed_in? ? Film.sorted : Film.published.sorted
  end

  # GET /films/1 or /films/1.json
  def show
    film_ids = user_signed_in? ? Film.pluck(:id) : Film.published.pluck(:id)
    current_index = film_ids.index(@film.id)
    previous_id = film_ids[current_index - 1] if current_index > 0
    next_id = film_ids[current_index + 1] if current_index < film_ids.length - 1
    render :show, locals: { previous_id: previous_id, next_id: next_id }

  end

  # GET /films/new
  def new
    @film = Film.new
  end

  # GET /films/1/edit
  def edit
  end

  # POST /films or /films.json
  def create
    @film = Film.new(film_params)

    respond_to do |format|
      if @film.save
        format.html { redirect_to film_url(@film), notice: "Film was successfully created." }
        format.json { render :show, status: :created, location: @film }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /films/1 or /films/1.json
  def update
    respond_to do |format|
      if @film.update(film_params)
        format.html { redirect_to film_url(@film), notice: "Film was successfully updated." }
        format.json { render :show, status: :ok, location: @film }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /films/1 or /films/1.json
  def destroy
    film_id = @film.id
    Review.where(film_id: film_id).destroy_all
    @film.destroy

    respond_to do |format|
      format.html { redirect_to films_url, notice: "Film and it's associated reviews were successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_film
      @film = Film.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def film_params
      params.require(:film).permit(:poster, :title, :language, :gist, :can_watch, :run_time, :published_at)
    end
end
