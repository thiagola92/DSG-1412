public class GAME_Spaceship extends ObjectBase {
  
  public int time_from_last_shot = 0;
  public int type_shot = 3;
  
  public GAME_Spaceship() {
    super.class_name = "GAME_Spaceship";
    
    this.physic.position_x = width/2;
    this.physic.position_y = height/2;
    
    this.collision.radius = 20;
    
    this.image = new ObjectImage() {
      
      public void draw(ObjectBase object) {
        
        translate(physic.position_x, physic.position_y);
        float angle = cursor.angleCompareTo(player);
        rotate(angle + PI/2);
        
        ///////////////////////////////////////////
        
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
      if(type_shot == 0)
        normal_shot();
      else if(type_shot == 1)
        shotgun_shot();
      else if(type_shot == 2)
        random_shot();
      else if(type_shot == 3)
        circle_shot();
  }
  
  public void normal_shot() {
      int time_now = millis();
      int interval = abs(time_now - time_from_last_shot);
      
      if(interval > 150) {
        layers.getLayer(1).add(new GAME_Shot());
        time_from_last_shot = time_now;
      }
  }
  
  public void shotgun_shot() {
      int time_now = millis();
      int interval = abs(time_now - time_from_last_shot);
      
      if(interval > 450) {
        GAME_Shot shot;
        
        shot = new GAME_Shot();
        shot.physic.speed_x = shot.speed * cos(cursor.angleCompareTo(this));
        shot.physic.speed_y = shot.speed * sin(cursor.angleCompareTo(this));
        layers.getLayer(1).add(shot);
        
        shot = new GAME_Shot();
        shot.angle += PI/6;
        shot.physic.speed_x = shot.speed * cos(cursor.angleCompareTo(this) + PI/6);
        shot.physic.speed_y = shot.speed * sin(cursor.angleCompareTo(this) + PI/6);
        layers.getLayer(1).add(shot);
        
        shot = new GAME_Shot();
        shot.angle -= PI/6;
        shot.physic.speed_x = shot.speed * cos(cursor.angleCompareTo(this) - PI/6);
        shot.physic.speed_y = shot.speed * sin(cursor.angleCompareTo(this) - PI/6);
        layers.getLayer(1).add(shot);
        
        time_from_last_shot = time_now;
      }
  }
  
  public void random_shot() {
      int time_now = millis();
      int interval = abs(time_now - time_from_last_shot);
      
      if(interval > 50) {
        GAME_Shot shot;
        
        int rand = (int)random(360);
        
        shot = new GAME_Shot();
        shot.angle += PI/180*rand;
        shot.physic.speed_x = shot.speed * cos(cursor.angleCompareTo(this) + PI/180*rand);
        shot.physic.speed_y = shot.speed * sin(cursor.angleCompareTo(this) + PI/180*rand);
        layers.getLayer(1).add(shot);
        
        time_from_last_shot = time_now;
      }
  }
  
  public void circle_shot() {
      int time_now = millis();
      int interval = abs(time_now - time_from_last_shot);
      
      if(interval > 1250) {
        GAME_Shot shot;
        
        for(int i=0; i < 360; i=i+10) {
          shot = new GAME_Shot();
          shot.angle += PI/180*i;
          shot.physic.speed_x = shot.speed * cos(cursor.angleCompareTo(this) + PI/180*i);
          shot.physic.speed_y = shot.speed * sin(cursor.angleCompareTo(this) + PI/180*i);
          layers.getLayer(1).add(shot);
        }
        
        time_from_last_shot = time_now;
      }
  }
  
}