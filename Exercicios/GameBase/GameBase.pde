
ObjectBase object1;
ObjectBase object2;

void setup () {
  size(800, 800);
  
  object1 = new ObjectBase();
  object2 = new ObjectBase();
  
  object1.position_x = 100;
  object1.position_y = 100;
  
  object2.position_x = 500;
  object2.position_y = 100;
  object2.speed_x = -1;
}

void draw () {
  background(0,150,0);
  
  object1.move();
  object1.draw();
  
  object2.move();
  object2.draw();
  
}

void keyPressed() {
  if(key == 'w')
    object1.speed_y = -1;
  if(key == 's')
    object1.speed_y = 1;
  if(key == 'd')
    object1.speed_x = 1;
  if(key == 'a')
    object1.speed_x = -1;
}

void keyReleased() {
  if(key == 'w')
    object1.speed_y -= object1.speed_y;
  if(key == 's')
    object1.speed_y -= object1.speed_y;
  if(key == 'd')
    object1.speed_x -= object1.speed_x;
  if(key == 'a')
    object1.speed_x -= object1.speed_x;
}
