module Wowr
  module API
    class API
      VERSION = '0.4.1'

      @@search_url = 'search.xml'

      @@calendar_user_url = 'vault/calendar/month-user.json'
      @@calendar_world_url = 'vault/calendar/month-world.json'
      @@calendar_detail_url = 'vault/calendar/detail.json'

      @@guild_bank_contents_url = 'vault/guild-bank-contents.xml'
      @@guild_bank_log_url      = 'vault/guild-bank-log.xml'

      @@login_url = 'login/login.xml'

      @@dungeons_url = '_data/dungeons.xml'
      @@dungeons_strings_url = 'data/dungeonStrings.xml'

      cattr_accessor :search_url,
        :guild_bank_contents_url, :guild_bank_log_url,
        :login_url,
        :dungeons_url, :dungeons_strings_url,
        :calendar_user_url, :calendar_world_url, :calendar_detail_url

      @@calendar_world_types = ['player', 'holiday', 'bg', 'darkmoon', 'raidLockout', 'raidReset', 'holidayWeekly']
      @@calendar_user_types = ['raid', 'dungeon', 'pvp', 'meeting', 'other']

      attr_accessor :character_name, :guild_name, :realm, :locale, :lang, :caching, :cache_timeout, :debug

      include Client
      include Login

      include ArenaTeams
      include Characters
      include Guilds
      include Items

      # Constructor
      # Accepts an optional hash of parameters to create defaults for all API requests
      # * options (Hash) - Hash used to set default values for all API requests
      def initialize(options = {})
        @character_name = options[:character_name]
        @guild_name     = options[:guild_name]
        @realm          = options[:realm]
        @locale         = options[:locale] || 'us'
        @lang           = options[:lang].nil? ? 'default' : options[:lang]
        @caching        = options[:caching].nil? ? true : options[:caching]
        @cache_timeout  = options[:cache_timeout] || @@default_cache_timeout
        @debug          = options[:debug] || false
      end

      # General-purpose search
      # All specific searches are wrappers around this method. Best to use those instead.
      # Returns an array of results of the type requested (Wowr::Classes::SearchCharacter etc.) or an empty array.
      # Searches across all realms.
      # Caching is disabled for searching.
      # * string (String) Search string
      # * options (Hash) Optional hash of arguments identical to those used in the API constructor (realm, debug, cache etc.)
      def search(string, options = {})
        if (string.is_a?(Hash))
          options = string
        else
          options.merge!(:search => string)
        end

        options = merge_defaults(options)

        if options[:search].nil? || options[:search].empty?
          raise Wowr::Exceptions::NoSearchString.new
        end

        if !valid_search_type?(options[:type])
          raise Wowr::Exceptions::InvalidSearchType.new(options[:type])
        end

        options.merge!(:caching => false)
        options.delete(:realm) # all searches are across realms

        xml = get_xml(@@search_url, options)

        results = []

        if (xml) && (xml%'armorySearch') && (xml%'armorySearch'%'searchResults')
          case options[:type]

          when 'items'
            (xml%'armorySearch'%'searchResults'%'items'/:item).each do |item|
              results << Wowr::Classes::SearchItem.new(item)
            end

          when 'characters'
            (xml%'armorySearch'%'searchResults'%'characters'/:character).each do |char|
              results << Wowr::Classes::SearchCharacter.new(char, self)
            end

          when 'guilds'
            (xml%'armorySearch'%'searchResults'%'guilds'/:guild).each do |guild|
              results << Wowr::Classes::SearchGuild.new(guild)
            end

          when 'arenateams'
            (xml%'armorySearch'%'searchResults'%'arenaTeams'/:arenaTeam).each do |team|
              results << Wowr::Classes::SearchArenaTeam.new(team)
            end
          end
        end

        return results
      end

      # Get the current items within the guild bank.
      # Note that the bags and items the user can see is dependent on their privileges.
      # Requires realm.
      # * cookie (String) Cookie data returned by the login function.
      # * guild_name (String) Guild name
      # * options (Hash) Optional hash of arguments identical to those used in the API constructor (realm, debug, cache etc.)
      def get_guild_bank_contents(cookie, name = @guild_name, options = {})
        full_cookie = ' JSESSIONID='+cookie

        if (cookie.is_a?(Hash))
          options = full_cookie
        elsif (guild_name.is_a?(Hash))
          options = guild_name
          options.merge!(:cookie => full_cookie)
          options.merge!(:guild_name => name)
        else
          options.merge!(:cookie => full_cookie)
          options.merge!(:guild_name => name)
        end
        options = merge_defaults(options)

        if options[:cookie].nil? || options[:cookie] == ""
          raise Wowr::Exceptions::CookieNotSet.new
        elsif options[:guild_name].nil? || options[:guild_name] == ""
          raise Wowr::Exceptions::GuildNameNotSet.new
        elsif options[:realm].nil? || options[:realm] == ""
          raise Wowr::Exceptions::RealmNotSet.new
        end

        options.merge!(:secure => true)

        xml = get_xml(@@guild_bank_contents_url, options)

        if !(xml%'guildBank').children.empty?
          return Wowr::Classes::GuildBankContents.new(xml, self)
        else
          raise Wowr::Exceptions::GuildBankNotFound.new(options[:guild_name])
        end
      end

      # Get a particular page of the guild bank transaction log.
      # Each page contains up to 1000 transactions, other pages can be specified using :group in the options hash.
      # Note that data returned is specific to the logged in user's privileges.
      # Requires realm.
      # * cookie (String) Cookie data returned by the login function
      # * guild_name (String) Guild name
      # * options (Hash) Optional hash of arguments identical to those used in the API constructor (realm, debug, cache etc.)
      def get_guild_bank_log(cookie, name = @guild_name, options = {})
        full_cookie = ' JSESSIONID='+cookie

        if (cookie.is_a?(Hash))
          options = full_cookie
        elsif (name.is_a?(Hash))
          options = name
          options.merge!(:cookie => full_cookie)
          options.merge!(:guild_name => name)
        else
          options.merge!(:cookie => full_cookie)
          options.merge!(:guild_name => name)
        end

        options = merge_defaults(options)

        if options[:cookie].nil? || options[:cookie] == ""
          raise Wowr::Exceptions::CookieNotSet.new
        elsif options[:guild_name].nil? || options[:guild_name] == ""
          raise Wowr::Exceptions::GuildNameNotSet.new
        elsif options[:realm].nil? || options[:realm] == ""
          raise Wowr::Exceptions::RealmNotSet.new
        end

        options.merge!(:secure => true)

        xml = get_xml(@@guild_bank_log_url, options)

        if !(xml%'guildBank').children.empty?
          return Wowr::Classes::GuildBankLog.new(xml, self)
        else
          raise Wowr::Exceptions::GuildBankNotFound.new(options[:guild_name])
        end
      end

      def get_complete_world_calendar(cookie, name = @character_name, realm = @realm, options = {})
        options = calendar_options(cookie, event, name, realm, options)
        options = merge_defaults(options)

        events = []

        @@calendar_world_types.each do |type|
          options.merge!(:calendar_type => type)
          events = events.concat(get_world_calendar(options))
        end

        events.sort! { |a,b| a.start <=> b.start }

        return events
      end

      def get_world_calendar(cookie, name = @character_name, realm = @realm, options = {})
        options = calendar_options(cookie, event, name, realm, options)
        options = merge_defaults(options)

        if options[:cookie].nil? || options[:cookie] == ""
          raise Wowr::Exceptions::CookieNotSet.new
        elsif options[:character_name].nil? || options[:guild_name] == ""
          raise Wowr::Exceptions::CharacterNameNotSet.new
        elsif options[:realm].nil? || options[:realm] == ""
          raise Wowr::Exceptions::RealmNotSet.new
        end

        options.merge!(:secure => true)

        json = get_json(@@calendar_world_url, options)

        if (!json["events"])
          raise Wowr::Exceptions::EmptyPage
        end

        events = []

        json["events"].each do |event|
          events << Wowr::Classes::WorldCalendar.new(event, nil)
        end

        return events
      end

      def get_full_user_calendar(cookie, name = @character_name, realm = @realm, options = {})
        options = calendar_options(cookie, event, name, realm, options)
        options = merge_defaults(options)

        skel_events = get_user_calendar(options)
        full_events = []

        skel_events.each do |se|
          options.merge!(:event => se.id)
          full_events << get_calendar_event(options)
        end

        full_events.sort! { |a,b| a.start <=> b.start }

        return full_events
      end

      def get_user_calendar(cookie, name = @character_name, realm = @realm, options = {})
        options = calendar_options(cookie, event, name, realm, options)
        options = merge_defaults(options)

        if options[:cookie].nil? || options[:cookie] == ""
          raise Wowr::Exceptions::CookieNotSet.new
        elsif options[:character_name].nil? || options[:guild_name] == ""
          raise Wowr::Exceptions::CharacterNameNotSet.new
        elsif options[:realm].nil? || options[:realm] == ""
          raise Wowr::Exceptions::RealmNotSet.new
        end

        options.merge!(:secure => true)

        json = get_json(@@calendar_user_url, options)

        if (!json["events"])
          raise Wowr::Exceptions::EmptyPage
        end

        events = []

        json["events"].each do |event|
          events << Wowr::Classes::UserCalendar.new(event, nil)
        end

        return events
      end

      def get_calendar_event (cookie, event = nil, name = @character_name, realm = @realm, options = {})
        options = calendar_options(cookie, event, name, realm, options)
        options = merge_defaults(options)

        if options[:cookie].nil? || options[:cookie] == ""
          raise Wowr::Exceptions::CookieNotSet.new
        elsif options[:character_name].nil? || options[:guild_name] == ""
          raise Wowr::Exceptions::CharacterNameNotSet.new
        elsif options[:realm].nil? || options[:realm] == ""
          raise Wowr::Exceptions::RealmNotSet.new
        elsif options[:event].nil? || options[:event] == ""
          raise Wowr::Exceptions::EventNotSet.new
        end

        options.merge!(:secure => true)

        json = get_json(@@calendar_detail_url, options)

        if (!json.is_a?(Hash))
          raise Wowr::Exceptions::EmptyPage
        end

        return Wowr::Classes::UserDetailCalendar.new(json, nil)
      end

      # Get complete list of dungeons.
      # WARNING: This gets two 6k xml files so it's not that fast
      # Takes 0.2s with cache, 2s without
      # New approach: Instead of passing the XML around and performing multiple
      # search lookups to find the elements, run through each XML file once
      # adding data to classes as they appear using hash lookup.
      # Went from 14s to 2s :)
      # * options (Hash) Optional hash of arguments identical to those used in the API constructor (realm, debug, cache etc.)
      def get_dungeons(options = {})
        options = merge_defaults(options)

        # dungeon_strings contains names for ids
        dungeon_xml = get_xml(@@dungeons_url, options)%'dungeons'

        dungeon_strings_xml = get_xml(@@dungeons_strings_url, options)

        results = {}

        # TODO: Pass the correct part of dungeon_strings_xml to each dungeon?
        if dungeon_xml && !dungeon_xml.children.empty?
          (dungeon_xml/:dungeon).each do |elem|
            dungeon = Wowr::Classes::Dungeon.new(elem)
            results[dungeon.id] = dungeon   if dungeon.id
            results[dungeon.key] = dungeon  if dungeon.key
          end

          (dungeon_strings_xml/:dungeon).each do |elem|
            id = elem[:id].to_i
            key = elem[:key]

            if (results[id])
              results[id].add_name_data(elem)
            elsif (results[key])
              results[key].add_name_data(elem)
            end
          end
        else
          raise Wowr::Exceptions::InvalidXML.new()
        end

        return results
      end

      # Clear the cache, optional directory name.
      # * cache_path (String) Relative path of the cache directory to be deleted
      # TODO: This method is only used by test teardown; remove it when we remove tests
      def clear_cache(cache_path = @@cache_directory_path)
        begin
          FileUtils.remove_dir(cache_path)
        rescue Exception => e

        end
      end

      private

      def calendar_options(cookie, event = nil, name = @character_name, realm = @realm, options = {})
        full_cookie = ' JSESSIONID='+cookie

        if (cookie.is_a?(Hash))
          options = full_cookie
        elsif (name.is_a?(Hash))
          options = name
          options.merge!(:cookie => full_cookie)
          options.merge!(:character_name => @character_name)
          options.merge!(:realm => @realm)
        elsif (realm.is_a?(Hash))
          options = realm
          options.merge!(:cookie => full_cookie)
          options.merge!(:character_name => name)
          options.merge!(:realm => @realm)
        else
          options.merge!(:cookie => full_cookie)
          options.merge!(:character_name => name)
          options.merge!(:realm => realm)
        end

        options
      end

      # Determines if the given +value+ is a valid search type
      def valid_search_type?(value)
        %w(items characters guilds arenateams).include? value
      end

      # Merge the defaults specified in the constructor with those supplied,
      # overriding any defaults with those supplied
      def merge_defaults(options = {})
        defaults = {}
        # defaults[:character_name] = @charater_name if @charater_name
        # defaults[:guild_name] = @guild_name if @guild_name
        defaults[:realm]          = @realm          if @realm
        defaults[:locale]         = @locale         if @locale
        defaults[:lang]           = @lang           if @lang
        defaults[:caching]        = @caching        if @caching
        defaults[:cache_timeout]  = @cache_timeout  if @cache_timeout
        defaults[:debug]          = @debug          if @debug

        # overwrite defaults with any given options
        defaults.merge!(options)
      end

    end
  end
end