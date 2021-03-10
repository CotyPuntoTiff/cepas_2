class WinesController < ApplicationController
  before_action :authenticate_user!

    def index
        @wines = Wine.all.includes([:strains, :wine_strains])
        @wine = Wine.new
        @strains = Strain.all
    end

    def create
        @wine = Wine.new(wine_params)
            
        strains_ids = params[:wine][:strain_ids]
        strains_ids.delete("") unless strains_ids.nil?

        strains_percent = params[:wine][:strain_percent]
        strains_percent.delete("") unless strains_percent.nil?

        if @wine.save 
          unless strains_ids.nil?
            strains_ids.length.times do |i| 

              WineStrain.create( 
                wine_id: @wine.id, 
                strain_id: strains_ids[i], 
                percent: strains_percent[i] 
              )
            end
          end

          flash[:success] = "Wine successfully created"
          redirect_to root_path
        else
          flash[:error] = "Something went wrong"
          redirect_to root_path
        end

      
    end

    def edit
      @wine = Wine.find(params[:id])
      @oenologists = Oenologist.all
    end
    
    private
    def wine_params
        params.require(:wine).permit(:name)
    end  
end