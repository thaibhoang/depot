module VisitStore
  private

  def set_visit_count
    if session[:visit_count].nil?
      session[:visit_count] = 1
      @visit_count = session[:visit_count]
    else
      session[:visit_count] += 1
      @visit_count = session[:visit_count]
    end
  end

  def reset_visit_count
    session[:visit_count] = 0
    @visit_count = session[:visit_count]
  end
end