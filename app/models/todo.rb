class Todo
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :completion, type: Integer
end
