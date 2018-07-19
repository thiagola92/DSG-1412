import ddf.minim.*;

public class Music {
  
  public int time_from_last_play = 0;
  
  public void pauseIfNeeded() {
      int time_now = millis();
      int interval = abs(time_now - time_from_last_play);
      
      if(audio.length() - audio.position() <= 200) {
        audio.rewind();
        audio.play();
      }
      
      if(interval > 500)
        audio.pause();
  }
  
}