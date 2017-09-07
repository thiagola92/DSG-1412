public class ObjectList {
  
  private ArrayList<ArrayList> layers = new ArrayList<ArrayList>();
  
  public void createLayer() {
    layers.add(new ArrayList<ObjectBase>());
  }
  
  public ArrayList<ArrayList> getLayers() {
    return layers;
  }
  
  public ArrayList<ObjectBase> getLayer(int layer) {
    return layers.get(layer);
  }
  
  public ObjectBase getObject(int layer, String object_name) {
    for(ObjectBase object: getLayer(layer)) {
      println(object.class_name);
      println(object_name);
      if(object.class_name.equals(object_name))
        return object;
    }
    
    return null;
  }
  
  public int size() {
    return layers.size();
  }
  
}