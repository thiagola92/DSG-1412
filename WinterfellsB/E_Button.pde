public class Button {

  public String label = "null";
  public PVector position = new PVector();
  public float size = 0;

  public color normalColor = color(127);
  public color changedColor = color(255);

  // More than this number of characters can cut the text (increase this number to reduce the text size)
  public int maxCharacters = 10; 

  public boolean showHitbox = false;

  // positionX, position, size are percentage of screen
  public Button(String label, float positionX, float positionY, float size) {
    this.label = label;
    this.position.x = positionX;
    this.position.y = positionY;
    this.size = size;
  }

  public void draw() {

    float positionX = width * position.x;
    float positionY = height * position.y;
    float textSize = discoverTextSize();
    
    mouseOverButton();

    positionX += -textWidth(label) / 2;
    positionY += textSize / 2;
    text(label, positionX, positionY);
  }

  public float discoverTextSize() {

    String labelMax = "";
    float sizeMax = width * size;
    float textSize = 1000;

    for (int i = 0; i <= maxCharacters; i++)
      labelMax += "0";

    textSize(textSize);
    while (textWidth(labelMax) >= sizeMax) {

      textSize -= 1;

      if (textSize <= 0) {
        textSize = 1;
        break;
      }

      textSize(textSize);
    }

    return textSize;
  }
  
  public void mouseOverButton() {
    if (mouseOnButton() == true)
      fill(changedColor);
    else
      fill(normalColor);
  }

  public boolean mouseOnButton() {

    float positionX = width * position.x;
    float positionY = height * position.y;
    float textSize = discoverTextSize();

    showHitbox(positionX, positionY, textSize);

    if (mouseY >= positionY - (textSize / 2) && mouseY <= positionY + (textSize / 2)) {
      if (mouseX >= positionX - (textWidth(label) / 2) && mouseX <= positionX + (textWidth(label) / 2))
        return true;
    }

    return false;
  }

  public void showHitbox(float x, float y, float size) {
    if (showHitbox == true) {
      rectMode(CENTER);
      stroke(0, 255, 0);
      fill(0, 0, 0, 255);
      rect(x, y, textWidth(label), size);
      noStroke();
    }
  }
}

/**************************************************************************************
 ***************************************************************************************
 ***************************************************************************************/

// Align vertically
public void alignButtonsVertically(ArrayList<Button> buttons, int start, int end) {
  for (; start < end; start++)
    moveEveryButtonBelowDown(buttons, start, end);
}

// I put the buttons at same position and move down until they are not hitting each other, this way if the user change the screen size, i will just discover the new position
public void moveEveryButtonBelowDown(ArrayList<Button> buttons, int start, int end) {
  Button buttonAbove = buttons.get(start);

  for (int i = start + 1; i < end; i++) {
    Button buttonBellow = buttons.get(i);
    buttonBellow.position.y = buttonAbove.position.y;
    
    moveButtonDownUntilStopHittingButtonAbove(buttonAbove, buttonBellow);
  }
}

public void moveButtonDownUntilStopHittingButtonAbove(Button buttonAbove, Button buttonBellow) {
  float buttonAbovePositionY = height * buttonAbove.position.y;
  float buttonAboveSize = buttonAbove.discoverTextSize();

  float buttonBellowPositionY = height * buttonBellow.position.y;
  float buttonBellowSize = buttonBellow.discoverTextSize();

  while (buttonAbovePositionY + (buttonAboveSize / 2) >= buttonBellowPositionY - (buttonBellowSize / 2)) {
    buttonBellow.position.y += 0.001;
    buttonBellowPositionY = height * buttonBellow.position.y;
  }
}