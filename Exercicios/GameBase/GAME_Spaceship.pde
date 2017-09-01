public class GAME_Spaceship extends ObjectBase {
  
  public GAME_Spaceship() {
    this.position_x = width/2;
    this.position_y = height/2;
    this.collision.radius = 20;
    
    this.image = new ObjectImage() {
      
      public void draw(ObjectBase object) {
        translate(position_x, position_y);
        
        float angle = cursor.angleCompareTo(player);
        rotate(angle);
        
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
  
}