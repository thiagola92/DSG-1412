
Window window;
Control control;
Keyboard keyboard;

ArrayList<ObjectBase> object_list;

void setup() {
  size(800, 800);
  window = new Window(800, 800);
  control = new Control();
  keyboard = new Keyboard();
  
  object_list = new ArrayList<ObjectBase>();
}

void draw() {
}

// Use keyHolding or keyDown instead
void keyPressed() {
  control.keyHolding();

  if(keyboard.isKeyDown(key) == false) {
    control.keyDown();
    keyboard.setKeyDown(key, true);
  }
}

// Use keyUp instead
void keyReleased() {
  control.keyUp();
  keyboard.setKeyDown(key, false);
}
