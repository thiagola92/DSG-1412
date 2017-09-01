public class ObjectImage {
  
  public void preDraw(ObjectBase object) {
    int fillColor = g.fillColor;
    int strokeColor = g.strokeColor;
    pushMatrix();
    
    draw(object);
    
    popMatrix();
    fill(red(fillColor), green(fillColor), blue(fillColor));
    stroke(red(strokeColor), green(strokeColor), blue(strokeColor));
  }
  
  public void draw(ObjectBase object) {
    fill(0,0,255);
    ellipse(object.position_x, object.position_y, 20, 20);
  }
  
}