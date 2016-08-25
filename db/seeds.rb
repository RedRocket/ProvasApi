# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
prng = Random.new

states = [
  ['AC','Acre'],
  ['AL','Alagoas'],
  ['AM','Amazonas'],
  ['AP','Amapá'],
  ['BA','Bahia'],
  ['CE','Ceará'],
  ['DF','Distrito Federal'],
  ['ES','Espírito Santo'],
  ['GO','Goiás'],
  ['MA','Maranhão'],
  ['MG','Minas Gerais'],
  ['MS','Mato Grosso do Sul'],
  ['MT','Mato Grosso'],
  ['PA','Pará'],
  ['PB','Paraíba'],
  ['PE','Pernambuco'],
  ['PI','Piauí'],
  ['PR','Paraná'],
  ['RJ','Rio de Janeiro'],
  ['RN','Rio Grande do Norte'],
  ['RO','Rondônia'],
  ['RR','Roraima'],
  ['RS','Rio Grande do Sul'],
  ['SC','Santa Catarina'],
  ['SP','São Paulo'],
  ['SE','Sergipe'],
  ['TO','Tocantins']
]

cities = [
  ['Rio Branco', 'Cruzeiro do Sul'],
  ['Maceió', 'Arapiraca', 'Palmeira dos Índios', 'Pão de Açucar', 'Panedo'],
  ['Manaus'],
  ['Macapá', 'Laranjal do Jari', 'Santana'],
  ['Salvador', 'Alagoinhas', 'Barreiras', 'Camaçari', 'Capim Grosso', 'Campo Formoso', 'Cruz das Almas', 'Eunápolis', 'Feira de Santana', 'Guanambi', 'Ibicarí', 'Ilhéus', 'Ipiaú', 'Ipirá', 'Itabuna', 'Itamaraju', 'Itapetinga', 'Jequié', 'Juazeiro', 'Lauro de Freitas', 'Luís Edu. Magalhães', 'Paulo Afonso', 'Paripiranga', 'Riachão do Jacuípe', 'Santa Cruz de Cabrália', 'Santo Ant. de Jesus', 'Senhor do Bonfim', 'Teixeira de Freitas', '
    Vitória da Conquista'],
  ['Fortaleza', 'Aracati', 'Caucaia', 'Crateús', 'Crato', 'Icó', 'Juazeiro do Norte', 'Redenção', 'Sobral', 'Quixadá'],
  ['Brasília', 'Gama', 'Taguatinga'],
  ['Vitória', 'Alegre', 'Aracruz', 'Barra S. Francisco', 'Cach. de Itaperim', 'Cariacica', 'Castelo', 'Colatina', 'Guarapari', 'Iúna', 'Nova Venécia', 'S. Maria de Jetibá', 'Santa Teresa', 'Serra', 'São Mateus', 'Venda N. Imigrante', 'Viana', 'Vila Velha'],
  ['Goiânia', 'Anápolis', 'Anicuns', 'Caldas Novas', 'Catalão', 'Cristalina', 'Formosa', 'Goiás', 'Goiatuba', 'Iporá', 'Itaberaí', 'Itumbiara', 'Jataí', 'Luziânia', 'Mineiros', 'Pires do Rio', 'Quirinópolis', 'Rio Verde', 'Rubiataba', 'S.L. Montes Belos', 'Trindade', 'Uruaçu', 'Valparaíso de Goiás'],
  ['São Luís', 'Bacabal', 'Balsas', 'Caxias', 'Chapadinha', 'Codó', 'Imperatriz', 'Paço do Lumiar', 'Pedreiras', 'Pinheiro', 'São José de Ribamar', 'Timon'],
  ['Cuiabá', 'Água Boa', 'Alta Floresta', 'Araputanga', 'Barra do Garças', 'Cárceres', 'Campo Verde', 'Colíder', 'Diamantino', 'Guaratã do Norte', 'Itaúba', 'Jaciara', 'Juína', 'Lucas do Rio Verde', 'Nova Mutum', 'Nova Xavantina', 'Rondonópolis', 'S.J. Quatro Marcos', 'Sinop', 'Sorriso', 'Tangará da Serra', 'Várzea Grande'],
  ['Campo Grande', 'Amambaí', 'Cassilândia', 'Chapadão do Sul', 'Corumbá', 'Costa Rica', 'Dourados', 'Nova Andradina', 'Paranaíba', 'Ponta Porã', 'Selvíria', 'Três Lagoas'],
  ['Belo Horizonte', 'Além Paraíba', 'Alfenas', 'Almenara', 'Araxá', 'Barbacena', 'Bicas', 'Boa Esperança', 'Bom Despacho', 'Brumadinho', 'Cambuí', 'Campanha', 'Campina Verde', 'Campo Belo', 'Campos Gerais', 'Carangola', 'Carantiga', 'Cataguases', 'Cláudio', 'Congonhas', 'Contagem', 'Cons. Lafaiete', 'Conselheiro Pena', 'Coromandel', 'Coronel Fabriciano', 'Cruzeiro do Sul', 'Curvelo', 'Diamantina', 'Divinópolis', 'Dores do Indaiá', 'Extrema', 'Formiga', 'Frutal', 'Gov. Valadares', 'Guanhães', 'Guaxupé', 'Iguatama', 'Ipitanga', 'Itabira', 'Itajubá', 'Itaúna', 'Ituiutuba', 'Iturama', 'João Monlevade', 'João Pinheiro', 'Juatuba', 'Lavras', 'Juiz de Fora', 'Luz',  'Machado', 'Manhaçu', 'Mantena', 'Matipó', 'Mato Verde', 'Mariana', 'Monte Carmelo', 'Monte Claros', 'Muriaé', 'Nanuque', 'Nova Lima', 'Nova Porteirinha', 'Nova Serrana', 'Oliveira', 'Ouro Fino', 'Ouro Preto', 'Paracatu', 'Pará de Minas', 'Paraisópolis', 'Passos', 'Patos de Minas', 'Patrocínio', 'Pedro Leopoldo', 'Piranga', 'Pirapora', 'Piumhi', 'Ponte Nova', 'Pouso Alegre', 'Reduto', 'Sabará', 'Sabinópolis', 'Santa Luzia', 'S. Rita do Sapucaí', 'Santos Dumont', 'São Gotardo', 'São João Del Rei', 'São Lourenço', 'São S. do Paraíso', 'Sete Lagoas', 'Teófilo Otoni', 'Três Corações'],

]

Admin.create(
	email: "provas@example.com",
	password: "Ch/4uT7Lqgqis",
)

states.each do |s|
  State.create(UF: s[0], name: s[1])
end


cities.each_with_index do |state, index|
  state.each do |city|
    City.create(name: city, state_id: index + 1)
  end
end



(1 .. 100).each do |index|
  User.create(
    name: Faker::Name.name,
    picture: Faker::Avatar.image,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    birthday: Faker::Date.between(2.days.ago, Date.today)
  )
end

(1 .. 100).each do |index|
  University.create(
    name: Faker::Name.name,
    city_id: Faker::Number.between(1, 20),
  )
end
