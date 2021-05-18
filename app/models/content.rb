class Content < ApplicationRecord
  belongs_to :user

  has_many :tag_contents, dependent: :destroy
  has_many :tags, through: :tags_contents

  validates :title, presence: true
  validates :description, presence: true
end
