public class Keyboard {

  boolean keyboard = false;  
  boolean finishWriting = false;
  
  void beginKeyboard () {
   if (!keyboard) {
     openKeyboard();
     keyboard = true;
   }
  }
  
  void writing () {
       
   if (key == ENTER || key == RETURN) {
      closeKeyboard();
      finishWriting = true;
    } else if (keyCode == 67) { 
      // BACKSPACE, for some strange reason backspace in soft keyboard doesn't work as planed
      // so I picked the keyCode correspondent and use it as a test. Still, I know that's not
      // the best way (or the cleaneast) to do it, but I didn't find any other way.
      if (!status.playerName.isEmpty()) {
       status.playerName = status.playerName.substring(0, status.playerName.length()-1); 
      }
    } else if (keyCode == 59) { // SHIFT
        // just a test so the string don't become poluted
    } else {
      status.playerName = status.playerName + key;
    } 
  }
}