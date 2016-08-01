RSpec.describe Something do
  let(:something) { Something.new }

  context 'it does something' do
    it 'does something' do
      expect { something.increment }.to change { something.count }.from(0).to(1)
    end

    it 'receives method call' do
      allow(something).to receive(:something_else) { true }

      something.do_something

      expect(something).to have_received(:something_else)
    end
  end
end
