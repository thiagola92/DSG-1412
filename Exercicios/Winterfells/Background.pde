public class Background {
  
  int backgroundElements = 200;
  
  PVector[] element;
  
  public Background() {
    
    this.element = new PVector[backgroundElements];
    
    for(int i = 0; i < this.element.length; i++) {
      int spawnPointX = (int)random(width);
      int spawnPointY = (int)random(height);
      
      this.element[i] = new PVector(spawnPointX, -spawnPointY);
    }
    
  }
  
  public void draw() {
    fill(colors.elementBackground);
    
    for(int i = 0; i < element.length; i++) {
      ellipse(element[i].x, element[i].y, 10, 10);
    }
  }
  
  public void update() {
    
    for(int i = 0; i < element.length; i++) {
      if(element[i].y > height) {
        int spawnPointX = (int)random(width);
        int spawnPointY = (int)random(height);
        
        element[i].x = spawnPointX;
        element[i].y = -spawnPointY;
      } else {
        element[i].y += 1;
      }
    }
    
  }
  
}

void updateBackground() {
  background.update();
  background.draw();
}