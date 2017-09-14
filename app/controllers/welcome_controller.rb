class WelcomeController < ApplicationController
  def index
    #@results = ModelForMyApi.retrieve_results("Jack+Reacher")
    if params[:title]
      @results = ModelForMyApi.retrieve_results(params[:title])
    end
  end

  def create
    #@results = ModelForMyApi.retrieve_results("a")
    #redirect_to '/welcome/index?title=a'
    #@title = @article.title
    redirect_to '/welcome/index?title=' + params[:title]
  end

end
