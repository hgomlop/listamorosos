class Moroso < ApplicationRecord
    validates :nombre, :apellido, :deuda, :fecha, :direccion, :presence => true
    belongs_to :user
end
