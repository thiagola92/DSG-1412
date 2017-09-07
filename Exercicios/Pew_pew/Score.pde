public class Score {
  private PFont font;
  
  public boolean show;
  
  public int kills;
  public int damage_received;
  
  public Score() {
    this.font = loadFont("SegoeUI-Bold-100.vlw");
    
    this.show = false;
    
    this.kills = 0;
    this.damage_received = 0;
  }
  
  public void showScore() {
    if(show == false)
      return;
    
    textFont(font);
    textSize(20);
    
    text("Kills: " + kills, 0, 20);
    text("Damage received: " + damage_received, 0, 40);
  }
  
}