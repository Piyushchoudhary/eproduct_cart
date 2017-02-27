require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.name = 'Manufacturer Name 3M'
    subject.cellphone = 123456789
    subject.password = "test1234"
    subject.country_code_id = 1
    subject.email = "test@test.com"
    expect(subject).to be_valid
  end

  # it "is not valid without a title" do
  #   subject.title = nil
  #   expect(subject).to_not be_valid
  # end
  #
  # it "is not valid without a description" do
  #   subject.description = nil
  #   expect(subject).to_not be_valid
  # end
  #
  # it "is not valid without a start_date" do
  #   subject.start_date = nil
  #   expect(subject).to_not be_valid
  # end
  #
  # it "is not valid without a end_date" do
  #   subject.end_date = nil
  #   expect(subject).to_not be_valid
  # end
end
