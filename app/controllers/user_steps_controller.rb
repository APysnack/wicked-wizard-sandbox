class UserStepsController < ApplicationController
  include Wicked::Wizard
  steps :personal, :social
    
  def show
    respond_to do |format|

      case step
      when :social 
        @some_variable = params[:some_variable].present? ? params[:some_variable] : "hello"
        # format.turbo_stream { render turbo_stream: turbo_stream.replace("foo_turbo_frame", partial: "user_steps/partial", locals: { some_variable: @some_variable }) }
      end

      @user = current_user
      format.html { render_wizard }
    end
  end
    
  def update
    @user = current_user
    @user.attributes = user_params
    render_wizard @user
  end
    
  private
  
  def finish_wizard_path
    @user.save!
    root_path
  end

  def user_params
    params.require(:user).permit!
  end
end