class Todo
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :description, type: String
  field :completion, type: Integer

  validates :title, presence: true
  validates :completion, presence: true
  validates :completion, numericality: {greater_than: 0,less_than: 100}

  after_initialize :add_created_at

  def add_created_at
    unless self.created_at.present?
      self.created_at = self.id.generation_time
      self.save
    end
  end
end
