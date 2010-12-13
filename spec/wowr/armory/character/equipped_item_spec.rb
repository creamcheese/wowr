require 'spec_helper'

module Wowr::Armory::Character
  describe EquippedItem do
    subject { EquippedItem.new(fake_element) }

    its(:durability)                { should satisfy { |v| v > 0 && v <= 100 } }
    its(:gems)                      { should be_kind_of(Array) }
    its(:gems)                      { subject[0].should_not be_nil }
    its(:gems)                      { subject[1].should_not be_nil }
    its(:gems)                      { subject[2].should be_nil }
    its(:permanent_enchant)         { should_not be_nil }
    its(:random_properties_id)      { should eql(0) }
    its(:slot)                      { should eql(0) }

    its(:class) { should superclass(Wowr::Armory::Item::Base) }

    protected

    def fake_element
      xml = file_fixture('armory/character-sheet/sebudai_mal_ganis.xml')
      (Nokogiri::XML(xml)%'items'/'item')[0]
    end

  end
end
