class CandidateFormsController < ApplicationController
 
  before_filter :authenticate_user!
  # GET /candidate_forms
  # GET /candidate_forms.json
#  def index
#    @candidate_forms = CandidateForm.all
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render json: @candidate_forms }
#    end
#  end

  # GET /candidate_forms/1
  # GET /candidate_forms/1.json
  def show
    
    @candidate_form = current_user.candidate_form

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @candidate_form }
    end
  end

  # GET /candidate_forms/new
  # GET /candidate_forms/new.json
  def new
    @user = current_user
    @candidate_form = CandidateForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @candidate_form }
    end
  end

  # GET /candidate_forms/1/edit
  def edit
    @user = current_user
    @candidate_form = current_user.candidate_form
    @lang = []
    @lang = @candidate_form.languages_known.split(',')
    
    @experience_in_sp = []
    @experience_in_sp = @candidate_form.experience_in_sp.split(',')
    
#    h = {}
#    @candidate_form.languages_known.split(',').each do |substr|
#      h[substr] = "1"
#    end
#    @candidate_form.languages_known = h
    #raise @candidate_form.languages_known.inspect
  end

  # POST /candidate_forms
  # POST /candidate_forms.json
  def create
    
    params[:candidate_form][:languages_known], params[:candidate_form][:other_language] =  language_string(params[:candidate_form][:languages_known],params[:candidate_form][:other_language])
    params[:candidate_form][:experience_in_sp], params[:candidate_form][:other_experience_in_sp] = language_string(params[:candidate_form][:experience_in_sp],params[:candidate_form][:other_experience_in_sp])
    params[:candidate_form][:user_id] = current_user.id
    params[:candidate_form][:other_nationality] = nationality(params[:candidate_form][:nationality],params[:candidate_form][:other_nationality])
    params[:candidate_form][:other_visa_status] = nationality(params[:candidate_form][:visa_status],params[:candidate_form][:other_visa_status])
    
    @candidate_form = CandidateForm.new(params[:candidate_form])

    respond_to do |format|
      if @candidate_form.save
        format.html { redirect_to user_candidate_form_path(current_user), notice: 'Candidate form was successfully created.' }
        format.json { render json: @candidate_form, status: :created, location: @candidate_form }
      else
        format.html { render action: "new" }
        format.json { render json: @candidate_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /candidate_forms/1
  # PUT /candidate_forms/1.json
  def update
    
    @candidate_form = current_user.candidate_form
    #raise @candidate_form.inspect
    params[:candidate_form][:languages_known], params[:candidate_form][:other_language] =  language_string(params[:candidate_form][:languages_known],params[:candidate_form][:other_language])
    params[:candidate_form][:experience_in_sp], params[:candidate_form][:other_experience_in_sp] = language_string(params[:candidate_form][:experience_in_sp],params[:candidate_form][:other_experience_in_sp])
    params[:candidate_form][:user_id] = current_user.id
    params[:candidate_form][:other_nationality] = nationality(params[:candidate_form][:nationality],params[:candidate_form][:other_nationality])
    params[:candidate_form][:other_visa_status] = nationality(params[:candidate_form][:visa_status],params[:candidate_form][:other_visa_status])
    
    @lang = []
    @lang = @candidate_form.languages_known.split(',')
    
    @experience_in_sp = []
    @experience_in_sp = @candidate_form.experience_in_sp.split(',')
    
    respond_to do |format|
      if @candidate_form.update_attributes(params[:candidate_form])
        format.html { redirect_to user_candidate_form_path(current_user), notice: 'Candidate form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @candidate_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidate_forms/1
  # DELETE /candidate_forms/1.json
#  def destroy
#    @candidate_form = CandidateForm.find(params[:id])
#    @candidate_form.destroy
#
#    respond_to do |format|
#      format.html { redirect_to candidate_forms_url }
#      format.json { head :no_content }
#    end
#  end
  
  
  def form_exist
    
    if current_user.candidate_form != nil
      @candidate_form = current_user.candidate_form
     render :action => "show"
    else
      redirect_to :controller => :candidate_forms, :action => :new, :user_id => current_user.id
    end
  end
  
  
  private
  def language_string(languages,other_lang)
    lang = ""
    f=0
    languages.each do |key, value|
      if value == "1" 
        lang = lang + key + "," 
        if key == "Other" 
        f=1
      end
      end
      
    end
    if f==0
      other_lang = ""
    end
    return lang ,other_lang
  end
  
  
  def nationality(nationality,other_nationality)
    unless nationality == "Other"
      other_nationality = ""
    end
    return other_nationality
  end
  
  
end