class Survivor < ApplicationRecord
    has_many :report_abducteds

    validates :name, presence: true
    validates :age, presence: true
    validates :gender, presence: true
    validates :abducted, presence: false
    validates :latitude, presence: true
    validates :longitude, presence: true
    
    before_save :default_values

    def default_values
        self.abducted ||= false
    end

    # # Create Triggers for Survivors (I don't know exactly how not execute this when i get this model, sorry)
    # trigger.after(:insert) do
    #     "INSERT INTO log_locations(survivor_id, latitude, longitude, created_at) VALUES (NEW.id, NEW.latitude, NEW.longitude, NEW.updated_at);"
    # end

    # trigger.after(:update) do |t|
    #     t.of(:latitude,:longitude) do
    #         # some more sql
    #         "INSERT INTO log_locations(survivor_id, latitude, longitude, created_at) VALUES (NEW.id, NEW.latitude, NEW.longitude, NEW.updated_at);"
    #     end
    #     # t.all do # every row
    #     #     # some sql
    #     # end
    #     # t.where("OLD.bar != NEW.bar AND NEW.bar != 'lol'") do
    #     #     # some other sql
    #     # end
    # end
end
