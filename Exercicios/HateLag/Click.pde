class Click {
  
  PVector position;
  int time;
  
  Click() {
    position = new PVector(mouseX, mouseY);
    time = millis();
  }
  
}