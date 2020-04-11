class Produto < ApplicationRecord
  validates_presence_of :nome, :preco, :quantidade

  def self.search(search)
      where("nome LIKE '%#{search}%' 
        OR descricao LIKE '%#{search}%' 
        OR preco LIKE '%#{search}%' 
        OR quantidade LIKE '%#{search}%'")
  end
end
