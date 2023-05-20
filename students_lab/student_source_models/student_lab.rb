# frozen_string_literal: true
require_relative '../lab_model/lab'
require_relative 'data_list_model/data_list_student_lab'
class StudentLab
  def initialize
    self.db = DB.instance
  end

  def get_lab_by_number(id_lab)
    hash = db.execute('SELECT * FROM labs WHERE number = ?', id_lab).first
    return nil if hash.nil?
    Lab.new(**hash.transform_keys(&:to_sym))
  end
  def add_lab(lab)
    db.execute('insert into labs (number, name, date_load) VALUES (?, ?, ?)', *lab_fields(lab)).first
  end
  def remove_lab(id_lab)
    db.execute('DELETE FROM labs WHERE number = ?', id_lab)
  end
  def replace_lab(id_lab, lab)
    fields = lab_fields(lab)
    db.execute('UPDATE labs SET name=?, date_load=? WHERE number=?',fields[1],fields[2], id_lab)
  end
  def get_lab_list(data_list=nil) #получение все лаб в базе
    labs_hash = db.execute('SELECT * FROM labs')
    labs = labs_hash.map{|lab| Lab.new(**lab.transform_keys(&:to_sym))}

    return DataListStudentLab.new(labs) if data_list.nil?
    data_list.replace_objects(labs)
    data_list
  end

  def get_next_number
    lab_count+1
  end

  def lab_count
    db.results_as_hash=false
    res=db.execute("Select COUNT(*) from labs").first[0]
    db.results_as_hash=true
    res
  end

  private
  attr_accessor :db
  def lab_fields(lab)
    [lab.number, lab.name, lab.date_load]
  end
end
