class ProdutosController < ApplicationController
  
  def index 
    @produtos = Produto.order(nome: :asc)
  end

  def new
    @produto = Produto.new
  end

  def create 
    @produto = Produto.new(produto_params)

    if @produto.save 
      redirect_to root_url
    else
      flash[:errors] = @produto.errors.full_messages
      render :new
    end
  end

  def destroy
    id = params[:id]
    Produto.destroy(id)
    redirect_to root_url
  end

  def busca
    @produtos = Produto.search(params[:search])
  end

  def edit
    @produto = Produto.find(params[:id])
  end

  def show
    @produto = Produto.find(params[:id])
  end

  def update
    @produto = Produto.find(params[:id])

    if @produto.update_attributes(produto_params)
      redirect_to root_url
    else
      flash[:errors] = @produto.errors.full_messages 
      render :edit
    end
  end

  private 

  def produto_params
    params.require(:produto).permit(:nome, :descricao, :preco, :quantidade)
  end

end
