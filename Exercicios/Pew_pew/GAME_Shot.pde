public class GAME_Shot extends ObjectBase {
  
  public GAME_Shot() {
    this.position_x = player.position_x;
    this.position_y = player.position_y;
    
    float speed = 5;
    this.speed_x = speed * cos(cursor.angleCompareTo(this));
    this.speed_y = speed * sin(cursor.angleCompareTo(this));
    
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