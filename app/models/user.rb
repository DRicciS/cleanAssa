# app/models/user.rb
class User < ApplicationRecord
enum :role, { regular: "regular", admin: "admin" }
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Validations
  validates :name, presence: true

  # After initialization, set a default role if one isn't present
  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :regular
  end
end
