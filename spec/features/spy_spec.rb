#TODO change it fot swapi_client context
RSpec.describe "have_received" do
  it "passes when the message has been received" do
    invitation = spy('invitation')
    invitation.deliver
    expect(invitation).to have_received(:deliver)
  end
end
RSpec.describe "An invitiation" do
  let(:invitation) { spy("invitation") }

  before do
    invitation.deliver("foo@example.com")
    invitation.deliver("bar@example.com")
  end

  it "passes when a count constraint is satisfied" do
    expect(invitation).to have_received(:deliver).twice
  end

  it "passes when an order constraint is satisifed" do
    expect(invitation).to have_received(:deliver).with("foo@example.com").ordered
    expect(invitation).to have_received(:deliver).with("bar@example.com").ordered
  end

  it "fails when a count constraint is not satisfied" do
    expect(invitation).to have_received(:deliver).at_least(3).times
  end

  it "fails when an order constraint is not satisifed" do
    expect(invitation).to have_received(:deliver).with("bar@example.com").ordered
    expect(invitation).to have_received(:deliver).with("foo@example.com").ordered
  end
end