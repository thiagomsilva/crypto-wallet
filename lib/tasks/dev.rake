namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      spinner_messages("Apagando o banco de dados...") { %x(rails db:drop) }
      spinner_messages("Criando o banco de dados...") { %x(rails db:create) }
      spinner_messages("Executando as migrações...") { %x(rails db:migrate) }
      spinner_messages("Populando o banco de dados...") { %x(rails db:seed) }
    else
      puts "Este comando só pode ser executado em ambiente de desenvolvimento"
    end
  end

  private

  def spinner_messages(msg_start, msg_done = "Concluído com sucesso!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success(msg_done)
  end
end
