class CreateTipoMineracaos < ActiveRecord::Migration[6.1]
  def change
    create_table :tipo_mineracaos do |t|
      t.string :descricao
      t.string :sigla

      t.timestamps
    end
  end
end
