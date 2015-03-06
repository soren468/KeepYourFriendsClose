class Group < ActiveRecord::Base
  validates :name, presence: true

  has_and_belongs_to_many :users
  belongs_to :user

  validate :user_doesnt_have_duplicates

  def user_doesnt_have_duplicates
    errors.add(:name, "User can't have duplicate groups") if Group.find_by(name: self.name, user_id: self.user_id)
  end

  def admin
    self.user
  end
end