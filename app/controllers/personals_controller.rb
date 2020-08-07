class PersonalsController < ApplicationController
  skip_before_action :verify_authenticity_token  
  before_action :initial_setup, only: [:index]
  before_action :set_personal, only: [:show, :edit, :update, :destroy]
  

  def index
    @personals = Personal.all
    render json: @personals
  end

  def show
    render json: @personal
  end

  def create
    @personal = Personal.new(personal_params)

    if @personal.save
      render json: @personal, status: :created, location: @personal
    else
      render json: @personal.errors, status: :unprocessable_entity
    end

  end

  def destroy
    @personal.destroy
  end

  private
  def set_personal
    @personal = Personal.find(params[:id])
  end

  def personal_params
    params.require(:personal).permit(:name, :last_name, :area, :years)
  end

  def initial_setup
    new_personal = [
      {name: "Nicolle", last_name: "Quispe", area:"T.I", years: 20},
      {name: "Aracely", last_name: "Arotinco", area:"T.I", years: 10},
      {name: "Fiorella", last_name: "Michelle", area:"RR.HH", years: 5},
      {name: "Bryan", last_name: "David", area:"RR.HH", years: 3},
    ] 
    new_personal.each{|employee| Personal.create(employee)}
  end
end
