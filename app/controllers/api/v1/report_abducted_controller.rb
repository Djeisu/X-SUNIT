module Api
    module V1
        class ReportAbductedController < ApplicationController

            def report
                s_report_id = params[:survivor_report_id]
                s_abducted_id = params[:survivor_abducted_id]
                if s_report_id != s_abducted_id
                    survivor_report = Survivor.find(s_report_id)
                    survivor_abducted = Survivor.find(s_abducted_id)

                    if !survivor_report.abducted
                        report = ReportAbducted.new(report_params)
                        reports = ReportAbducted.where(survivor_abducted_id: report.survivor_abducted_id);
                        
                        if report.save
                            render json: {status: 'SUCCESS', message:'Saved report in database', data:report, reports_abducted: reports.length},status: :ok
                        else
                            render json: {status: 'ERROR', message:'Report not saved in database', data:report.erros},status: :unprocessable_entity
                        end
                    else
                        render json: {status: 'ERROR', message:"People's abducted can't report abductions"},status: :unprocessable_entity
                    end
                else
                    render json: {status: 'ERROR', message:"You can't report your abdution"},status: :unprocessable_entity    
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