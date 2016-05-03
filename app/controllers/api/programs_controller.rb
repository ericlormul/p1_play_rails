class Api::ProgramsController < Api::AuthenticatedApiController 
  def create
    if !is_admin
      return
    end
    program = Program.create(permit_program)
    render json: {status: 'created', id: program.id}, status: 201
  end

  def get
    program = Program.get(params[:id])
    render json: program
  end

  def get_full
    
  end

  def update
    if !is_admin
      return
    end
    program = permit_program
    program = Program.update(program[:id], program)
    render json: {status: 'updated', id: program.id}, status: 200
  end

  def search
    programs = Program.search(params[:q])
    render json: programs
  end

  def get_by_category
    programs = Program.get_by_category(params[:c])
    render json: programs
  end  

  private
  def permit_program
    params.require(:program).permit(:id, :name, :summary, :description, :photo_id, :provider_id, :website, :category, :age_start, :age_end, :refund_policy, :syllabus, :application_detail, :contact_info)
  end
end
