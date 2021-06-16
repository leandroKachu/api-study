class KindsController < ApplicationController
    include ActionController::HttpAuthentication::Token::ControllerMethods
    # TOKEN = "secret123"
    before_action :authenticate_user!
    # before_action :authenticate == jwt

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

    # def authenticate ==== utilizando jwt para autenticar
    #     authenticate_or_request_with_http_token do  |token, options|
    #     hmac_secret = "my3secr3tk3y"
    #         # aqui estou fazendo uma tratativa de sessão, que recebe o token, valida e libera acesso, 
    #         # também adiciona o expiration time claim
    #         begin
    #             decoded_token = JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }
    #           rescue JWT::ExpiredSignature
    #             render json: "Token se foi fi"
    #             # Handle expired token, e.g. logout user or deny access
    #           end
    #         # ActiveSupport::SecurityUtils.secure_compare(
    #         #     ::Digest::SHA256.hexdigest(token),
    #         #     ::Digest::SHA256.hexdigest(TOKEN)
    #         # )
    #     end
    # end

    def set_kind
        @kind = Kind.find(params[:id])
    end

    def kind_params
        params.require(:kind).permit(:description)
    end
end
