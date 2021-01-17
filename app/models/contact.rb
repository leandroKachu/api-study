class Contact < ApplicationRecord
    belongs_to :kind
    has_many :phones
    accepts_nested_attributes_for :phones
    def include
        kind = " O seu tipo é: " + self.kind.description.upcase,
        self.phones.each do |number|
            array = []
            array << number.number.to_s
        end 
    end

end
