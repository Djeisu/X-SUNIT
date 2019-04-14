module Api
    module V1
        class SurvivorsController < ApplicationController
            
            ## GET ALL SURVIVORS
            def index
                survivors = Survivor.order('name ASC');
                render json: {status: 'SUCCESS', message:'List of the Survivors', data:survivors},status: :ok
            end
            ## GET SURVIVOR BY ID
            def show
                survivor = Survivor.find(params[:id])
                render json: {status: 'SUCCESS', message:'Loaded Survivor', data:survivor},status: :ok
            end
                ## GET LAST LOCATION OF THE SURVIVOR BY ID
            def lastlocation
                survivor = Survivor.find(params[:id])
                data = {
                    "id": survivor.id,
                    "name": survivor.name,
                    "latitude": survivor.latitude,
                    "longitude": survivor.longitude
                }
                render json: {status: 'SUCCESS', message:'Loaded Last Location Survivor', data: data},status: :ok
            end
                ## GET LAST LOCATION OF THE SURVIVOR BY ID
            def allsurvivors
                survivors = Survivor.select('id,name,abducted').order('name ASC');
                render json: {status: 'SUCCESS', message:'Loaded data of the Survivors', data: survivors},status: :ok
            end
            ## GET SURVIVORS ABDUCTEDS
            def abducteds
                abducteds = Survivor.where(abducted: false)
                survivor = Survivor.all()
                pr = ((abducteds.length).to_f / (survivor.length).to_f * 100.0).round(2)
                render json: {status: 'SUCCESS', message:'Retrievered data about survivors abducted', percents_of_abducteds: pr, abducteds: abducteds},status: :ok
            end
            ## GET SURVIVORS NON-ABDUCTED
            def nonabducteds
                nonabducteds = Survivor.where(abducted: true)
                survivor = Survivor.all()
                pr = ((nonabducteds.length).to_f / (survivor.length).to_f * 100.0).round(2)
                render json: {status: 'SUCCESS', message:'Retrievered data about survivors non-abducted', percents_of_nonabducteds: pr, nonabducteds: nonabducteds},status: :ok
            end
            ## CREATE A NEW REGISTER OF SURVIVOR
            def create
                survivor = Survivor.new(survivor_params)
                if survivor.save
                    render json: {status: 'SUCCESS', message:'Saved Survivor in database', data:survivor},status: :ok
                else
                    render json: {status: 'ERROR', message:'Survivor not saved in database', data:survivor.erros},status: :unprocessable_entity
                end
            end
            ## UPDATE A REGISTER OF SURVIVOR BY ID
            def update
                survivor = Survivor.find(params[:id])
                if survivor.update_attributes(survivor_params)
                    render json: {status: 'SUCCESS', message: 'Uploaded Survivor ', data: survivor},status: :ok
                else
                    render json: {status: 'ERROR', message: 'Survivor not uploaded in database', data: survivor.erros},status: :ok
                end
            end
                #UPDATE JUST LOCATION
            def updatelocation
                survivor = Survivor.find(params[:id])
                if survivor.update_attributes(survivor_params)
                    render json: {status: 'SUCCESS', message: 'Uploaded Survivor Location', data: survivor},status: :ok
                else
                    render json: {status: 'ERROR', message: 'Survivor not uploaded in database', data: survivor.erros},status: :ok
                end
            end
            ## REMOVE A REGISTER OF SURVIVOR BY ID
            def destroy
                survivor = Survivor.find(params[:id])
                survivor.destroy
                render json: {status: 'SUCCESS', message: 'Deleted Survivor', data: survivor},status: :ok
            end

            # Parametros aceitos
			private
			def survivor_params
				params.permit(:name, :age, :gender, :latitude, :longitude)
            end
        end
    end
end