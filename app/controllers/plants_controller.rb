class PlantsController < ApplicationController
    def index 
        plants = Plant.all
        render json: plants, except: [:created_at, :updated_at]
    end

    def show
        plant = Plant.find(params[:id])
        render json: plant
    end

    def create
        new_plant = Plant.create(new_plant_desc)
        render json: new_plant, status: :created
    end

    private

    def new_plant_desc
        params.permit(:name, :image, :price)
    end
end
