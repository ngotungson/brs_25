class Relationship < ActiveRecord::Base
  include ActivityLog

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower, presence: true
  validates :followed, presence: true

  after_save :create_follow_activity

  private
  def create_follow_activity
    create_activity follower_id, followed_id, Activity.target_types[:user_target],
      Activity.action_types[:followed]
  end
end
