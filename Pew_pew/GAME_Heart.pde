public class GAME_Heart extends ObjectBase {
  
  public GAME_Heart() {
  
    this.physic.position_x = (int) random(width);
    
    int speed = (int) random(4) + 2;
    
    this.physic.speed_y = speed;
    
    this.image = new ObjectImage() {
      
      public void draw(ObjectBase object) {
        GAME_Heart enemy = (GAME_Heart)object;
        
        translate(object.physic.position_x, object.physic.position_y);
        image(loadImage("heart.png"), -49/2, -41/2, 49, 41);
      }
      
    };
    
  }
  
  public void destroy() {
    music.time_from_last_play = millis();
    audio.play();
    
    GAME_Spaceship p = (GAME_Spaceship)player;
    p.type_shot = (int)random(4);
  }
  
}