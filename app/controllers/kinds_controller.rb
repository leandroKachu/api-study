class KindsController < ApplicationController
    include ActionController::HttpAuthentication::Token::ControllerMethods
    TOKEN = "secret123"
    before_action :authenticate

    before_action :set_kind, only: [:show, :destroy, :update]
   
    def index 
        @kinds = Kind.all
        render json: @kinds, status: :partial_content
    end
    
    def show 
        render json: @kind
    end

    def create 
        kind = kind.new(kind_params)
        if kind.save
            render json: @kind, status: :created, location: @kind
        else
            render json: @kind.errors, status: :unprocessable_entify
        end
    end

    def update
        if kind.update(kind_params)
            render json: @kind, status: :updated, location: kind
        else
            render json: @kind.errors, status: :unprocessable_entify
        end
    end

    def destroy
        @kind.destroy
    end

    private

    def authenticate
        authenticate_or_request_with_http_token do  |token, options| 
            ActiveSupport::SecurityUtils.secure_compare(
                ::Digest::SHA256.hexdigest(token),
                ::Digest::SHA256.hexdigest(TOKEN)
                
            )
        end
    end

    def set_kind
        @kind = Kind.find(params[:id])
    end

    def kind_params
        params.require(:kind).permit(:description)
    end
end
