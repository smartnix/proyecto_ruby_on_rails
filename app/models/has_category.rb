class HasCategory < ApplicationRecord
  belongs_to :articulo
  belongs_to :category
end
