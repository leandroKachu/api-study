class AuthsController < ApplicationController
    def create
        # esse é a estrutura do meu token
        # OBSS: exp é o tempo válido do meu token, ex: abaixo passando no payload, 
        # que no metodo de verificacao de token, vai levar em consideração

        hmac_secret = "my3secr3tk3y"
        exp = Time.now.to_i + 20
        payload = { name: params[:name], exp: exp  }   
        token = JWT.encode payload, hmac_secret, 'HS256'
        render json: {token: token}
    end

end
