class OrgsController < ApplicationController
  def index
    @orgs = Org.all

  end

  def create
    org_created = Org.new(org_params)
    org_created.user = current_user
    
    if org_created.save 
      # you are automatically a member of your own group
      Member.create(user:current_user, org: org_created)
    else 
      flash[:errors]=org_created.errors.full_messages
    end
    redirect_to '/groups'
  end 

  def show
    @org = Org.find(params[:id])
    @isMember = @org.members.where(user: current_user)

  end

  def join
    Member.create(user:current_user, org: Org.find(params[:id]))
    redirect_to '/groups/'+params[:id]
  end

  def leave
    m = Member.find_by_user_id_and_org_id(current_user.id, params[:id])
    m.destroy
    redirect_to '/groups/'+params[:id]
  end
  
  def delete
    o = Org.find(params[:id])
    o.destroy
    redirect_to '/groups'
  end

  private
  def org_params
    params.require(:event).permit(:name, :desc, session[:id])
  end
  
end
