class Product < ActiveRecord::Base
  validates :title, :description, presence: true
  validate :check_description_longer_than_title

  def check_description_longer_than_title
    return if title.blank? or description.blank?
    if title.length > description.length
      errors.add(:description, 'can\'t be shorter than title')
    end
  end
end