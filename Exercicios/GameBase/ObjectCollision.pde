public class ObjectCollision {
  
  public int radius = 10;
  
  public boolean isColliding(ObjectBase object, ObjectBase other_object) {
    int distance_x = object.position_x - other_object.position_x;
    int distance_y = object.position_y - other_object.position_y;
    
    int square_x = distance_x*distance_x;
    int square_y = distance_y*distance_y;
    
    float distance = sqrt(square_x+square_y);
    
    int sum_radius = radius + other_object.collision.radius;
    if( distance <= sum_radius)
      return true;
    
    return false;
  }
  
}