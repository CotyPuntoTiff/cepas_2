class OenologistsController < ApplicationController
    before_action :authenticate_user!
      def new
          @oenologist = Oenologist.new
          @magazines = Magazine.all
      end
      
      def create
          @oenologist = Oenologist.new(oenologist_params)
          if @oenologist.save
            flash[:success] = "Oenologist successfully created"
            redirect_to root_path
          else
            flash[:error] = "Something went wrong"
            render 'new'
          end
      end
      
      private
      def oenologist_params
          params.require(:oenologist).permit(:name, :age, :nationality, :editor, :writer, :reviewer)
      end
      
  end
  