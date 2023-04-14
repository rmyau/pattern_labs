# frozen_string_literal: true
require 'fox16'
include Fox
class Window<FXMainWindow
  def initialize(app)
    super(app, "Students" , :width => 500, :height => 300)

    tab_book = FXTabBook.new(self, nil, 0, LAYOUT_FILL_X||LAYOUT_FILL_Y)
    # Создаем первую вкладку
    tab1 = FXTabItem.new(tab_book, "Вкладка 1", nil)
    composite1 = FXComposite.new(tab_book, LAYOUT_FILL_X||LAYOUT_FILL_Y)
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
    show(PLACEMENT_SCREEN)
  end

  private
  def first_tab
    add_filters
    add_table

  end

  def add_filters
    #filter
    @frame_filter = FXVerticalFrame.new(@first_tab)
    @frame_filter.resize(500,300)

    field_filter =[[:git, 'Гит'], [:email, 'Почта'], [:phone, 'Телефон'], [:telegram, 'Телеграм']]
    #ФИЛЬТР ИМЕНИ
    nameLabel = FXLabel.new(@frame_filter, "Фамилия и инициалы")
    nameTextField = FXTextField.new(@frame_filter, 40)
    @filter = {short_name: nameTextField}

    #фильтрация для остальных полей
    field_filter.each do |field|
      @filter[field[0]] = create_radio_group(field, @frame_filter)
    end
  end

  def add_table

    # Создаем таблицу
    table = FXTable.new(@first_tab, :opts =>  TABLE_READONLY|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT, :width=>580, :height=>220)
    table.setTableSize(10, 3)

    table.setColumnText(0, "ФИО")
    table.setColumnText(1, "Git")
    table.setColumnText(2, "Контакт")

    (1..10).each { |num| table.setRowText(num-1, num.to_s) }

    table.setColumnText(0, "Имя")
    table.setColumnText(1, "Твиттер")
    table.setColumnText(2, "Email")

    # Заполняем таблицу данными
    table.setItemText(0, 0, "John")
    table.setItemText(0, 1, "@jo")
    table.setItemText(0, 2, "john@example.com")

    table.setItemText(1, 0, "Jane")
    table.setItemText(1, 1, "@frfff")
    table.setItemText(1, 2, "jane@example.com")

    table.setItemText(2, 0, "Bob")
    table.setItemText(2, 1, "@bob")
    table.setItemText(2, 2, "bob@example.com")

    table.setItemText(3, 0, "Alice")
    table.setItemText(3, 1, "@alice")
    table.setItemText(3, 2, "alice@example.com")

    table.setItemText(4, 0, "Mike")
    table.setItemText(4, 1, "@mike")
    table.setItemText(4, 2, "mike@example.com")

    table.setItemText(5, 0, "Sara")
    table.setItemText(5, 1, "@sara")
    table.setItemText(5, 2, "sara@example.com")

    table.setItemText(6, 0, "Tom")
    table.setItemText(6, 1, "@tom")
    table.setItemText(6, 2, "tom@example.com")

    table.setItemText(7, 0, "Emily")
    table.setItemText(7, 1, "@emily")
    table.setItemText(7, 2, "emily@example.com")

    table.setItemText(8, 0, "Max")
    table.setItemText(8, 1, "@max")
    table.setItemText(8, 2, "max@example.com")

    table.setItemText(9, 0, "Lucy")
    table.setItemText(9, 1, "@lucy")
    table.setItemText(9, 2, "lucy@example.com")

    # Масштабируем таблицу
    table.setRowHeaderWidth(50)
    table.setColumnWidth(0, 150)
    table.setColumnWidth(1, 150)
    table.setColumnWidth(2, 200)

    table.getColumnHeader.connect(SEL_COMMAND) do |a, b,col|
      sort_table_by_column(table,0)
    end
  end

  #сортировка таблицы по столбцу
  def sort_table_by_column(table, column_index)

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

app = FXApp.new
Window.new(app)
app.create
app.run


