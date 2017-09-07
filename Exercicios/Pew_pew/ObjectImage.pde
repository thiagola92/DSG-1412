public class ObjectImage {
  public int fillColor = g.fillColor;
  public int strokeColor = g.strokeColor;
  public float strokeWeight = g.strokeWeight;
  public PFont textFont = g.textFont;
  public float textSize = g.textSize;
  
  public void preDraw() {
    fillColor = g.fillColor;
    strokeColor = g.strokeColor;
    strokeWeight = g.strokeWeight;
    textFont = g.textFont;
    textSize = g.textSize;
    noStroke();
    pushMatrix();
  }
  
  public void afterDraw() {
    popMatrix();
    fill(red(fillColor), green(fillColor), blue(fillColor));
    stroke(red(strokeColor), green(strokeColor), blue(strokeColor));
    strokeWeight(strokeWeight);
    if(textFont != null) textFont(textFont);
    textSize(textSize);
  }
  
  public void drawCollision(ObjectBase object) {
    object.image.preDraw();
    
    fill(0, 0, 0, 0);
    stroke(0, 255, 0);
    ellipse(object.physic.position_x, object.physic.position_y, object.collision.radius, object.collision.radius);
    noStroke();
    
    object.image.afterDraw();
  }
  
  public void draw(ObjectBase object) {
    fill(0,0,255);
    ellipse(object.physic.position_x, object.physic.position_y, 20, 20);
  }
  
}