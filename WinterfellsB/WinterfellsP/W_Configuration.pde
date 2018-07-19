public class Configuration extends Window {

  public ArrayList<Button> buttons;

  public Configuration() {
    setup();
  }

  public void setup() {
    buttons = new ArrayList<Button>();

    buttons.add(new Label("Sensitivity", 0.1, 0.1, 0.25));
    buttons.add(new Button("-", 0.225, 0.1, 0.25));
    buttons.add(new Label("" + settings.sensitivity, 0.2625, 0.1, 0.25));
    buttons.add(new Button("+", 0.3, 0.1, 0.25));

    buttons.add(new Button("Back", 0.1, 0.9, 0.5));
  }

  public void draw() {
    background(0);

    //fixColumn(buttons, 0, buttons.size() - 1);    // fixColumn need to fix everytime you changed the window size
    for (Button b : buttons)
      b.draw();
  }

  public void mouseClicked() {

    if (buttons.get(1).mouseOnButton() == true) {
      settings.decreaseSensitivity();
      setup();
    } else if (buttons.get(3).mouseOnButton() == true) {
      settings.increaseSensitivity();
      setup();
    } else if (buttons.get(4).mouseOnButton() == true)
      canvas = CANVAS.MENU;
  }
}