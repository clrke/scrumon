class Task < ActiveRecord::Base
  belongs_to :organization
  belongs_to :user
end
