public class GAME_Enemy extends ObjectBase {
  
  public float angle;
  
  public GAME_Enemy() {
  
    this.physic.position_x = (int) random(width);
    
    int speed = (int) random(3) + 2;
    
    float y = player.physic.position_y - this.physic.position_y;
    float x = player.physic.position_x - this.physic.position_x;
    angle = atan2(y, x);
    
    this.physic.speed_y = speed * sin(angle);
    this.physic.speed_x = speed * cos(angle);
    
    this.image = new ObjectImage() {
      
      public void draw(ObjectBase object) {
        GAME_Enemy enemy = (GAME_Enemy)object;
        
        translate(object.physic.position_x, object.physic.position_y);
        rotate(enemy.angle);
        image(loadImage("images/shot.png"), -45/2, -20/2, 45, 20);
      }
      
    };
    
  }
  
  public void destroy() {
  }
  
}