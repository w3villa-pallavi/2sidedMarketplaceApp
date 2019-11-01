class Runner < ApplicationRecord
  
  rolify
  has_one :profile, :dependent => :destroy
  before_create :create_profile

  def create_profile
    profile = build_profile 
  end
  
  accepts_nested_attributes_for :profile

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
