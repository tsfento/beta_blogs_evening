require 'rails_helper'

RSpec.describe Blog, type: :model do
  context 'Validation tests' do
    it 'is not valid without a title' do
      user = User.create(first_name: 'john', last_name: 'doe', username: 'johndoe', email: 'johndoe@email.com')
      blog = Blog.new(content: 'Sample content', user: user)
      expect(blog).to_not be_valid
      expect(blog.errors[:title]).to include("can't be blank")
    end

    it 'is not valid without content' do
      user = User.create(first_name: 'john', last_name: 'doe', username: 'johndoe', email: 'johndoe@email.com')
      blog = Blog.new(title: 'Sample Title', user: user)
      expect(blog).to_not be_valid
      expect(blog.errors[:content]).to include("can't be blank")
    end

    it 'is not valid without anything' do
      blog = Blog.new()
      expect(blog).to_not be_valid
      expect(blog.errors[:title]).to include("can't be blank")
      expect(blog.errors[:content]).to include("can't be blank")
      expect(blog.errors[:user]).to include('must exist')
    end
  end
end
