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
            def updateLocation
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