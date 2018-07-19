public class Menu extends Window {

  public ArrayList<Button> buttons = new ArrayList<Button>();

  public Menu() {

    buttons.add(new Button("PLAY", 0.5, 0.1, 0.5));
    buttons.add(new Button("CONFIGURATION", 0.5, 0.2, 0.5));
    buttons.add(new Button("ABOUT", 0.5, 0.3, 0.5));
  }

  public void draw() {
    background(0);

    alignButtonsVertically(buttons, 0, buttons.size());
    for (Button b : buttons)
      b.draw();
  }

  public void mouseClicked() {

    if (buttons.get(0).mouseOnButton() == true)
      canvas = CANVAS.LOADING;
    else if (buttons.get(1).mouseOnButton() == true)
      canvas = CANVAS.CONFIGURATION;
    else if (buttons.get(2).mouseOnButton() == true)
      canvas = CANVAS.ABOUT;
  }
}