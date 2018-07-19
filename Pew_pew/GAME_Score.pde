public class GAME_Score extends ObjectBase {
  private PFont font;
  
  public int damage_done = 0;
  public int damage_received = 0;
  
  public GAME_Score() {
    super.class_name = "GAME_Score";
    
    this.font = loadFont("SegoeUI-Bold-100.vlw");
  }
  
  public void draw() {
    textFont(font);
    textSize(20);
    
    text("Damage done: " + damage_done, 0, 20);
    text("Damage received: " + damage_received, 0, 40);
  }
  
}