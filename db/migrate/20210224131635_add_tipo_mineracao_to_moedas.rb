class AddTipoMineracaoToMoedas < ActiveRecord::Migration[6.1]
  def change
    add_reference :moedas, :tipo_mineracao, null: true, foreign_key: true
  end
end
