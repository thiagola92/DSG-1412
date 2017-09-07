void create_world() {
  player = new GAME_Spaceship();
  
  layers.getLayer(2).add(new GAME_Score());
}

void updateWorld() {
  createRainBalls();
  
  deleteObjectOutOfBounds();
  playerCollision();
  
  window.throwObjectInside(player);
}

////////////////////////////////////////////////////

void createRainBalls() {
  if(layers.getLayer(0).size() > 150) return;
  
  ObjectBase ball = new ObjectBase();
  
  ball.physic.position_x = (int) random(width);
  ball.physic.speed_y = (int) random(2) + 1;
  
  layers.getLayer(0).add(ball);
}

void deleteObjectOutOfBounds() {
  
  for(ArrayList<ObjectBase> layer: layers.getLayers()) {
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

void playerCollision() {
  ArrayList<ObjectBase> layer = layers.getLayer(0);
  for(int i = 0; i < layer.size(); ++i) {
    ObjectBase object = layer.get(i);
    
    if(object.isColliding(player)) {
      layer.remove(object);
      
      GAME_Score score = (GAME_Score)layers.getObject(2, "GAME_Score");
      ++score.damage_received;
      
      --i;
      continue;
    }
  }
}