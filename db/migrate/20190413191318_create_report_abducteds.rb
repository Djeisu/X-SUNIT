class CreateReportAbducteds < ActiveRecord::Migration[5.2]
  def change
    create_table :report_abducteds do |t|
      t.references :survivor_report, foreign_key: { to_table: :survivors }
      t.references :survivor_abducted, foreign_key: { to_table: :survivors }

      t.timestamps
    end
  end
end
