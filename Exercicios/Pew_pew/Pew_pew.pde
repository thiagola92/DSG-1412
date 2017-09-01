
Window window;
Control control;
Keyboard keyboard;
Cursor cursor;

ArrayList<ArrayList> object_layer;
ArrayList<ObjectBase> object_list;
ArrayList<ObjectBase> object_list_2;

ObjectBase player;

void setup() {
  size(800, 800);
  window = new Window();
  control = new Control();
  keyboard = new Keyboard();
  cursor = new Cursor();
  
  object_layer = new ArrayList<ArrayList>();
  object_layer.add(new ArrayList<ObjectBase>());
  object_layer.add(new ArrayList<ObjectBase>());
  
  object_list = new ArrayList<ObjectBase>();
  object_list_2 = new ArrayList<ObjectBase>();
  
  create_world();
}

void draw() {
  background(0,200,0);
  
  updateWorld();
  
  if(keyPressed)
    control.keyHolding();
    
  if(mousePressed)
    control.mouseHolding();
  
  moveObjects();
}

// Use class Control instead
void keyPressed() {
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

// Use class Control instead
void mousePressed() {
  if(cursor.isButtonDown(mouseButton) == false) {
    control.mouseDown();
    cursor.setButtonDown(mouseButton, true);
  }
}

// Use class Control instead
void mouseReleased() {
  control.mouseUp();
  cursor.setButtonDown(mouseButton, false);
}


void moveObjects() {
  for(ObjectBase object: object_list) {
    object.move();
    object.draw();
  }
  
  for(ObjectBase object: object_list_2) {
    object.move();
    object.draw();
  }
  
  player.move();
  player.draw();
}