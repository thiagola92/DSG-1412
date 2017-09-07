public class ObjectImage {
  
  public void preDraw(ObjectBase object) {
    int fillColor = g.fillColor;
    
    int strokeColor = g.strokeColor;
    float strokeWeight = g.strokeWeight;
    
    PFont textFont = g.textFont;
    float textSize = g.textSize;
    
    pushMatrix();
    
    draw(object);
    
    popMatrix();
    
    fill(red(fillColor), green(fillColor), blue(fillColor));
    
    stroke(red(strokeColor), green(strokeColor), blue(strokeColor));
    strokeWeight(strokeWeight);
    
    if(textFont != null) textFont(textFont);
    textSize(textSize);
  }
  
  public void draw(ObjectBase object) {
    fill(0,0,255);
    ellipse(object.physic.position_x, object.physic.position_y, 20, 20);
  }
  
}