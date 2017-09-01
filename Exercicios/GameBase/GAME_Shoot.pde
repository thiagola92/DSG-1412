public class GAME_Shoot extends ObjectBase {
  
  public GAME_Shoot() {
    this.position_x = player.position_x;
    this.position_y = player.position_y;
    
    this.speed_y = -3;
    
    this.collision.radius = 10;
    
    this.image = new ObjectImage() {
      
      public void draw(ObjectBase object) {
        translate(position_x, position_y);
        
        //float angle = cursor.angleCompareTo(player);
        //rotate(angle);
        
        ////////////
        
        fill(255, 0, 0);
        ellipse(0, 0, 10, 20);
      }
      
    };
    
  }
  
}