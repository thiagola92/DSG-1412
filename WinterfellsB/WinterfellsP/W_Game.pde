public class Game extends Window {
  
  public ArrayList<Button> buttons;

  public Game() {
    setup();
  }

  public void setup() {
    buttons = new ArrayList<Button>();
    
    buttons.add(new Button(">", 0.9, 0.5, 1));
    buttons.add(new Button("<", 0.1, 0.5, 1));
  }

  public void draw() {
    background(0);
    
    for (Button b: buttons)
      b.draw();
  }
  
  public void mouseClicked() {

    if (buttons.get(0).mouseOnButton() == true) {
    } else if (buttons.get(1).mouseOnButton() == true) {
    }
  }
}