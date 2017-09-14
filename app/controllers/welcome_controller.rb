class WelcomeController < ApplicationController
  def index
    if params[:title]
      @results = ModelForMyApi.retrieve_results(params[:title])
    end
  end

  def create
    redirect_to '/welcome/index?title=' + params[:email]
  end

end
