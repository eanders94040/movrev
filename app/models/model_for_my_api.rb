# from https://stackoverflow.com/questions/29832088/third-party-api-data-for-ruby-on-rails-web-application

class ModelForMyApi < ActiveRecord::Base
    require 'rest-client'

    @url

    def self.getData
        response = RestClient.get(@url, { :content_type => :json, "Api-Key" => "put your API key here" })
    end

    def self.retrieve_results(myParameter)
         @url = "https://api.themoviedb.org/3/search/movie?api_key=921b46ffb500286a79d492f9a2546c74&query=#{myParameter}"
        JSON.parse(ModelForMyApi.getData)
    end
end

