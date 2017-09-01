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
  if(objects.getLayer(0).size() > 300) return;
  
  ObjectBase ball = new ObjectBase();
  
  ball.position_x = (int) random(width);
  ball.speed_y = (int) random(2) + 1;
  
  objects.addObject(0, ball);
}

void detectCollision() {
  /*
  for(int i = 0; i < objects.getLayer(0).size(); ++i) {
    ObjectBase object = objects.getObject(0, i);
    
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
  */
  
  for(ArrayList<ObjectBase> layer1: objects.layer_list) {
    for(ArrayList<ObjectBase> layer2: objects.layer_list) {
      if(layer1 == layer2) break;
      
      for(int i = 0; i < layer1.size(); ++i) {
        ObjectBase object1 = layer1.get(i);
        
        for(int j = 0; j < layer2.size(); ) {
          ObjectBase object2 = layer2.get(j);
          
          if(object1.isColliding(object2) == true) {
            layer2.remove(object2);
            layer1.remove(object1);
            
            if(i < layer1.size()) object1 = layer1.get(i);
            
            continue;
          }
          
          ++j;
        }
        
      }
      
    }
  }
}

void deleteObjectOutOfBounds() {
  
  for(ArrayList<ObjectBase> layer: objects.layer_list) {
    for(int i = 0; i < layer.size();) {
      ObjectBase object = layer.get(i);
      
      if(window.isObjectOutside(object) == true) {
        layer.remove(object);
        continue;
      }
      
      ++i;
    }
  }
}