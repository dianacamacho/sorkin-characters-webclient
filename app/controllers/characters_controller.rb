class CharactersController < ApplicationController

  def index

    @characters = Character.all

  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Unirest.new
  end

  def create
    @character = Unirest.post("http://localhost:3000/characters", headers:{"Accept" => "application/json"}, parameters:{first_name: params[:first_name], last_name: params[:last_name], job_title: params[:job_title], actor_first_name: params[:actor_first_name], actor_last_name: params[:actor_last_name], show: params[:show]}).body
  
    render :show
  end

  def edit
    @character = Unirest.get("http://localhost:3000/characters/#{params[:id]}").body
  end

  def update
    @character = Unirest.get("http://localhost:3000/characters/#{params[:id]}").body
    @character = Unirest.patch("http://localhost:3000/characters/#{params[:id]}", headers:{"Accept" => "application/json"}, parameters:{first_name: params[:first_name], last_name: params[:last_name], job_title: params[:job_title], actor_first_name: params[:actor_first_name], actor_last_name: params[:actor_last_name], show: params[:show]}).body

    render :show
  end

  def destroy
    @character = Character.destroy(params[:id])
  
    redirect_to "/characters"
  end

end
