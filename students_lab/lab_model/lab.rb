# frozen_string_literal: true
require 'date'
class Lab
  def initialize(id: nil, name: nil, date_load: nil, theme: nil, tasks: nil)
    raise ArgumentError, "Required fields: name, number and date!" if id.nil? || name.nil?|| date_load.nil?
    @id = id
    @name = name
    raise ArgumentError, 'Некорректная дата!' unless Lab.validate_date?(date_load)
    @date_load = date_load
    @theme = theme
    @tasks = tasks
  end

  attr_reader :id, :name, :date_load, :tasks, :theme

  def to_s
    res = "Lab#{id} #{name} #{date_load}"
  end


  def to_hash
    info_hash = {}
    %i[id name date_load theme tasks].each do |field|
      info_hash[field] = send(field)
    end
    info_hash
  end


  def self.validate_date?(date_in_str)
    begin
      date = Date.strptime(date_in_str, '%Y.%m.%d')
      return true
    rescue ArgumentError
      return false
    end
  end


  def self.validate_date_range?(new_date, old_date)
    new_date = Date.strptime(new_date, '%Y.%m.%d')
    old_date = Date.strptime(old_date, '%Y.%m.%d')

    if new_date > old_date
      true
    else
      false
    end
  end






end
