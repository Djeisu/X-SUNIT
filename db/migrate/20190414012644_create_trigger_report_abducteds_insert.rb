# This migration was auto-generated via `rake db:generate_trigger_migration'.
# While you can edit this file, any changes you make to the definitions here
# will be undone by the next auto-generated trigger migration.

class CreateTriggerReportAbductedsInsert < ActiveRecord::Migration[5.2]
  def up
    create_trigger("report_abducteds_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("report_abducteds").
        after(:insert) do
      <<-SQL_ACTIONS
UPDATE survivors s SET abducted = true WHERE s.id IN
    (SELECT ra.survivor_abducted_id AS survivor_id
    FROM report_abducteds ra 
    WHERE ( SELECT count(rea.survivor_abducted_id) 
      FROM report_abducteds rea 
      WHERE ra.survivor_abducted_id = rea.survivor_abducted_id ) >= 3 
    GROUP BY ra.survivor_abducted_id);
      SQL_ACTIONS
    end
  end

  def down
    drop_trigger("report_abducteds_after_insert_row_tr", "report_abducteds", :generated => true)
  end
end
