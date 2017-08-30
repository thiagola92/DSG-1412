void create_world() {
  player();
}

void checkWorld() {
  createRainBalls();
  
  detectCollision();
  
  deleteOutOfBounds();
}

////////////////////////////////////////////////////

void player() {
  ObjectBase pew_pew = new ObjectBase();
  pew_pew.collision.radius = 10;
  pew_pew.image = new ObjectImage() {
    
    public void draw(ObjectBase object) {
      fill(100,100,100);
      ellipse(object.position_x, object.position_y, 20, 20);
    }
    
  };
  
  pew_pew.position_x = 400;
  pew_pew.position_y = 400;
  
  player = pew_pew;
}

void createRainBalls() {
  ObjectBase ball = new ObjectBase();
  
  ball.position_x = (int) random(window.width);
  ball.speed_y = (int) random(2) + 1;
  
  object_list.add(ball);
}

void detectCollision() {
  for(int i = 0; i < object_list.size(); ++i) {
    ObjectBase object = object_list.get(i);
    
    if(object.isColliding(player) == true) {
      object.image = new ObjectImage() {
    
        public void draw(ObjectBase object) {
          fill(255,0,0);
          ellipse(object.position_x, object.position_y, 20, 20);
        }
    
      };
    } else {
      object.image = new ObjectImage();
    }
  }
}

void deleteOutOfBounds() {
  for(int i = 0; i < object_list.size();) {
    ObjectBase object = object_list.get(i);
    
    if(window.isOutOfBound(object) == true) {
      object_list.remove(object);
      continue;
    }
    
    ++i;
  }
}