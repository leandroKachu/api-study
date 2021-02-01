class Contact < ApplicationRecord
    belongs_to :kind
    has_many :phones
    has_one :address
     accepts_nested_attributes_for :phones, allow_destroy: true
     accepts_nested_attributes_for :address, allow_destroy: true

    def include
        kind = " O seu tipo é: " + self.kind.description.upcase,
        self.phones.each do |number|
            array = []
            array << number.number.to_s
        end 
    end

end
