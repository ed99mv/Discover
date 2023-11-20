class Api::V1::ToursController < ApplicationController
  before_action :set_tour, only: %i[ show update destroy galleries ]

  # GET /tours
  def index
    @tours = Tour.all

    render json: @tours.to_json(except: [:created_at, :updated_at])
  end

  # GET /tours/1
  def show
    render json: @tour.to_json(except: [:created_at, :updated_at])
  end

  # POST /tours
  def create
    @tour = Tour.new(tour_params)

    if @tour.save
      render json: @tour, status: :created, location: @tour
    else
      render json: @tour.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tours/1
  def update
    if @tour.update(tour_params)
      render json: @tour
    else
      render json: @tour.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tours/1
  def destroy
    @tour.destroy
  end
  
  #Llamar a las galerías por tours
  def galleries
    galleries = @tour.galleries
    render json: galleries.to_json(except: [:created_at, :updated_at])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tour_params
      params.fetch(:tour, {})
    end
end
