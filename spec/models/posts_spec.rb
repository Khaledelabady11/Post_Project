RSpec.describe Post, type: :model do
  it { is_expected.to have_many(:comments) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
end
