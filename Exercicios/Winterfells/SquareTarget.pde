public class SquareTarget extends Target {
  
  public void draw() {
    fill(colors.target);
    
    rect(position.x, position.y, 2*radius, 2*radius);
  }
  
}