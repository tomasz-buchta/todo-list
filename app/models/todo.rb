class Todo
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :completion, type: Integer

  validates :title, presence: true
  validates :completion, presence: true
  validates :completion, numericality: {greater_than: 0,less_than: 100}
end
