class HomeController < ApplicationController
    def welcome
        @recipes = Recipe.all
    end
end