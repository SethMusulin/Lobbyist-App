require 'spec_helper'

describe 'Notes' do
  it "must have actual text to be valid" do
    note = Note.new(:note => "this is a test note", :title =>"Test")
    expect(note).to be_valid
    note.note = ""
    expect(note).to_not be_valid

  end
  it "must have actual title to be valid" do
    note = Note.create!(:note => "this is a test note", :title =>"Test")
    expect(note).to be_valid

    note.title = ""
    expect(note).to_not be_valid

  end

end
