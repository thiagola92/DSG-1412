
ArrayList<ObjectBase> object_list;

void setup () {
  size(800, 800);
  
  object_list = new ArrayList<ObjectBase>();
  object_list.add(new ObjectBase());
  object_list.add(new ObjectBase());
  
  object_list.get(0).position_x = 100;
  object_list.get(0).position_y = 100;
  
  object_list.get(1).position_x = 500;
  object_list.get(1).position_y = 100;
  object_list.get(1).speed_x = -1;
}

void draw () {
  background(0,150,0);
  
  fill(0,0,255);
  moveObjects();
  boundsCollision();
}

void keyTyped() {
  if(key == 'w')
    object_list.get(0).speed_y = -1;
  if(key == 's')
    object_list.get(0).speed_y = 1;
  if(key == 'd')
    object_list.get(0).speed_x = 1;
  if(key == 'a')
    object_list.get(0).speed_x = -1;
}

void keyReleased() {
  if(key == 'w')
    object_list.get(0).speed_y -= object_list.get(0).speed_y;
  if(key == 's')
    object_list.get(0).speed_y -= object_list.get(0).speed_y;
  if(key == 'd')
    object_list.get(0).speed_x -= object_list.get(0).speed_x;
  if(key == 'a')
    object_list.get(0).speed_x -= object_list.get(0).speed_x;
}

void moveObjects() {
  for(ObjectBase object: object_list) {
    if(object_list.get(0).isColliding(object_list.get(1)))
      fill(255,0,0);
    object.move();
    object.draw();
  }
}

void boundsCollision() {
  for(ObjectBase object: object_list) {
    if(object.position_x < 0 || object.position_x > 800) {
      object.position_x += -object.speed_x;
      object.speed_x *= -1;
    } if(object.position_y < 0 || object.position_y > 800) {
      object.position_y += -object.speed_y;
      object.speed_y *= -1;
    }
  }
}