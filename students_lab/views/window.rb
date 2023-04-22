# frozen_string_literal: true
require 'fox16'
include Fox
require_relative '../controller/student_list_controller'
class Window<FXMainWindow
  def initialize(app)

    super(app, "Students" , :width => 1050, :height => 430)

    @students_on_page=15
    @current_page=1
    @count_student=0
    @controller = StudentListController.new(self)
    create_tabs
  end
  def create_tabs
    tab_book = FXTabBook.new(self, :opts=>LAYOUT_FILL_X|LAYOUT_FILL_Y)
    # Создаем первую вкладку
    tab1 = FXTabItem.new(tab_book, "Вкладка 1", nil)
    composite1 = FXComposite.new(tab_book, LAYOUT_FILL_X|LAYOUT_FILL_Y)
    @first_tab = FXHorizontalFrame.new(composite1)
    @first_tab.resize(1000,1000)
    first_tab

    # Создаем вторую вкладку
    tab2 = FXTabItem.new(tab_book, "Вкладка 2", nil)
    @composite2 = FXComposite.new(tab_book, LAYOUT_FILL_X|LAYOUT_FILL_Y)

    tab3 = FXTabItem.new(tab_book, "Вкладка 3", nil)
    @composite3 = FXComposite.new(tab_book, LAYOUT_FILL_X|LAYOUT_FILL_Y)
  end
  def create
    super
    @controller.refresh_data(@current_page, @students_on_page)
    @controller.show_view
  end

  def update_count_students(count_students)
    @count_student = count_students
    @page_label.text = "#{@current_page} / #{(@count_student / @students_on_page.to_f).ceil}"
    #изменить отображение страниц
  end

  def on_datalist_changed(table)
    #сделать копию при добавлении и тд
    row_number=0
    table.each do |row|
      (1..3).each { |index_field| @table.setItemText(row_number, index_field-1, row[index_field].to_s)  }
      row_number+=1
    end
  end
  private
  def first_tab
    add_filters
    add_table
  end

  def add_filters
    #filter
    frame_filter = FXVerticalFrame.new(@first_tab, :padTop=>50)
    frame_filter.resize(500,300)

    field_filter =[[:git, 'Гит'], [:email, 'Почта'], [:phone, 'Телефон'], [:telegram, 'Телеграм']]

    #ФИЛЬТР ИМЕНИ
    nameLabel = FXLabel.new(frame_filter, "Фамилия и инициалы")
    nameTextField = FXTextField.new(frame_filter, 40)
    @filter = {short_name: nameTextField}

    #фильтрация для остальных полей
    field_filter.each do |field|
      @filter[field[0]] = create_radio_group(field, frame_filter)
    end

    #кнопка очистить
    btn_clear = FXButton.new(frame_filter, "Очистить", :opts=>BUTTON_NORMAL)
  end

  def add_table
    table_frame = FXVerticalFrame.new(@first_tab, :padLeft=>20)
    page_change_buttons(table_frame)
    # Создаем таблицу
    @table = FXTable.new(table_frame, :opts =>  TABLE_READONLY|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT|TABLE_COL_SIZABLE|TABLE_ROW_RENUMBER, :width=>580, :height=>320)
    @table.setTableSize(15, 3)

    @table.setColumnText(0, "ФИО")
    @table.setColumnText(1, "Git")
    @table.setColumnText(2, "Контакт")

    # Масштабируем таблицу
    @table.setRowHeaderWidth(30)
    @table.setColumnWidth(0, 150)
    @table.setColumnWidth(1, 150)
    @table.setColumnWidth(2, 200)

    @table.getColumnHeader.connect(SEL_COMMAND) do |a, b,col|
      sort_table_by_column(@table,col)
    end

    add_crud(table_frame)
  end

  #добавление кнопок добавить, изменить, обновить, удалить
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
  end

  #отображение страниц
  def page_change_buttons(parent)
    change_page = FXHorizontalFrame.new(parent, :opts=> LAYOUT_CENTER_X)
    btn_back=FXButton.new(change_page, "Назад", :opts=> BUTTON_INITIAL)
    btn_back.textColor = Fox.FXRGB(0,23,175)
    #добавить отображение со страницы, на которой мы сейчас
    @page_label = FXLabel.new(change_page, '1')
    btn_next=FXButton.new(change_page, "Далее", :opts=> BUTTON_INITIAL)
    btn_next.textColor = Fox.FXRGB(0,23,175)
  end

  #сортировка таблицы по столбцу
  def sort_table_by_column(table, column_index)
    #ере
    table_data = (0...table.getNumRows()).map { |row_index| (0...table.getNumColumns()).map { |col_index| table.getItemText(row_index, col_index) } }

    sorted_table_data = table_data.sort_by { |row_data| row_data[column_index] }

    sorted_table_data.each_with_index do |row_data, row_index|
      row_data.each_with_index do |cell_data, col_index|
        table.setItemText(row_index, col_index, cell_data)
      end
    end
  end

  def create_radio_group(field, parent)
    #Фильтрация гита

    frame_field = FXVerticalFrame.new(parent, LAYOUT_FILL_X||LAYOUT_SIDE_TOP)
    label_field = FXLabel.new(frame_field, field[1])

    line_radio = FXHorizontalFrame.new(frame_field, LAYOUT_FILL_X|LAYOUT_SIDE_TOP)
    # Создаем radiobutton
    radio_yes = FXRadioButton.new(line_radio, "Да")
    radio_no = FXRadioButton.new(line_radio, "Нет")
    radio_no_matter = FXRadioButton.new(line_radio, "Не важно")
    #фильтр
    text_field = FXTextField.new(line_radio, 40)

    #прописываем доступность
    text_field.setEnabled(false)
    radio_yes.connect(SEL_COMMAND) do
      radio_no.check=false
      radio_no_matter.check=false

      if radio_yes.checked?
        text_field.setEnabled(true)
      end
    end
    radio_no.connect(SEL_COMMAND) do
      radio_no_matter.check=false
      radio_yes.check=false
      if radio_no.checked?
        text_field.setEnabled(false)
      end
    end
    radio_no_matter.connect(SEL_COMMAND) do
      radio_no.check=false
      radio_yes.check=false
      if radio_no_matter.checked?
        text_field.setEnabled(false)
      end
    end
    frame_field
  end

end



