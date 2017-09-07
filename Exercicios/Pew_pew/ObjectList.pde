public class ObjectList {
  
  private ArrayList<ArrayList> layer_list;
  
  public ObjectList() {
    layer_list = new ArrayList<ArrayList>();
  }
  
  public void addLayer() {
    layer_list.add(new ArrayList<ObjectBase>());
  }
  
  public void addObject(int layer_number, ObjectBase object) {
    getLayer(layer_number).add(object);
  }
  
  public ArrayList<ObjectBase> getLayer(int layer_number) {
    return layer_list.get(layer_number);
  }
  
  public ArrayList<ArrayList> getLayers() {
    return layer_list;
  }
  
}