public class About extends Window {

  ArrayList<Button> buttons = new ArrayList<Button>();

  public String creditsText = "Credits:\n" +
    "----Game design----\n" +
    "ThiagoLA92\n" +
    "----Programmer----\n" +
    "ThiagoLA92\n" +
    "----Music----\n" +
    "?\n" +
    "---Software----\n" +
    "processing.org\n" +
    "boscaceoil.net\n";

  public About() {
    buttons.add(new Button("Back", 0.1, 0.9, 0.5));

    Label l = new Label(creditsText, 0.5, 0.05, 1);
    l.maxCharacters = 50;
    buttons.add(l);
  }

  public void draw() {
    background(0);

    for (Button l : buttons) {
      l.draw();
    }
  }

  public void mouseClicked() {

    if (buttons.get(0).mouseOnButton() == true)
      canvas = CANVAS.MENU;
  }
}