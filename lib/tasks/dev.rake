namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      # spinner = TTY::Spinner.new("[:spinner] Executando tarefas")
      # spinner.auto_spin
      # %x(rails db:drop db:create db:migrate db:seed)
      # spinner.success("(Sucesso!)")

      mostrar_spinner('Apagando banco de dados') { %x(rails db:drop) }
      mostrar_spinner('Criando banco de dados') { %x(rails db:create) }
      mostrar_spinner('Migrando banco de dados') { %x(rails db:migrate) }
       %x(rails dev:add_dados)

      # spinner = TTY::Spinner.new("[:spinner] Apagando banco de dados")
      # spinner.auto_spin
      # %x(rails db:drop)
      # spinner.success("(Sucesso)")

      # spinner = TTY::Spinner.new("[:spinner] Criando banco de dados")
      # spinner.auto_spin
      # %x(rails db:create)
      # spinner.success("(Sucesso)")
      #
      # spinner = TTY::Spinner.new("[:spinner] Migrando banco de dados")
      # spinner.auto_spin
      # %x(rails db:migrate)
      # spinner.success("(Sucesso)")
      #
      # spinner = TTY::Spinner.new("[:spinner] Populando banco de dados")
      # spinner.auto_spin
      # %x(rails db:seed)
      # spinner.success("(Sucesso)")

    else
      spinner = TTY::Spinner.new("[:spinner] Executando comando")
      spinner.auto_spin
      spinner.error("(Falha)")
    end
  end

  desc "Popula banco de dados"
  task add_dados: :environment do
    mostrar_spinner('Cadastrando moedas') {
      moedas = [
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
        },
        {
          descricao: 'Ripple',
          sigla: 'XRP',
          url_imagem: 'https://cdn.freebiesupply.com/logos/large/2x/ripple-2-logo-png-transparent.png'
        }, {
          descricao: 'Litecoin',
          sigla: 'LTC',
          url_imagem: 'https://cryptologos.cc/logos/litecoin-ltc-logo.png'
        }
      ]
      moedas.each do |m|
        Moeda.find_or_create_by!(m)
      end
    }
    mostrar_spinner('Cadastrando tipos de mineração') {
      tipo_mineracao = [
        {
          descricao: 'Proof of work',
          sigla: 'PoW'
        },
        {
          descricao: 'Proof of Stake',
          sigla: 'PoS'
        },
        {
          descricao: 'Proof of Capacity',
          sigla: 'PoC'
        }
      ]

      tipo_mineracao.each do |tm|
        TipoMineracao.find_or_create_by!(tm)
      end
    }
  end

  private

  def mostrar_spinner(msg_inicio, msg_fim = 'Concluído')
    spinner = TTY::Spinner.new("[:spinner] #{msg_inicio}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_fim})")
  end

end
