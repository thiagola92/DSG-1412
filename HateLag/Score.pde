class Score extends Label {
  
  int points;
  
  Score(String text, PVector position) {
    super(text, position);
    
    this.points = 0;
  }
  
  void draw() {
    text = str(points);
    
    super.draw();
  }
}