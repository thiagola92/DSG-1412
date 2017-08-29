ArrayList<ObjectBase> object_list;
Keyboard keyboard;
Window window;

void setup() {
  size(800, 800);
  window = new Window(800, 800);
  
  object_list = new ArrayList<ObjectBase>();
  keyboard = new Keyboard();
}

void draw() {
}

// Use keyHolding or keyDown instead
void keyPressed() {
  keyHolding();

  if(isKeyDown(key) == false) {
    keyDown();
    setKeyDown(key, true);
  }
}

// Use keyUp instead
void keyReleased() {
  keyUp();
  setKeyDown(key, false);
}

void keyDown() {
}

void keyHolding() {
}

void keyUp() {
}
