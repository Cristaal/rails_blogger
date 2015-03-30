require 'rails_helper'

describe Post do
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should have_many :comments }
  it { should belong_to :user }
end
