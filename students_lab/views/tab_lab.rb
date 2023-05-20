# frozen_string_literal: true
require 'fox16'
include Fox
require_relative '../controller/student_lab_controller'
require_relative 'tab_student'
class TabLab<FXVerticalFrame
  def initialize(parent, *args, &blk)
    super
    @controller = StudentLabController.new(self)
    add_table
  end

  def add_table
    table_frame = FXVerticalFrame.new(self, :padLeft=>20)
    # page_change_buttons(table_frame)
    # Создаем таблицу
    @table = FXTable.new(table_frame, :opts =>  TABLE_READONLY|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT|TABLE_COL_SIZABLE|TABLE_ROW_RENUMBER, :width=>600, :height=>350)
    @table.setTableSize(16, 3)

    @table.setColumnText(0, "Номер")
    @table.setColumnText(1, "Наименование")
    @table.setColumnText(2, "Дата выдачи")

    # Масштабируем таблицу
    @table.setRowHeaderWidth(30)
    # @table.setColumnWidth(0, 150)
    @table.setColumnWidth(1, 300)
    @table.setColumnWidth(2, 150)

    add_crud(self)
  end

  def add_crud(parent)
    #добавление кнопок
    btn_list = FXHorizontalFrame.new(parent)
    btn_add = FXButton.new(btn_list, "Добавить", :opts=>BUTTON_NORMAL)
    btn_update = FXButton.new(btn_list, "Обновить", :opts=>BUTTON_NORMAL)
    btn_change = FXButton.new(btn_list, "Изменить", :opts=>BUTTON_NORMAL)
    btn_delete = FXButton.new(btn_list, "Удалить", :opts=>BUTTON_NORMAL)

    btn_change.disable
    btn_delete.disable

    # Устанавливаем обработчик события SEL_CHANGED для таблицы
    @table.connect(SEL_CHANGED) do
      num_selected_rows = 0
      (0...@table.getNumRows()).each { |row_index| num_selected_rows+=1 if @table.rowSelected?(row_index)}

      # Если выделена только одна строка, кнопка должна быть неактивной
      if num_selected_rows == 1
        btn_change.enable
        btn_delete.enable
        # Если выделено несколько строк, кнопка должна быть активной
      elsif num_selected_rows >1
        btn_change.disable
        btn_delete.enable
      end
    end

    @table.getRowHeader.connect(SEL_RIGHTBUTTONPRESS) do
      @table.killSelection(true)
      btn_change.disable
      btn_delete.disable
    end


    btn_update.connect(SEL_COMMAND) do
      refresh
    end
    btn_add.connect(SEL_COMMAND) do
      @controller.add_lab
    end

  end

  def refresh
    @controller.refresh_data
  end

  def on_datalist_changed(table)
    TabStudent.update_data_table(@table, table)
  end

end
