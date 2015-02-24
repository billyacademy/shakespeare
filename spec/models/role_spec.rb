require 'rails_helper'

describe Role do
  describe "attributes" do
    it { should respond_to :name}
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :play_id }
  end

  describe "associations" do
    it { should belong_to :play }
    it { should have_many :speeches }
    it { should have_many :lines }
    it { should have_many :scenes }
    it { should have_many :roles_scenes }
  end
end
