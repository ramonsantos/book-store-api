# frozen_string_literal: true

class V1::Admin::AdminsController < V1::Admin::BaseController
  before_action :authenticate_admin!
  before_action :authorize_admin, only: [:destroy]

  def destroy
    admin.destroy

    head(:no_content)
  end

  private

  def admin
    @admin ||= Admin.find(params[:id])
  end

  def authorize_admin
    authorize(Admin)
  end
end
