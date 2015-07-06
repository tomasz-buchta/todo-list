json.extract! @todo, :id,:title, :description, :completion, :created_at, :updated_at
json.partial! 'user', todo: @todo
