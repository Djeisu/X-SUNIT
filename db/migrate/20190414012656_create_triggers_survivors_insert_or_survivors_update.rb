# This migration was auto-generated via `rake db:generate_trigger_migration'.
# While you can edit this file, any changes you make to the definitions here
# will be undone by the next auto-generated trigger migration.

class CreateTriggersSurvivorsInsertOrSurvivorsUpdate < ActiveRecord::Migration[5.2]
  def up
    create_trigger("survivors_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("survivors").
        after(:insert) do
      "INSERT INTO log_locations(survivor_id, latitude, longitude, created_at) VALUES (NEW.id, NEW.latitude, NEW.longitude, NEW.updated_at);"
    end

    create_trigger("survivors_after_update_row_tr", :generated => true, :compatibility => 1).
        on("survivors").
        after(:update) do |t|
      t.of(:latitude, :longitude) do
        "INSERT INTO log_locations(survivor_id, latitude, longitude, created_at) VALUES (NEW.id, NEW.latitude, NEW.longitude, NEW.updated_at);"
      end
    end
  end

  def down
    drop_trigger("survivors_after_insert_row_tr", "survivors", :generated => true)

    drop_trigger("survivors_after_update_row_tr", "survivors", :generated => true)

    drop_trigger("survivors_after_update_of_latitude_longitude_row_tr", "survivors", :generated => true)
  end
end
