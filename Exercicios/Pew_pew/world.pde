void create_world() {
  player = new GAME_Spaceship();
}

void updateWorld() {
  createRainBalls();
  
  detectCollision();
  deleteObjectOutOfBounds();
  
  score.showScore();
  window.throwObjectInside(player);
}

////////////////////////////////////////////////////

void createRainBalls() {
  if(objects.getLayer(0).size() > 150) return;
  
  ObjectBase ball = new ObjectBase();
  
  ball.position_x = (int) random(width);
  ball.speed_y = (int) random(2) + 1;
  
  objects.addObject(0, ball);
}

void detectCollision() {
  
  // FAZER UMA FUNCAO ONDE VC DIZ AS CAMADAS Q DEVEM SE COLIDIR
  for(ArrayList<ObjectBase> layer1: objects.layer_list) {
    for(ArrayList<ObjectBase> layer2: objects.layer_list) {
      if(layer1 == layer2) break;
      
      for(int i = 0; i < layer1.size(); ++i) {
        ObjectBase object1 = layer1.get(i);
        
        for(int j = 0; j < layer2.size(); ) {
          ObjectBase object2 = layer2.get(j);
          
          if(object1.isColliding(object2) == true) {
            ++score.kills;
            
            layer2.remove(object2);
            layer1.remove(object1);
            
            if(i < layer1.size())
              object1 = layer1.get(i);
            
            continue;
          }
          ++j;
        }
      }
    }
  }
  
  // FAZER UMA FUNCAO PROPRIA PARA VER SE CERTAS CAMADAS ESTÃO COLIDINDO COM O PLAYER
  ArrayList<ObjectBase> layer = objects.layer_list.get(0);
    for(int i = 0; i < layer.size(); ) {
      ObjectBase object = layer.get(i);
      
      if(object.isColliding(player) == true) {
        ++score.damage_received;
        
        if(i < layer.size())
          layer.remove(object);
        
        continue;
      }
      
      ++i;
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