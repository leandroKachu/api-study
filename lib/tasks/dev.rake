namespace :dev do
  desc "Configuracao da gem faker"
  
  task setup: :environment do
    kinds = %w(amigo comercial seila oq)
    kinds.each do  |kind|
      Kind.create!(
        description: kind
      ) 
    end

    100.times do |i| 
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthday: Faker::Date.between(from: 2.days.ago, to: Date.today),
        kind: Kind.all.sample

      ) 
    end
  end

end
