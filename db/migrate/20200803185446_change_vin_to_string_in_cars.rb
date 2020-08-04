class ChangeVinToStringInCars < ActiveRecord::Migration[5.2]
  #https://stackoverflow.com/questions/51814399/when-renaming-column-in-users-table-getting-sqlite3constraintexception-forei/51815720#51815720
  def change
    connection.execute("PRAGMA defer_foreign_keys = ON")
    connection.execute("PRAGMA foreign_keys = OFF")
    change_column :cars, :vin, :string
    connection.execute("PRAGMA foreign_keys = ON")
    connection.execute("PRAGMA defer_foreign_keys = OFF")
  end
end
