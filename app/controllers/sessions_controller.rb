require_relative '../views/sessions_view'
class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def sign_in
    # ask_username
    username = @view.ask_username
    # ask_password
    password = @view.ask_password

    employee = @employee_repository.find_by_username(username)

    if employee && employee.password == password
      @view.correct_credentials
      return employee
    else
      @view.wrong_credentials
      sign_in
    end
  end
end
