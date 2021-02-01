namespace :dev do
  desc "Configuracao da gem faker"
  
  task setup: :environment do
    puts "Resetando o banco de dadosss..."
    %x(rake db:drop db:create db:migrate )
    kinds = %w(amigo comercial seila oq)

    kinds.each do  |kind|
      Kind.create!(
        description: kind
      )
      puts "tipo criado com sucesso"
    end

    100.times do |i| 
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthday: Faker::Date.between(from: 2.days.ago, to: Date.today),
        kind: Kind.all.sample

      ) 
    end
    puts "contato criado com sucesso"

    Contact.all.each do |contact| 
      Random.rand(5).times do |i|
        phone = Phone.create!(number:Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end 
    puts "numero criado com sucesso"

    Contact.all.each do |contact| 
      contact = Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact:  contact
      )
    end 
    puts "Endereços criado com sucesso"

  end

end
