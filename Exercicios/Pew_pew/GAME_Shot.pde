public class GAME_Shot extends ObjectBase {
  
  public float angle;
  public float speed;
  
  public GAME_Shot() {
    this.physic.position_x = player.physic.position_x;
    this.physic.position_y = player.physic.position_y;
    
    speed = 5;
    this.physic.speed_x = speed * cos(cursor.angleCompareTo(this));
    this.physic.speed_y = speed * sin(cursor.angleCompareTo(this));
    
    this.collision.radius = 10;
    
    this.angle = cursor.angleCompareTo(player);
    
    this.image = new ObjectImage() {
      
      public void draw(ObjectBase object) {
        GAME_Shot shot = (GAME_Shot)object;
        
        translate(physic.position_x, physic.position_y);
        rotate(shot.angle + PI/2);
        
        ////////////
        
        fill(255, 0, 0);
        ellipse(0, 0, 10, 20);
      }
      
    };
    
  }
  
}