Window window;
Control control;
Keyboard keyboard;
Cursor cursor;

ObjectList layers;
ObjectBase player;

Minim minim;
AudioPlayer audio;
Music music;

CollisionLayers collision_layers;

void setup() {
  size(800, 600);
  
  window = new Window();
  control = new Control();
  keyboard = new Keyboard();
  cursor = new Cursor();
  layers = new ObjectList();
  
  layers.createLayer();  // 0) Objects layer
  layers.createLayer();  // 1) Shot layer
  layers.createLayer();  // 2) Text layer
  
  collision_layers = new CollisionLayers();
  collision_layers.addCollisionBetween(0, 1);
  
  minim = new Minim(this);
  audio = minim.loadFile("music.mp3", 1024);
  music = new Music();
  
  create_world();
}

void draw() {
  background(0,0,0);
  
  updateWorld();
  
  if(keyPressed)
    control.keyHolding();
    
  if(mousePressed)
    control.mouseHolding();
  
  moveObjects();
  drawObjects();
  
  collision_layers.detectCollision();
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
  
  for(ArrayList<ObjectBase> layer: layers.getLayers()) {
    for(ObjectBase object: layer) {
      object.move();
    }
  }
  
  player.move();
}

void drawObjects() {
  
  for(ArrayList<ObjectBase> layer: layers.getLayers()) {
    for(ObjectBase object: layer) {
      object.draw();
    }
  }
  
  player.draw();
}