class Advisor::AssignClientController < Advisor::BaseController

  def update
    client = Client.find(params[:client_id])
    client.advisor = Advisor.find(client_params[:advisor_id])
    if client.advisor && client.save(validate: false)
      AdvisorMailer.notify_assigned(client).deliver_now unless current_advisor == client.advisor
      flash[:success] = I18n.t('clients.flashes.success.advisor_assigned')
    else
      flash[:error] = I18n.t('clients.flashes.error.advisor_assignment')
    end
    redirect_to edit_advisor_client_path(id: params[:client_id])
  end

  private

  def client_params
    params.require(:client).permit(:advisor_id)
  end

end
