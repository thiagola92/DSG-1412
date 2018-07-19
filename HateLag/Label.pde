class Label {

  PVector position;
  String text;

  Label(String text, PVector position) {
    this.text = text;
    this.position = position;
  }
  
  void draw() {
    fill(127);
    textSize(30);
    text(text, position.x, position.y);
  }
}