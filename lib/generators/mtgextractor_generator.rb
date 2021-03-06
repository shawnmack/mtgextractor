require 'rails/generators'

module MTGExtractor
  class MTGExtractorGenerator < ::Rails::Generators::Base
    namespace 'mtgextractor'

    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)

    def self.next_migration_number(path)
      unless @prev_migration_nr
        @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
      else
        @prev_migration_nr += 1
      end
      @prev_migration_nr.to_s
    end

    def copy_card_classes
      copy_file "models/mtg_card.rb", "app/models/mtg_card.rb"
      copy_file "models/mtg_set.rb", "app/models/mtg_set.rb"
      copy_file "models/mtg_type.rb", "app/models/mtg_type.rb"
      copy_file "models/mtg_card_type.rb", "app/models/mtg_card_type.rb"
    end

    def copy_helpers
      copy_file "helpers/mtg_helpers.rb", "lib/mtg_helpers.rb"
    end

    def create_migration_files
      migration_template "migrations/create_mtg_cards.rb", "db/migrate/create_mtg_cards.rb"
      migration_template "migrations/create_mtg_sets.rb", "db/migrate/create_mtg_sets.rb"
      migration_template "migrations/create_mtg_types.rb", "db/migrate/create_mtg_types.rb"
      migration_template "migrations/create_mtg_card_types.rb", "db/migrate/create_mtg_card_types.rb"
    end


  end
end

