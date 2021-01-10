class Contact < ApplicationRecord
    belongs_to :kind

    def kind_description
        self.kind.description
    end
end
