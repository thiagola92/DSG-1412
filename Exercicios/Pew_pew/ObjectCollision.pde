public class ObjectCollision {
  
  public float radius = 10;
  
  public boolean isColliding(ObjectBase object, ObjectBase other_object) {
    float distance_x = object.physic.position_x - other_object.physic.position_x;
    float distance_y = object.physic.position_y - other_object.physic.position_y;
    
    float square_x = distance_x*distance_x;
    float square_y = distance_y*distance_y;
    
    float distance = sqrt(square_x+square_y);
    
    float sum_radius = radius + other_object.collision.radius;
    if( distance <= sum_radius)
      return true;
    
    return false;
  }
  
}