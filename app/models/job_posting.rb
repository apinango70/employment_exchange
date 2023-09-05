class JobPosting < ApplicationRecord
  belongs_to :user
  has_many :postulations, dependent: :destroy
  has_many :applicants, through: :postulations, source: :user
end
