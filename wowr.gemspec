# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{wowr}
  s.version = "0.5.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ben Humphreys", "Peter Wood", "Renaud Chaput"]
  s.date = %q{2010-05-16}
  s.description = %q{Wowr is a Ruby library for accessing data in the World of Warcraft Armory. It provides an object-oriented interface to the XML data provided by the armory, giving access to items, characters, guilds and arena teams. It is designed for both single users and larger guild or portal sites for many users.}
  s.email = %q{peter+wowr@alastria.net}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    ".gitignore",
     "Gemfile",
     "Gemfile.lock",
     "README",
     "Rakefile",
     "VERSION.yml",
     "changelog.txt",
     "doc/classes/Wowr/API.html",
     "doc/classes/Wowr/Classes/Agility.html",
     "doc/classes/Wowr/Classes/ArenaTeam.html",
     "doc/classes/Wowr/Classes/ArenaTeamEmblem.html",
     "doc/classes/Wowr/Classes/Armor.html",
     "doc/classes/Wowr/Classes/BaseStat.html",
     "doc/classes/Wowr/Classes/Buff.html",
     "doc/classes/Wowr/Classes/Character.html",
     "doc/classes/Wowr/Classes/CreatedItem.html",
     "doc/classes/Wowr/Classes/Defense.html",
     "doc/classes/Wowr/Classes/Defenses.html",
     "doc/classes/Wowr/Classes/DisenchantItem.html",
     "doc/classes/Wowr/Classes/DodgeParryBlock.html",
     "doc/classes/Wowr/Classes/EquippedItem.html",
     "doc/classes/Wowr/Classes/FullArenaTeam.html",
     "doc/classes/Wowr/Classes/FullCharacter.html",
     "doc/classes/Wowr/Classes/FullGuild.html",
     "doc/classes/Wowr/Classes/FullItem.html",
     "doc/classes/Wowr/Classes/Guild.html",
     "doc/classes/Wowr/Classes/GuildBank.html",
     "doc/classes/Wowr/Classes/GuildBankBag.html",
     "doc/classes/Wowr/Classes/GuildBankContents.html",
     "doc/classes/Wowr/Classes/GuildBankItem.html",
     "doc/classes/Wowr/Classes/GuildBankLog.html",
     "doc/classes/Wowr/Classes/GuildBankLogEntry.html",
     "doc/classes/Wowr/Classes/GuildBankLogItem.html",
     "doc/classes/Wowr/Classes/Intellect.html",
     "doc/classes/Wowr/Classes/Item.html",
     "doc/classes/Wowr/Classes/ItemCost.html",
     "doc/classes/Wowr/Classes/ItemCostToken.html",
     "doc/classes/Wowr/Classes/ItemCreatedBy.html",
     "doc/classes/Wowr/Classes/ItemCreation.html",
     "doc/classes/Wowr/Classes/ItemDamageData.html",
     "doc/classes/Wowr/Classes/ItemDropCreature.html",
     "doc/classes/Wowr/Classes/ItemEquipData.html",
     "doc/classes/Wowr/Classes/ItemInfo.html",
     "doc/classes/Wowr/Classes/ItemPlansFor.html",
     "doc/classes/Wowr/Classes/ItemQuest.html",
     "doc/classes/Wowr/Classes/ItemSetBonus.html",
     "doc/classes/Wowr/Classes/ItemSetData.html",
     "doc/classes/Wowr/Classes/ItemSource.html",
     "doc/classes/Wowr/Classes/ItemSpell.html",
     "doc/classes/Wowr/Classes/ItemTooltip.html",
     "doc/classes/Wowr/Classes/ItemVendor.html",
     "doc/classes/Wowr/Classes/ManaRegen.html",
     "doc/classes/Wowr/Classes/Melee.html",
     "doc/classes/Wowr/Classes/Money.html",
     "doc/classes/Wowr/Classes/PetBonus.html",
     "doc/classes/Wowr/Classes/PlanItem.html",
     "doc/classes/Wowr/Classes/Pvp.html",
     "doc/classes/Wowr/Classes/Ranged.html",
     "doc/classes/Wowr/Classes/Reagent.html",
     "doc/classes/Wowr/Classes/RepFaction.html",
     "doc/classes/Wowr/Classes/RepFactionCategory.html",
     "doc/classes/Wowr/Classes/Resilience.html",
     "doc/classes/Wowr/Classes/Resistance.html",
     "doc/classes/Wowr/Classes/SearchArenaTeam.html",
     "doc/classes/Wowr/Classes/SearchCharacter.html",
     "doc/classes/Wowr/Classes/SearchGuild.html",
     "doc/classes/Wowr/Classes/SearchItem.html",
     "doc/classes/Wowr/Classes/SecondBar.html",
     "doc/classes/Wowr/Classes/Skill.html",
     "doc/classes/Wowr/Classes/SkillCategory.html",
     "doc/classes/Wowr/Classes/Spell.html",
     "doc/classes/Wowr/Classes/SpellDamage.html",
     "doc/classes/Wowr/Classes/Spirit.html",
     "doc/classes/Wowr/Classes/Stamina.html",
     "doc/classes/Wowr/Classes/Strength.html",
     "doc/classes/Wowr/Classes/TalentSpec.html",
     "doc/classes/Wowr/Classes/WeaponCritChance.html",
     "doc/classes/Wowr/Classes/WeaponDamage.html",
     "doc/classes/Wowr/Classes/WeaponExpertise.html",
     "doc/classes/Wowr/Classes/WeaponHitRating.html",
     "doc/classes/Wowr/Classes/WeaponPower.html",
     "doc/classes/Wowr/Classes/WeaponSkill.html",
     "doc/classes/Wowr/Classes/WeaponSpeed.html",
     "doc/classes/Wowr/Exceptions.html",
     "doc/classes/Wowr/Exceptions/ArenaTeamNameNotSet.html",
     "doc/classes/Wowr/Exceptions/ArenaTeamNotFound.html",
     "doc/classes/Wowr/Exceptions/CharacterNameNotSet.html",
     "doc/classes/Wowr/Exceptions/CharacterNotFound.html",
     "doc/classes/Wowr/Exceptions/CookieNotSet.html",
     "doc/classes/Wowr/Exceptions/ElementNotFoundError.html",
     "doc/classes/Wowr/Exceptions/EmptyPage.html",
     "doc/classes/Wowr/Exceptions/GuildBankNotFound.html",
     "doc/classes/Wowr/Exceptions/GuildNameNotSet.html",
     "doc/classes/Wowr/Exceptions/GuildNotFound.html",
     "doc/classes/Wowr/Exceptions/InvalidArenaTeamSize.html",
     "doc/classes/Wowr/Exceptions/InvalidIconSize.html",
     "doc/classes/Wowr/Exceptions/InvalidIconType.html",
     "doc/classes/Wowr/Exceptions/InvalidLoginDetails.html",
     "doc/classes/Wowr/Exceptions/InvalidSearchType.html",
     "doc/classes/Wowr/Exceptions/InvalidXML.html",
     "doc/classes/Wowr/Exceptions/ItemNotFound.html",
     "doc/classes/Wowr/Exceptions/NoSearchString.html",
     "doc/classes/Wowr/Exceptions/RealmNotSet.html",
     "doc/classes/Wowr/Exceptions/SearchError.html",
     "doc/classes/Wowr/Exceptions/ServerDoesNotExist.html",
     "doc/classes/Wowr/Extensions.html",
     "doc/created.rid",
     "doc/files/changelog_txt.html",
     "doc/files/example_rb.html",
     "doc/files/init_rb.html",
     "doc/files/lib/wowr/arena_team_rb.html",
     "doc/files/lib/wowr/character_rb.html",
     "doc/files/lib/wowr/exceptions_rb.html",
     "doc/files/lib/wowr/extensions_rb.html",
     "doc/files/lib/wowr/general_rb.html",
     "doc/files/lib/wowr/guild_bank_rb.html",
     "doc/files/lib/wowr/guild_rb.html",
     "doc/files/lib/wowr/item_rb.html",
     "doc/files/lib/wowr_rb.html",
     "doc/files/test_rb.html",
     "doc/fr_class_index.html",
     "doc/fr_file_index.html",
     "doc/fr_method_index.html",
     "doc/index.html",
     "doc/rdoc-style.css",
     "docs/classes/Wowr.html",
     "docs/classes/Wowr/API.html",
     "docs/classes/Wowr/API.src/M000065.html",
     "docs/classes/Wowr/API.src/M000066.html",
     "docs/classes/Wowr/API.src/M000067.html",
     "docs/classes/Wowr/API.src/M000068.html",
     "docs/classes/Wowr/API.src/M000069.html",
     "docs/classes/Wowr/API.src/M000070.html",
     "docs/classes/Wowr/API.src/M000071.html",
     "docs/classes/Wowr/API.src/M000072.html",
     "docs/classes/Wowr/API.src/M000073.html",
     "docs/classes/Wowr/API.src/M000074.html",
     "docs/classes/Wowr/API.src/M000075.html",
     "docs/classes/Wowr/API.src/M000076.html",
     "docs/classes/Wowr/API.src/M000077.html",
     "docs/classes/Wowr/API.src/M000078.html",
     "docs/classes/Wowr/Classes.html",
     "docs/classes/Wowr/Classes/Agility.html",
     "docs/classes/Wowr/Classes/Agility.src/M000055.html",
     "docs/classes/Wowr/Classes/ArenaTeam.html",
     "docs/classes/Wowr/Classes/ArenaTeam.src/M000017.html",
     "docs/classes/Wowr/Classes/ArenaTeamEmblem.html",
     "docs/classes/Wowr/Classes/ArenaTeamEmblem.src/M000043.html",
     "docs/classes/Wowr/Classes/Armor.html",
     "docs/classes/Wowr/Classes/Armor.src/M000053.html",
     "docs/classes/Wowr/Classes/Armor.src/M000054.html",
     "docs/classes/Wowr/Classes/BaseStat.html",
     "docs/classes/Wowr/Classes/Buff.html",
     "docs/classes/Wowr/Classes/Buff.src/M000047.html",
     "docs/classes/Wowr/Classes/Character.html",
     "docs/classes/Wowr/Classes/Character.src/M000056.html",
     "docs/classes/Wowr/Classes/CharacterSheet.html",
     "docs/classes/Wowr/Classes/CharacterSheet.src/M000023.html",
     "docs/classes/Wowr/Classes/CharacterSheet.src/M000024.html",
     "docs/classes/Wowr/Classes/CharacterSheet.src/M000025.html",
     "docs/classes/Wowr/Classes/CreatedItem.html",
     "docs/classes/Wowr/Classes/CreatedItem.src/M000049.html",
     "docs/classes/Wowr/Classes/Defense.html",
     "docs/classes/Wowr/Classes/Defense.src/M000003.html",
     "docs/classes/Wowr/Classes/Defenses.html",
     "docs/classes/Wowr/Classes/Defenses.src/M000010.html",
     "docs/classes/Wowr/Classes/DisenchantItem.html",
     "docs/classes/Wowr/Classes/DisenchantItem.src/M000008.html",
     "docs/classes/Wowr/Classes/DodgeParryBlock.html",
     "docs/classes/Wowr/Classes/DodgeParryBlock.src/M000062.html",
     "docs/classes/Wowr/Classes/EquippedItem.html",
     "docs/classes/Wowr/Classes/EquippedItem.src/M000039.html",
     "docs/classes/Wowr/Classes/Faction.html",
     "docs/classes/Wowr/Classes/Faction.src/M000057.html",
     "docs/classes/Wowr/Classes/FactionCategory.html",
     "docs/classes/Wowr/Classes/FactionCategory.src/M000045.html",
     "docs/classes/Wowr/Classes/Guild.html",
     "docs/classes/Wowr/Classes/Guild.src/M000046.html",
     "docs/classes/Wowr/Classes/Intellect.html",
     "docs/classes/Wowr/Classes/Intellect.src/M000021.html",
     "docs/classes/Wowr/Classes/Item.html",
     "docs/classes/Wowr/Classes/Item.src/M000048.html",
     "docs/classes/Wowr/Classes/ItemCost.html",
     "docs/classes/Wowr/Classes/ItemCost.src/M000018.html",
     "docs/classes/Wowr/Classes/ItemCostToken.html",
     "docs/classes/Wowr/Classes/ItemCostToken.src/M000015.html",
     "docs/classes/Wowr/Classes/ItemCreatedBy.html",
     "docs/classes/Wowr/Classes/ItemCreatedBy.src/M000007.html",
     "docs/classes/Wowr/Classes/ItemCreation.html",
     "docs/classes/Wowr/Classes/ItemCreation.src/M000002.html",
     "docs/classes/Wowr/Classes/ItemDamageData.html",
     "docs/classes/Wowr/Classes/ItemDamageData.src/M000009.html",
     "docs/classes/Wowr/Classes/ItemDropCreature.html",
     "docs/classes/Wowr/Classes/ItemDropCreature.src/M000027.html",
     "docs/classes/Wowr/Classes/ItemEquipData.html",
     "docs/classes/Wowr/Classes/ItemEquipData.src/M000038.html",
     "docs/classes/Wowr/Classes/ItemInfo.html",
     "docs/classes/Wowr/Classes/ItemInfo.src/M000028.html",
     "docs/classes/Wowr/Classes/ItemPlansFor.html",
     "docs/classes/Wowr/Classes/ItemPlansFor.src/M000035.html",
     "docs/classes/Wowr/Classes/ItemQuest.html",
     "docs/classes/Wowr/Classes/ItemQuest.src/M000044.html",
     "docs/classes/Wowr/Classes/ItemSetBonus.html",
     "docs/classes/Wowr/Classes/ItemSetBonus.src/M000029.html",
     "docs/classes/Wowr/Classes/ItemSetData.html",
     "docs/classes/Wowr/Classes/ItemSetData.src/M000037.html",
     "docs/classes/Wowr/Classes/ItemSource.html",
     "docs/classes/Wowr/Classes/ItemSource.src/M000036.html",
     "docs/classes/Wowr/Classes/ItemSpell.html",
     "docs/classes/Wowr/Classes/ItemSpell.src/M000016.html",
     "docs/classes/Wowr/Classes/ItemTooltip.html",
     "docs/classes/Wowr/Classes/ItemTooltip.src/M000051.html",
     "docs/classes/Wowr/Classes/ItemVendor.html",
     "docs/classes/Wowr/Classes/ItemVendor.src/M000026.html",
     "docs/classes/Wowr/Classes/ManaRegen.html",
     "docs/classes/Wowr/Classes/ManaRegen.src/M000005.html",
     "docs/classes/Wowr/Classes/Melee.html",
     "docs/classes/Wowr/Classes/Melee.src/M000013.html",
     "docs/classes/Wowr/Classes/PetBonus.html",
     "docs/classes/Wowr/Classes/PetBonus.src/M000004.html",
     "docs/classes/Wowr/Classes/PlanItem.html",
     "docs/classes/Wowr/Classes/PlanItem.src/M000032.html",
     "docs/classes/Wowr/Classes/Profession.html",
     "docs/classes/Wowr/Classes/Profession.src/M000059.html",
     "docs/classes/Wowr/Classes/Pvp.html",
     "docs/classes/Wowr/Classes/Pvp.src/M000060.html",
     "docs/classes/Wowr/Classes/Ranged.html",
     "docs/classes/Wowr/Classes/Ranged.src/M000042.html",
     "docs/classes/Wowr/Classes/Reagent.html",
     "docs/classes/Wowr/Classes/Reagent.src/M000034.html",
     "docs/classes/Wowr/Classes/Resilience.html",
     "docs/classes/Wowr/Classes/Resilience.src/M000061.html",
     "docs/classes/Wowr/Classes/Resistance.html",
     "docs/classes/Wowr/Classes/Resistance.src/M000041.html",
     "docs/classes/Wowr/Classes/SearchItem.html",
     "docs/classes/Wowr/Classes/SearchItem.src/M000050.html",
     "docs/classes/Wowr/Classes/SecondBar.html",
     "docs/classes/Wowr/Classes/SecondBar.src/M000014.html",
     "docs/classes/Wowr/Classes/Skill.html",
     "docs/classes/Wowr/Classes/Skill.src/M000058.html",
     "docs/classes/Wowr/Classes/SkillCategory.html",
     "docs/classes/Wowr/Classes/SkillCategory.src/M000019.html",
     "docs/classes/Wowr/Classes/Spell.html",
     "docs/classes/Wowr/Classes/Spell.src/M000011.html",
     "docs/classes/Wowr/Classes/SpellDamage.html",
     "docs/classes/Wowr/Classes/SpellDamage.src/M000030.html",
     "docs/classes/Wowr/Classes/Spirit.html",
     "docs/classes/Wowr/Classes/Spirit.src/M000033.html",
     "docs/classes/Wowr/Classes/Stamina.html",
     "docs/classes/Wowr/Classes/Stamina.src/M000022.html",
     "docs/classes/Wowr/Classes/Strength.html",
     "docs/classes/Wowr/Classes/Strength.src/M000031.html",
     "docs/classes/Wowr/Classes/TalentSpec.html",
     "docs/classes/Wowr/Classes/TalentSpec.src/M000040.html",
     "docs/classes/Wowr/Classes/WeaponCritChance.html",
     "docs/classes/Wowr/Classes/WeaponCritChance.src/M000063.html",
     "docs/classes/Wowr/Classes/WeaponDamage.html",
     "docs/classes/Wowr/Classes/WeaponDamage.src/M000020.html",
     "docs/classes/Wowr/Classes/WeaponHitRating.html",
     "docs/classes/Wowr/Classes/WeaponHitRating.src/M000012.html",
     "docs/classes/Wowr/Classes/WeaponPower.html",
     "docs/classes/Wowr/Classes/WeaponPower.src/M000052.html",
     "docs/classes/Wowr/Classes/WeaponSkill.html",
     "docs/classes/Wowr/Classes/WeaponSkill.src/M000064.html",
     "docs/classes/Wowr/Classes/WeaponSpeed.html",
     "docs/classes/Wowr/Classes/WeaponSpeed.src/M000006.html",
     "docs/classes/Wowr/Exceptions.html",
     "docs/classes/Wowr/Exceptions.src/M000001.html",
     "docs/classes/Wowr/Exceptions/CharacterNotFound.html",
     "docs/classes/Wowr/Exceptions/EmptyPage.html",
     "docs/classes/Wowr/Exceptions/GuildNotFound.html",
     "docs/classes/Wowr/Exceptions/InvalidArenaTeamSize.html",
     "docs/classes/Wowr/Exceptions/InvalidSearchType.html",
     "docs/classes/Wowr/Exceptions/InvalidXML.html",
     "docs/classes/Wowr/Exceptions/ItemNotFound.html",
     "docs/classes/Wowr/Exceptions/NoSearchString.html",
     "docs/classes/Wowr/Exceptions/SearchError.html",
     "docs/classes/Wowr/Extensions.html",
     "docs/created.rid",
     "docs/files/lib/wowr/classes_rb.html",
     "docs/files/lib/wowr/exceptions_rb.html",
     "docs/files/lib/wowr/extensions_rb.html",
     "docs/files/lib/wowr_rb.html",
     "docs/fr_class_index.html",
     "docs/fr_file_index.html",
     "docs/fr_method_index.html",
     "docs/index.html",
     "docs/rdoc-style.css",
     "example.rb",
     "lib/wowr.rb",
     "lib/wowr/achievements.rb",
     "lib/wowr/arena_team.rb",
     "lib/wowr/calendar.rb",
     "lib/wowr/character.rb",
     "lib/wowr/dungeon.rb",
     "lib/wowr/exceptions.rb",
     "lib/wowr/extensions.rb",
     "lib/wowr/general.rb",
     "lib/wowr/guild.rb",
     "lib/wowr/guild_bank.rb",
     "lib/wowr/item.rb",
     "test/wowr_arena_team_test.rb",
     "test/wowr_character_test.rb",
     "test/wowr_dungeon_test.rb",
     "test/wowr_guild_test.rb",
     "test/wowr_item_test.rb",
     "test/wowr_test.rb",
     "test/xml/arena_team_search.xml",
     "test/xml/arena_team_single.xml",
     "test/xml/armory-search.xml",
     "test/xml/armory_search.xml",
     "test/xml/benedictt.xml",
     "test/xml/character-reputation.xml",
     "test/xml/character-sheet.xml",
     "test/xml/character-skills.xml",
     "test/xml/character-talents.xml",
     "test/xml/character_info.xml",
     "test/xml/character_search.xml",
     "test/xml/dungeonStrings.xml",
     "test/xml/dungeons.xml",
     "test/xml/example.xml",
     "test/xml/guild-info.xml",
     "test/xml/item-info.xml",
     "test/xml/item-tooltip.xml",
     "test/xml/itemSearch.xml",
     "test/xml/item_search.xml",
     "vendor/cache/hpricot-0.8.2.gem",
     "vendor/cache/json-1.4.3.gem",
     "wowr.gemspec"
  ]
  s.homepage = %q{http://wowr.rubyforge.org/}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{wowr}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A Ruby library for the World of Warcraft Armory}
  s.test_files = [
    "test/wowr_arena_team_test.rb",
     "test/wowr_character_test.rb",
     "test/wowr_dungeon_test.rb",
     "test/wowr_guild_test.rb",
     "test/wowr_item_test.rb",
     "test/wowr_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hpricot>, ["= 0.8.1"])
      s.add_runtime_dependency(%q<json>, ["= 1.4.3"])
    else
      s.add_dependency(%q<hpricot>, ["= 0.8.1"])
      s.add_dependency(%q<json>, ["= 1.4.3"])
    end
  else
    s.add_dependency(%q<hpricot>, ["= 0.8.1"])
    s.add_dependency(%q<json>, ["= 1.4.3"])
  end
end

