class CreateMoedas < ActiveRecord::Migration[6.1]
  def change
    create_table :moedas do |t|
      t.string :descricao
      t.string :sigla
      t.string :url_imagem

      t.timestamps
    end
  end
end
