require 'test_helper'

class CandidateFormsControllerTest < ActionController::TestCase
  setup do
    @candidate_form = candidate_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candidate_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candidate_form" do
    assert_difference('CandidateForm.count') do
      post :create, candidate_form: { birth_date: @candidate_form.birth_date, contact: @candidate_form.contact, email: @candidate_form.email, emirate_id: @candidate_form.emirate_id, experience_in_sp: @candidate_form.experience_in_sp, experience_in_uae: @candidate_form.experience_in_uae, gender: @candidate_form.gender, have_car: @candidate_form.have_car, job_type: @candidate_form.job_type, languages_known: @candidate_form.languages_known, living_in_emirates: @candidate_form.living_in_emirates, name: @candidate_form.name, nationality: @candidate_form.nationality, uae_dl: @candidate_form.uae_dl, visa_status: @candidate_form.visa_status, visa_valid_till: @candidate_form.visa_valid_till }
    end

    assert_redirected_to candidate_form_path(assigns(:candidate_form))
  end

  test "should show candidate_form" do
    get :show, id: @candidate_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @candidate_form
    assert_response :success
  end

  test "should update candidate_form" do
    put :update, id: @candidate_form, candidate_form: { birth_date: @candidate_form.birth_date, contact: @candidate_form.contact, email: @candidate_form.email, emirate_id: @candidate_form.emirate_id, experience_in_sp: @candidate_form.experience_in_sp, experience_in_uae: @candidate_form.experience_in_uae, gender: @candidate_form.gender, have_car: @candidate_form.have_car, job_type: @candidate_form.job_type, languages_known: @candidate_form.languages_known, living_in_emirates: @candidate_form.living_in_emirates, name: @candidate_form.name, nationality: @candidate_form.nationality, uae_dl: @candidate_form.uae_dl, visa_status: @candidate_form.visa_status, visa_valid_till: @candidate_form.visa_valid_till }
    assert_redirected_to candidate_form_path(assigns(:candidate_form))
  end

  test "should destroy candidate_form" do
    assert_difference('CandidateForm.count', -1) do
      delete :destroy, id: @candidate_form
    end

    assert_redirected_to candidate_forms_path
  end
end
