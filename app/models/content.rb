class Content < ApplicationRecord
  belongs_to :user

  has_many :tag_contents, dependent: :destroy
  has_many :tags, through: :tag_contents

  validates :title, presence: true
  validates :description, presence: true

  def update_tags(tags_params)
    mapped_tags = tags_params.map do |tag_name|
      self.user.tags.where(name: tag_name).first_or_initialize
    end
    self.tags = mapped_tags
  end
end
