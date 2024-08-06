namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      spinner_messages("Apagando o banco de dados...") { %x(rails db:drop) }
      spinner_messages("Criando o banco de dados...") { %x(rails db:create) }
      spinner_messages("Executando as migrações...") { %x(rails db:migrate) }
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
    else
      puts "Este comando só pode ser executado em ambiente de desenvolvimento"
    end
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    spinner_messages("Cadastrando as moedas...") do
      coins = [
                {
                  description: "Bitcoin",
                  acronym: "BTC",
                  url_image: "https://static.vecteezy.com/system/resources/previews/008/505/801/original/bitcoin-logo-color-illustration-png.png",
                  mining_type: MiningType.find_by(acronym: "PoW")
                },
                {
                  description: "Ethereum",
                  acronym: "ETH",
                  url_image: "https://cryptologos.cc/logos/ethereum-eth-logo.png",
                  mining_type: MiningType.all.sample
                },
                {
                  description: "Ripple",
                  acronym: "XRP",
                  url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/52.png",
                  mining_type: MiningType.all.sample
                }
              ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    spinner_messages("Cadastrando os tipos de mineração...") do
      mining_types = [
                {
                  description: "Proof of Work",
                  acronym: "PoW"
                },
                {
                  description: "Proof of Stake",
                  acronym: "PoS"
                },
                {
                  description: "Proof of Capacity",
                  acronym: "PoC"
                }
              ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
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
