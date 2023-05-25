# frozen_string_literal: true
require_relative '../../../lab_model/lab'
require 'win32api'

class AddLabController
  def initialize(student_lab)
    @student_lab = student_lab
  end

  def add_view(view)
    @view = view
    @view.set_lab
  end
  def execute
    @view.execute
  end
  def save_lab(lab)
    @student_lab.add_lab(lab)
  end

  def next_number_lab
    @student_lab.get_next_number
  end

  def validate_fields(fields)
    begin
      lab = Lab.new(**fields)
      return lab

    rescue ArgumentError => e
      return nil
    end
  end

  def validate_date_range(new_date, lab_id)
    idx_last_date = lab_id.to_i-1
    if idx_last_date>=0
      old_date = @student_lab.get_lab_by_number(idx_last_date).date_load
      return Lab.validate_date_range?(new_date, old_date)
    else
      true
    end
  end

  def error_validate()
    api = Win32API.new('user32', 'MessageBox', ['L', 'P', 'P', 'L'], 'I')
    api.call(0, "Incorrect date!!", "Error", 0)
  end

end
