class UsersController < ApplicationController
	def index
		@user = User.all
		puts @user.inspect
        
        render json: {
            values: @user,
            message: 'success'
        }, status: 200
	end

	def create
		puts params[:user].inspect
		@user = User.new(params[:user])
 
		@user.save

		render json: {
            values: @user,
            message: 'success'
        }, status: 200
	end

	def show
		@user = User.find(params[:id])

        if @user.present?
            render json: {
                values: @user,
                message: 'success'
            }, status: 200
        else
            render json: {
                values: '',
                message: 'not found'
            }, status: 400
        end
	end

	def update
		@user = User.find(params[:id])

		@user.update(params[:user])

		render json: {
            values: @user,
            message: 'success'
        }, status: 200
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy

		@userAll = User.all

		render json: {
            values: @userAll,
            message: 'success'
        }, status: 200
	end
end
