class Mark < ActiveRecord::Base
  include ActivityLog
  enum mark_type: [:reading, :read]
  belongs_to :user
  belongs_to :book

  validates :user, presence: true
  validates :book, presence: true

  after_save :create_mark_activity

  mark_types.keys.each do |mark_name|
    scope :mark_name, ->{where mark_type: Settings.send(mark_name)}
  end
  scope :favorite, ->{where favorite: true}
  private
  def create_mark_activity
    if reading? && read?
      create_activity user_id, book_id, Activity.target_types[:book_target],
        Activity.action_types[mark_type]
    else
      create_activity user_id, book_id, Activity.target_types[:book_target],
        Activity.action_types[:favorite]
    end
  end
end
