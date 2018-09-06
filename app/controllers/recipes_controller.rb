class RecipesController < ApplicationController
    def show
        id = params[:id]
        @recipe = Recipe.find(id)
    end

    def new
    end

    def create
        # receber os dados do formulário
        recipe_params = params.require(:recipe).permit(:title, :recipe_type,
                                                         :cuisine, :difficulty,
                                                         :cook_time, :ingredients,
                                                         :cook_method)
        # criar a receita em si
        @recipe = Recipe.new(recipe_params)
        if (@recipe.save)        
            #redirecionar para a receite recem criada
            redirect_to recipe_path(@recipe.id)
        else
            render 'new'
        end
    end

    def edit
        id = params[:id]
        @recipe = Recipe.find(id)        
    end

    def update
        # receber os dados do formulário
        recipe_params = params.require(:recipe).permit(:title, :recipe_type,
                                                         :cuisine, :difficulty,
                                                         :cook_time, :ingredients,
                                                         :cook_method) 
        # atualiza a receita em si
        id = params[:id]
        @recipe = Recipe.find(id)
        if(@recipe.update(recipe_params))
            #redirecionar para a receite recem atualizada
            redirect_to recipe_path(@recipe.id)
        else
        render 'edit'
        end
    end
end