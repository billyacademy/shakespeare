require 'rails_helper'

describe Play do
  describe "attributes" do
    it { should respond_to :title}
  end

  describe "validations" do
    it { should validate_presence_of :title }
  end

  describe "associations" do
    it { should have_many :acts }
    it { should have_many :roles }
    # it { should have_many :scenes }
    # it { should have_many :roles_scenes }
  end
end
