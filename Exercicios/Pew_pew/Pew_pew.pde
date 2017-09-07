
Window window;
Control control;
Keyboard keyboard;
Cursor cursor;

ArrayList<ArrayList> objects_layers;
ObjectBase player;

Score score;

void setup() {
  size(800, 600);
  
  window = new Window();
  control = new Control();
  keyboard = new Keyboard();
  cursor = new Cursor();
  objects_layers = new ArrayList<ArrayList>();
  
  objects_layers.add(new ArrayList<ObjectBase>());
  objects_layers.add(new ArrayList<ObjectBase>());
  
  score = new Score();
  
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
  
  for(ArrayList<ObjectBase> layer: objects_layers) {
    for(ObjectBase object: layer) {
      object.move();
      object.draw();
    }
  }
  
  player.move();
  player.draw();
}