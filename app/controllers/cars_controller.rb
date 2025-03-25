class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

    def index 
        @cars= Car.all
    end
    def new
      @car = Car.new  # Initializes a new instance of Car
    end
    def create
      @car = Car.new(car_params)
      if @car.save
        redirect_to new_car_path, notice: 'Car was successfully created.'
      else
        render :new
      end
    end
      def show
        @car = Car.find(params[:id])
      end
      def edit
        @car = Car.find(params[:id])
      end
    
      # Update an existing car's details in the database
      def update
        @car = Car.find(params[:id])
        if @car.update(car_params)
          redirect_to @car
        else
          render :edit
        end
      end

      def destroy
        @car = Car.find(params[:id])
        if @car.destroy
          flash[:notice] = 'Car was successfully deleted.'
        else
          flash[:alert] = 'There was an error deleting the car.'
        end
        redirect_to cars_path
      end
  
    
      private
      def set_car
        @car = Car.find(params[:id])
      end
      # Strong parameters for creating/updating a car
      def car_params
        params.require(:car).permit(:price)  # Adjust the permitted attributes as needed
      end
end
