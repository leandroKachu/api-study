class KindsController < ApplicationController
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

    def set_kind
        @kind = Kind.find(params[:id])
    end

    def kind_params
        params.require(:kind).permit(:description)
    end
end
