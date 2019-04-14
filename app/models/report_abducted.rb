class ReportAbducted < ApplicationRecord
  belongs_to :survivor_report, class_name: 'Survivor'
  belongs_to :survivor_abducted, class_name: 'Survivor'

  # #Create Triggers for Report Survivors Abducted
  # trigger.after(:insert) do
  #   "UPDATE survivors s SET abducted = true WHERE s.id IN
  #   (SELECT ra.survivor_abducted_id AS survivor_id
  #   FROM report_abducteds ra 
  #   WHERE ( SELECT count(rea.survivor_abducted_id) 
  #     FROM report_abducteds rea 
  #     WHERE ra.survivor_abducted_id = rea.survivor_abducted_id ) >= 3 
  #   GROUP BY ra.survivor_abducted_id); "
  # end

end
