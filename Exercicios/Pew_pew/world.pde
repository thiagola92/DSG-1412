void create_world() {
  player = new GAME_Spaceship();
  
  layers.getLayer(2).add(new GAME_Score());
}

void updateWorld() {
  generateRandom();
  
  music.pauseIfNeeded();
  deleteObjectOutOfBounds();
  playerCollision();
  
  window.throwObjectInside(player);
}

////////////////////////////////////////////////////

void generateRandom() {
  if(layers.getLayer(0).size() > 15) return;
  
  int i = (int)random(20);
  
  if(i == 0) {
    GAME_Heart enemy = new GAME_Heart();
    layers.getLayer(0).add(enemy);
  } else {
    GAME_Enemy enemy = new GAME_Enemy();
    layers.getLayer(0).add(enemy);
  }
    
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
    
    if(player.isColliding(object) == true || object.isColliding(player) == true) {
      playerCollisionReaction(object);
      
      
      layer.remove(object);
      --i;
      continue;
    }
  }
}

void playerCollisionReaction(ObjectBase object) {
  
  if(object.class_name.equals("ObjectBase")) {
    GAME_Score score = (GAME_Score)layers.getObject(2, "GAME_Score");
    ++score.damage_received;
  }
  
}