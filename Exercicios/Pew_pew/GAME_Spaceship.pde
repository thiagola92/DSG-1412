public class GAME_Spaceship extends ObjectBase {
  
  public int time_from_last_shot;
  
  public GAME_Spaceship() {
    super.class_name = "GAME_Spaceship";
    
    this.time_from_last_shot = 0;
    
    this.physic.position_x = width/2;
    this.physic.position_y = height/2;
    
    this.collision.radius = 20;
    
    this.image = new ObjectImage() {
      
      public void draw(ObjectBase object) {
        translate(physic.position_x, physic.position_y);
        
        float angle = cursor.angleCompareTo(player);
        rotate(angle + PI/2);
        
        ////////////
        
        fill(255);
        triangle(-30, 20, 0, 0, -10, 15);
        triangle(30, 20, 0, 0, 10, 15);
        
        triangle(-8, 15, 0, -20, 8, 15);
        
        fill(0, 150, 150);
        quad(-15, 15, -10, -10, -5, 15, -10, 25);
        quad(15, 15, 10, -10, 5, 15, 10, 25);
      }
      
    };
    
  }
  
  public void shoot() {
      int time_now = millis();
      int interval = abs(time_now - time_from_last_shot);
      
      if(interval > 150) {
        layers.getLayer(1).add(new GAME_Shot());
        time_from_last_shot = time_now;
      }
  }
  
}