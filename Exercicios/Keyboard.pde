HashMap<Character, Boolean> keyboard;

void setup() {
  keyboard = new HashMap<Character, Boolean>();
}

void draw() {
}

void keyPressed() {
  if(!isKeyDown(key)) {
    setKeyDown(key, true);
    print(key);
  }
}

void keyReleased() {
  if(isKeyDown(key)) {
    setKeyDown(key, false);
  }
}

boolean isKeyDown(Character key) {
  if(keyboard.get(key) == null) {
    setKeyDown(key, false);
    return false;
  }
  
  if(keyboard.get(key) == true)
    return true;
  
  return false;
}

void setKeyDown(Character key, Boolean pressed) {
  keyboard.put(key, pressed);
}
