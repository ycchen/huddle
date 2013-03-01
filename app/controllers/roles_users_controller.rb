class RolesUsersController < ApplicationController
  # GET /roles_users
  # GET /roles_users.json
  def index
    @roles_users = RolesUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @roles_users }
    end
  end

  # GET /roles_users/1
  # GET /roles_users/1.json
  def show
    @roles_user = RolesUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @roles_user }
    end
  end

  # GET /roles_users/new
  # GET /roles_users/new.json
  def new
    @roles_user = RolesUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @roles_user }
    end
  end

  # GET /roles_users/1/edit
  def edit
    @roles_user = RolesUser.find(params[:id])
  end

  # POST /roles_users
  # POST /roles_users.json
  def create
    @roles_user = RolesUser.new(params[:roles_user])

    respond_to do |format|
      if @roles_user.save
        format.html { redirect_to @roles_user, notice: 'Roles user was successfully created.' }
        format.json { render json: @roles_user, status: :created, location: @roles_user }
      else
        format.html { render action: "new" }
        format.json { render json: @roles_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /roles_users/1
  # PUT /roles_users/1.json
  def update
    @roles_user = RolesUser.find(params[:id])

    respond_to do |format|
      if @roles_user.update_attributes(params[:roles_user])
        format.html { redirect_to @roles_user, notice: 'Roles user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @roles_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles_users/1
  # DELETE /roles_users/1.json
  def destroy
    @roles_user = RolesUser.find(params[:id])
    @roles_user.destroy

    respond_to do |format|
      format.html { redirect_to roles_users_url }
      format.json { head :no_content }
    end
  end
end
