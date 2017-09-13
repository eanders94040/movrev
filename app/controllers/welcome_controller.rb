class WelcomeController < ApplicationController
  def index
    @results = ModelForMyApi.retrieve_results("Jack+Reacher")
  end
end
