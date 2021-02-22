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
      mostrar_spinner('Populando banco de dados') { %x(rails db:seed) }

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

  private

  def mostrar_spinner(msg_inicio, msg_fim = 'Concluído')
    spinner = TTY::Spinner.new("[:spinner] #{msg_inicio}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_fim})")
  end

end
