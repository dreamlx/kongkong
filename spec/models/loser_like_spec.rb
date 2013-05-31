require 'spec_helper'

describe LoserLike do
  it "test rs" do
    loser = Loser.create!(username: "test", email: "test@gmail.com", password: "11111111", password_confirmation: "11111111")
    girl = Girl.create!(name: "fairy")

    loser.girls << girl

    expect(LoserLike.first.loser_id).to eq(loser.id)
  end
end
