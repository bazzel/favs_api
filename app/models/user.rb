class User < ApplicationRecord
  validates :email, presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: 255 },
    email: true
end
