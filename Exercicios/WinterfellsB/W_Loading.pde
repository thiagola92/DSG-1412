public class Loading extends Window {

  ArrayList<Button> buttons = new ArrayList<Button>();

  public Loading() {
    setup();
  }

  public void setup() {
    buttons.add(new Label("Players " + connection.playersIP.size() + "/" + settings.players, 0.5, 0.5, 0.25));
    buttons.add(new Button("Press esc to cancel ", 0.5, 0.5, 0.2));
  }

  public void draw() {
    background(0);

    alignButtonsVertically(buttons, 0, buttons.size());
    for (Button b : buttons)
      b.draw();

    connection.searchConnections();
  }

  public void mouseClicked() {
    if (buttons.get(1).mouseOnButton() == true) {
      canvas = CANVAS.MENU;
    }
  }
}