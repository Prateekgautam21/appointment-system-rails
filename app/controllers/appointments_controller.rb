class AppointmentsController < ApplicationController

    def index
        @user = current_user
    end

    def new
        @appointment = Appointment.new
    end

    def create
        @appointment = Appointment.new(appointment_params)
        @appointment.user_id = current_user.id

        totalappointmentsofsametime = Appointment.where(dateOfservice: @appointment.dateOfservice,
                                                        timeOfservice: @appointment.timeOfservice).count
        puts totalappointmentsofsametime
        if totalappointmentsofsametime>2
          redirect_to new_appointment_path, alert:'Sorry, We are not available on this time slot, try something else.' and return
        end
        if @appointment.save
            @services = Service.all
            @appointment.totalbill = 0.0
            if @appointment.hasServiceA
                @appointment.totalbill += @services.first.price
            end
            if @appointment.hasServiceB
            @appointment.totalbill += @services.second.price
            end
            if @appointment.hasServiceC
            @appointment.totalbill += @services.third.price
            end
            @appointment.save
            redirect_to appointments_path, notice:'Congratulations! Your appointment has been booked.'
        else
            render :new
        end
    end

    def destroy
        @user = current_user
        @appointment = @user.appointments.find(params[:id])
        @appointment.destroy
        redirect_to appointments_path, alert: 'Your appointment was successfully deleted.'
    end

    private def appointment_params
        params.require(:appointment).permit(:dateOfservice, :timeOfservice, :hasServiceA, :hasServiceB, :hasServiceC)
    end
end
