# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_24_131635) do

  create_table "moedas", force: :cascade do |t|
    t.string "descricao"
    t.string "sigla"
    t.string "url_imagem"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tipo_mineracao_id"
    t.index ["tipo_mineracao_id"], name: "index_moedas_on_tipo_mineracao_id"
  end

  create_table "tipo_mineracaos", force: :cascade do |t|
    t.string "descricao"
    t.string "sigla"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "moedas", "tipo_mineracaos"
end
