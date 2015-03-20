require 'rails_helper'

describe Blogger do
  it { should validate_presence_of :name }
end
