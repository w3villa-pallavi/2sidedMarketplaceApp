class Profile < ApplicationRecord
  belongs_to :runner

  validates_uniqueness_of :runner_id 
  validates :runner_id, presence: true

end
