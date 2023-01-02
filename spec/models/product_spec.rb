require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'creates a product with a name, price, quantity & category' do
      @trees = Category.create(name: 'Trees')
      @oak = Product.create(name: 'Oak', price: 100, quantity: 10, category: @trees)
      expect(@trees).to be_instance_of(Category)
      expect(@oak).to be_instance_of(Product)
    end
    
    it 'returns an error if a name is not given' do
      @trees = Category.create(name: 'Trees')
      @oak = Product.create(name: nil, price: 100, quantity: 10, category: @trees)
      expect(@trees).to be_instance_of(Category)
      expect(@oak.errors.full_messages).to include("Name can't be blank")
    end
    
    it 'returns an error if a price is not given' do
      @trees = Category.create(name: 'Trees')
      @oak = Product.create(name: 'Oak', quantity: 10, category: @trees)
      expect(@trees).to be_instance_of(Category)
      expect(@oak.errors.full_messages).to include("Price can't be blank")
    end
    
    it 'returns an error if a quantity is not given' do
      @trees = Category.create(name: 'Trees')
      @oak = Product.create(name: 'Oak', price: 100, quantity: nil, category: @trees)
      expect(@trees).to be_instance_of(Category)
      expect(@oak.errors.full_messages).to include("Quantity can't be blank")
    end
    
    it 'returns an error if a category is not given' do
      @trees = Category.create(name: 'Trees')
      @oak = Product.create(name: 'Oak', price: 100, quantity: 10, category: nil)
      expect(@trees).to be_instance_of(Category)
      expect(@oak.errors.full_messages).to include("Category can't be blank")
    end

  end
end
