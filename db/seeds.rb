spinner = TTY::Spinner.new("[:spinner] Cadastrando moedas...")
spinner.auto_spin

coins = [
          {
            description: "Bitcoin",
            acronym: "BTC",
            url_image: "https://static.vecteezy.com/system/resources/previews/008/505/801/original/bitcoin-logo-color-illustration-png.png"
          },
          {
            description: "Ethereum",
            acronym: "ETH",
            url_image: "https://cryptologos.cc/logos/ethereum-eth-logo.png"
          },
          {
            description: "Ripple",
            acronym: "XRP",
            url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/52.png"
          }
        ]

coins.each do |coin|
  Coin.find_or_create_by!(coin)
end

spinner.success("Moedas cadastradas com sucesso!")