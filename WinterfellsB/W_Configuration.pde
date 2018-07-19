public class Configuration extends Window {

  public ArrayList<Button> buttons;

  public Configuration() {
    setup();
  }

  public void setup() {
    buttons = new ArrayList<Button>();
    buttons.add(new Button("Players: " + settings.players, 0.10, 0.1, 0.25));
    buttons.add(new Button("Back", 0.1, 0.9, 0.5));
    
  }

  public void draw() {
    background(0);

    alignButtonsVertically(buttons, 0, buttons.size() - 1);    // fixColumn need to fix everytime you changed the window size
    for (Button b : buttons)
      b.draw();
  }

  public void mouseClicked() {

    if (buttons.get(0).mouseOnButton() == true) {
      
      if (mouseButton == LEFT)
        settings.increasePlayers();
      else if (mouseButton == RIGHT)
        settings.decreasePlayers();
      setup();
    } else if (buttons.get(1).mouseOnButton() == true)
      canvas = CANVAS.MENU;
  }
}