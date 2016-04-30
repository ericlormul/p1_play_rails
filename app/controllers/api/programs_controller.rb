class Api::ProgramsController < Api::AuthenticatedApiController 
  def create
    person = authenticate_token
    unless person && person.role == 'admin'
      render json: { error: 'Bad Token'}, status: 401
      return
    end
    Program.create(permit_program)
    render json: {status: 'created'}, status: 201
  end

  def get
    camp = Program.get(params[:id])
    render json: camp
  end

  def search
    camps = Program.search(params[:q])
    render json: camps
  end

  def get_by_category
    camps = Program.get_by_category(params[:c])
    render json: camps
  end  

  private
  def permit_program
    params.require(:program).permit(:name, :description, :photo_id, :provider_id, :website, :category, :age_start, :age_end, :refund_policy, :syllabus, :application_detail, :contact_info)
  end
end
