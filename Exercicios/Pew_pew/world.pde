void create_world() {
  player = new GAME_Spaceship();
}

void updateWorld() {
  createRainBalls();
  
  detectCollision();
  
  deleteObjectOutOfBounds();
  
  window.throwObjectInside(player);
}

////////////////////////////////////////////////////

void createRainBalls() {
  ObjectBase ball = new ObjectBase();
  
  ball.position_x = (int) random(width);
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

void deleteObjectOutOfBounds() {
  for(int i = 0; i < object_list.size();) {
    ObjectBase object = object_list.get(i);
    
    if(window.isObjectOutside(object) == true) {
      object_list.remove(object);
      continue;
    }
    
    ++i;
  }
}