class Runner < ApplicationRecord
  rolify

  has_one :profile

  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_one_attached :image

    scope :sorted, lambda {order("username ASC")}

    def assign_default_role
      self.add_role(:runner) if self.roles.blank?
    end

end
