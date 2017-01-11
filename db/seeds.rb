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
  ['Fortaleza'],
]

Admin.create(
	email: "provas@example.com",
	password: "1234",
)

states.each do |s|
  State.create(UF: s[0], name: s[1])
end


cities.each_with_index do |state, index|
  state.each do |city|
    City.create(name: city, state_id: index + 1)
  end
end
