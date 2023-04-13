# frozen_string_literal: true
require 'fox16'
include Fox
class Window<FXMainWindow
  def initialize(app)
    super(app, "Students" , :width => 200, :height => 100)

    tab_book = FXTabBook.new(self, nil, 0, LAYOUT_FILL_X||LAYOUT_FILL_Y)
    # Создаем первую вкладку
    tab1 = FXTabItem.new(tab_book, "Вкладка 1", nil)
    composite1 = FXComposite.new(tab_book, LAYOUT_FILL_X||LAYOUT_FILL_Y)

    # Создаем вторую вкладку
    tab2 = FXTabItem.new(tab_book, "Вкладка 2", nil)
    composite2 = FXComposite.new(tab_book, LAYOUT_FILL_X|LAYOUT_FILL_Y)

    tab3 = FXTabItem.new(tab_book, "Вкладка 3", nil)
    composite3 = FXComposite.new(tab_book, LAYOUT_FILL_X|LAYOUT_FILL_Y)

  end
  def create
    super
    show(PLACEMENT_SCREEN)
  end

  private

  def add_menu_bar
    menu_bar = FXMenuBar.new(self, LAYOUT_SIDE_TOP||LAYOUT_FILL_X)
    file_menu = FXMenuPane.new(self)

    exit_cmd = FXMenuCommand.new(menu_bar, "Exit" )
    exit_cmd.connect(SEL_COMMAND) do
      exit
    end

  end


end

app = FXApp.new
Window.new(app)
app.create
app.run


# Create a tab widget
tab_book = FXTabBook.new(main_window, nil, 0, TABBOOK_NORMAL)

# Create a composite widget for the first tab
composite = FXComposite.new(tab_book, nil, 0, LAYOUT_FILL_X|LAYOUT_FILL_Y)

# Create a label widget and add it to the composite widget
label = FXLabel.new(composite, "Hello World!")