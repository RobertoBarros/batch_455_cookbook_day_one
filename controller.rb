require_relative 'view'

class Controller
  def initialize(repository)
    @cookbook = repository
    @view = View.new
  end

  def list
    # 1. Pegar todas as recipes
    recipes = @cookbook.all
    # 2. Mandar as recipes para a view exibir
    @view.display(recipes)
  end

  def create
    # 1. Perguntar o nome da receita
    name = @view.ask_recipe_name
    # 2. Perguntar a descricao da receita
    description = @view.ask_recipe_description
    # 3. Instaciar um objeto recipe
    new_recipe = Recipe.new(name, description)
    # 4. Adicionar o recipe no repository (cookbook)
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    # 1. Listar todas as receitas com o index
    list
    # 2. Perguntar para o usuário o index da recipe para excluir
    index = @view.ask_recipe_index
    # 3. Remover a receita do repository pelo index
    @cookbook.remove_recipe(index)
  end

end