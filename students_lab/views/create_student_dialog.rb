# frozen_string_literal: true
require 'fox16'

include Fox
class CreateStudentDialog<FXDialogBox
  def initialize(parent, controller)
    # Создаем родительское модальное окно
    super(parent, "Добавление студента", DECOR_TITLE | DECOR_BORDER | DECOR_RESIZE)
    @controller = controller
    @student = nil
    # Устанавливаем размер окна и делаем его модальным
    setWidth(500)
    setHeight(300)
    add_fields
    # setModal(true)
  end

  def add_fields
    #кнопка отмены

    frame_data = FXVerticalFrame.new(self, :opts=> LAYOUT_FILL_X|LAYOUT_FILL_Y )

    field_name =[[:last_name,'Фамилия'], [:first_name, 'Имя'], [:second_name, 'Отчество'], [:git, 'Гит'], [:email, 'Почта'], [:phone, 'Телефон'], [:telegram, 'Телеграм']]
    field_text = {}
    field_name.each do |field|
      frame_field = FXHorizontalFrame.new(frame_data )
      field_label = FXLabel.new(frame_field, field[1], :opts => LAYOUT_FIX_WIDTH)
      field_label.setWidth(100)
      text = FXTextField.new(frame_field, 40, :opts=>TEXTFIELD_NORMAL)
      field_text[field[0]] = text
    end

    btn_add=FXButton.new(frame_data, "Добавить")
    btn_add.textColor = Fox.FXRGB(0,23,175)
    btn_add.disable

    btn_back=FXButton.new(frame_data, "Отмена")
    btn_back.textColor = Fox.FXRGB(0,23,175)

    btn_add.connect(SEL_COMMAND) do
      self.handle(btn_add, FXSEL(Fox::SEL_COMMAND,
                                  Fox::FXDialogBox::ID_ACCEPT), nil)
      # @controller.on_add_click(@student)
    end

    btn_back.connect(SEL_COMMAND) do
      self.handle(btn_back, FXSEL(Fox::SEL_COMMAND,
                                   Fox::FXDialogBox::ID_CANCEL), nil)
      # @controller.on_add_click(@student)
    end

    #валидация полей
    field_text.each_key do |name_field|
      field_text[name_field].connect(SEL_CHANGED) do |text_field|
        res = {}
        field_text.each do |k,v|
          text = v.text.empty? ? nil : v.text
          res[k] = text
        end

        result = @controller.validate_fields(res)
        if result.class==Student
          @student = result
          btn_add.enable
        else
          btn_add.disable
        end

      end
    end


    def execute
      super
      @student
    end
  end
end


