class Link < ApplicationRecord
  belongs_to :user

  validates :content, format: /\A#{URI::regexp(%w(http https))}\z/
end