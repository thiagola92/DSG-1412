
Window window;
Control control;
Keyboard keyboard;

ArrayList<ObjectBase> object_list;

ObjectBase player;

void setup() {
  size(800, 800);
  window = new Window(800, 800);
  control = new Control();
  keyboard = new Keyboard();
  object_list = new ArrayList<ObjectBase>();
  
  create_world();
}

void draw() {
  background(0,200,0);
  
  checkWorld();
  
  moveObjects();
}

// Use class Control instead
void keyPressed() {
  control.keyHolding();

  if(keyboard.isKeyDown(key) == false) {
    control.keyDown();
    keyboard.setKeyDown(key, true);
  }
}

// Use class Control instead
void keyReleased() {
  control.keyUp();
  keyboard.setKeyDown(key, false);
}

void moveObjects() {
  for(ObjectBase object: object_list) {
    object.move();
    object.draw();
  }
  
  player.move();
  player.draw();
}