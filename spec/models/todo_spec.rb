require 'rails_helper'

RSpec.describe Todo, type: :model do
  context 'invalid attributes' do
    let(:todo) {FactoryGirl.build(:todo)}

    it { should validate_presence_of(:user) }

    it 'without title should be invalid' do
      todo.title = ''
      expect(todo).to_not be_valid
    end
    it 'without completion should be invalid' do
      todo.completion = nil
      expect(todo).to_not be_valid
    end
    it 'completion should be greater than or equal 0' do
      todo.completion = -1
      expect(todo).to_not be_valid
    end
    it 'completion should less than 100' do
      todo.completion = 101
      expect(todo).to_not be_valid
    end
  end
  context 'valid attributes' do
    let(:todo) {FactoryGirl.build(:todo)}
    
    it 'should be valid' do
      expect(todo).to be_valid
    end
  end
end
