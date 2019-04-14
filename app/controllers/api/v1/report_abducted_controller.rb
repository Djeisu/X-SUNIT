module Api
    module V1
        class ReportAbductedController < ApplicationController

            def report
                # render json: {response: 'chegou'}
                report = ReportAbducted.new(report_params)

                reports = ReportAbducted.where(survivor_abducted_id: report.survivor_abducted_id);

                if report.save
                    render json: {status: 'SUCCESS', message:'Saved report in database', data:report, reports_abducted: reports.length},status: :ok
                else
                    render json: {status: 'ERROR', message:'Report not saved in database', data:report.erros},status: :unprocessable_entity
                end
            end

            # Parametros aceitos
			private
			def report_params
				params.permit(:survivor_report_id, :survivor_abducted_id)
            end

        end
    end
end