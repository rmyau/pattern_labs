# frozen_string_literal: true
require 'fox16'
include Fox
class Window<FXMainWindow
  def initialize(app)
    super(app, "Students" , :width => 500, :height => 300)

    tab_book = FXTabBook.new(self, nil, 0, LAYOUT_FILL_X||LAYOUT_FILL_Y)
    # Создаем первую вкладку
    @tab1 = FXTabItem.new(tab_book, "Вкладка 1", nil)
    @composite1 = FXComposite.new(tab_book, LAYOUT_FILL_X||LAYOUT_FILL_Y)
    first_tab

    # Создаем вторую вкладку
    tab2 = FXTabItem.new(tab_book, "Вкладка 2", nil)
    @composite2 = FXComposite.new(tab_book, LAYOUT_FILL_X|LAYOUT_FILL_Y)

    tab3 = FXTabItem.new(tab_book, "Вкладка 3", nil)
    @composite3 = FXComposite.new(tab_book, LAYOUT_FILL_X|LAYOUT_FILL_Y)

  end
  def create
    super
    @composite1.create
    show(PLACEMENT_SCREEN)
  end

  private
  def first_tab
    add_filters

  end

  def add_filters
    #filter
    @frame_filter = FXVerticalFrame.new(@composite1)
    @frame_filter.resize(500,300)

    field_filter =[[:git, 'Гит'], [:email, 'Почта'], [:phone, 'Телефон'], [:telegram, 'Телеграм']]
    #ФИЛЬТР ИМЕНИ
    nameLabel = FXLabel.new(@frame_filter, "Фамилия и инициалы")
    nameTextField = FXTextField.new(@frame_filter, 40)
    @filter = {short_name: nameTextField}

    #фильтрация для остальных полей
    field_filter.each do |field|
      @filter[field[0]] = create_radio_group(field, frame_filter)
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


