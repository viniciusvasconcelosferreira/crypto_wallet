# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Moeda.create!(
  [
    {
      descricao: 'Bitcoin',
      sigla: 'BTC',
      url_imagem: 'https://cdn.freebiesupply.com/logos/large/2x/bitcoin-logo-png-transparent.png'
    },
    {
      descricao: 'Ethereum',
      sigla: 'ETH',
      url_imagem: 'https://cryptologos.cc/logos/ethereum-eth-logo.png'
    },
    {
      descricao: 'Tether',
      sigla: 'USDT',
      url_imagem: 'https://cryptologos.cc/logos/tether-usdt-logo.png'
    },
    {
      descricao: 'Dash',
      sigla: 'DASH',
      url_imagem: 'https://cdn.freebiesupply.com/logos/large/2x/dash-3-logo-png-transparent.png'
    }
  ]
)
