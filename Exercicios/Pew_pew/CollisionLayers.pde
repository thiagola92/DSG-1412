public class CollisionLayers {
  
  HashMap<Integer, ArrayList<Integer>> collision_list = new HashMap<Integer, ArrayList<Integer>>();
  
  public void addCollisionBetween(Integer layer1, Integer layer2) {
    ArrayList<Integer> layer_collision_list = collision_list.get(layer1);
    
    if(layer_collision_list == null)
      layer_collision_list = new ArrayList<Integer>();
    
    layer_collision_list.add(layer2);
    collision_list.put(layer1, layer_collision_list);
    
    ////////////////////////////////
    
    layer_collision_list = collision_list.get(layer2);
    
    if(layer_collision_list == null)
      layer_collision_list = new ArrayList<Integer>();
    
    layer_collision_list.add(layer1);
    collision_list.put(layer2, layer_collision_list);
  }
  
  public void detectCollision() {
    
    for(Integer layer=0; layer < layers.size(); ++layer) {
      ArrayList<Integer> layers_to_collide = collision_list.get(layer);
      
      if(layers_to_collide == null) break;
      
      for(Integer layer_to_collide: layers_to_collide)
        checkCollisionBetween(layer, layer_to_collide);
    }
  }
  
  public void checkCollisionBetween(Integer layer1, Integer layer2) {
    
    ArrayList<ObjectBase> first_layer = layers.getLayer(layer1);
    ArrayList<ObjectBase> second_layer = layers.getLayer(layer2);
    
    for(int i = 0; i < first_layer.size(); ++i) {
      ObjectBase first_object = first_layer.get(i);
      
      for(int j = 0; j < second_layer.size(); ++j) {
        ObjectBase second_object = second_layer.get(j);
        
        if(first_object.isColliding(second_object) == true) {
          first_layer.remove(first_object);
          second_layer.remove(second_object);
          
          first_object.destroy();
          second_object.destroy();
          
          GAME_Score score = (GAME_Score)layers.getObject(2, "GAME_Score");
          ++score.damage_done;
          
          --i;
          break;
        }
      }
    }
  }
  
  
}