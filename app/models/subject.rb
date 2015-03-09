class Subject
  include Mongoid::Document
  field :code, type: String
  field :name, type: String
  field :color, type: String
  field :archived, type: Boolean, default: false
  has_many :topics

  validates :code, uniqueness: true, presence: true, length: { maximum: 6 }
  validates :color, presence: true
  validates_associated :topics

  scope :not_archived, -> { where(archived: false) }
end
