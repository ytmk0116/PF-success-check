class Task < ApplicationRecord
  before_validation :set_nameless_name
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  
  belongs_to :user

  private

  def set_nameless_name
    self.name = 'ććăȘă' if name.blank?
  end
end