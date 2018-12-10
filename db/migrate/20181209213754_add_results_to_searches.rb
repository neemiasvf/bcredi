class AddResultsToSearches < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'hstore'
    add_column :searches, :results, :hstore, array: true
  end
end
