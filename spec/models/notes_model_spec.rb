require 'spec_helper'

describe 'Notes' do
  it "must have actual text to be valid" do
    note = Note.create!(:note => "this is a test note", :title =>"Test")
    note.note = ""
    expect(note).to_not be_valid

  end

end
