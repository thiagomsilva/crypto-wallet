puts "Cadastrando moedas..."

Coin.create!(
  description: "Bitcoin",
  acronym: "BTC",
  url_image: "https://static.vecteezy.com/system/resources/previews/008/505/801/original/bitcoin-logo-color-illustration-png.png"
)

Coin.create!(
  description: "Ethereum",
  acronym: "ETH",
  url_image: "https://cryptologos.cc/logos/ethereum-eth-logo.png"
)

Coin.create!(
  description: "Ripple",
  acronym: "XRP",
  url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQc0fro0-x5gSJZDO5fSWWcM_c56zTAPpr76z2cdWwSxA&s"
)

puts "Moedas cadastradas com sucesso!"