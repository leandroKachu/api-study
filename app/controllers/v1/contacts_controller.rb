 module V1
    class ContactsController < ApplicationController
        before_action :set_contact, only: [:show, :destroy, :update]

        def index 
            @contacts = Contact.all
            render json: @contacts, methods: :include, status: :partial_content
        end
        
        def show 
            render json: @contact, include: [:kind, :phones, :address], status: :created
        end

        def create 
            @contact = Contact.new(contact_params)
            if @contact.save
                render json: @contact, include: [:kind, :phones, :address], status: :created
            else
                render json: @contact.errors, status: :unprocessable_entify
            end
        end

        def update
            if @contact.update(contact_params)
                render json: @contact, include: [:kind, :phones, :address], status: :created
            else
                render json: @contact.errors, status: :unprocessable_entify
            end
        end

        def destroy
            @contact.destroy
        end

        private

        def set_contact
            @contact = Contact.find(params[:id])
        end

        def contact_params
            params.require(:contact).permit(:name, :email, :birthday, :kind_id, phones_attributes: [:id, :number],
                address_attributes: [:id, :street, :city])
        end

    end
end