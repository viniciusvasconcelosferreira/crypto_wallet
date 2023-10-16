class Moeda < ApplicationRecord
  belongs_to :tipo_mineracao, optional: true
end
