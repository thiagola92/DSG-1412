public class Loading extends Window {

  ArrayList<Button> buttons = new ArrayList<Button>();

  public Loading() {
    setup();
  }

  public void setup() {
    connection =  new Connection();
    
    buttons.add(new Label("Waiting for the host", 0.5, 0.5, 0.25));
    buttons.add(new Button("Click here to cancel ", 0.5, 0.5, 0.2));
  }

  public void draw() {
    background(0);

    alignButtonsVertically(buttons, 0, buttons.size());
    for (Button b : buttons)
      b.draw();

  }
  
  public void mouseClicked() {
    if (buttons.get(1).mouseOnButton() == true) {
      connection.close();
      canvas = CANVAS.MENU;
    }
  }
}