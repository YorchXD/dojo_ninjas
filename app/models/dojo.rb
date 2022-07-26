class Dojo < ApplicationRecord
    before_destroy { ninjas.destroy_all  }
    validates :name, presence: true
    validates :city, presence: true
    validates :state, presence: true, length: {is: 2}
    has_many :ninjas
end
