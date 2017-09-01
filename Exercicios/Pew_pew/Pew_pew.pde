
Window window;
Control control;
Keyboard keyboard;
Cursor cursor;

ObjectList objects;
ObjectBase player;

void setup() {
  size(800, 800);
  
  window = new Window();
  control = new Control();
  keyboard = new Keyboard();
  cursor = new Cursor();
  objects = new ObjectList();
  
  objects.addLayer();
  objects.addLayer();
  
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
  
  for(ArrayList<ObjectBase> layer: objects.layer_list) {
    for(ObjectBase object: layer) {
      object.move();
      object.draw();
    }
  }
  
  player.move();
  player.draw();
}