public class ObjectList {
  
  public ArrayList<ArrayList> layer_list;
  
  public ObjectList() {
    layer_list = new ArrayList<ArrayList>();
  }
  
  public void addLayer() {
    layer_list.add(new ArrayList<ObjectBase>());
  }
  
  public void addObject(int layer_number, ObjectBase object) {
    getLayer(layer_number).add(object);
  }
  
  public void removeObject(int layer_number, ObjectBase object) {
    getLayer(layer_number).remove(object);
  }
  
  public void removeObject(int layer_number, int object) {
    getLayer(layer_number).remove(object);
  }
  
  public ArrayList<ObjectBase> getLayer(int layer_number) {
    return layer_list.get(layer_number);
  }
  
  public ObjectBase getObject(int layer_number, int object_number) {
    return getLayer(layer_number).get(object_number);
  }
  
}