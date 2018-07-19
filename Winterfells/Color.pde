public class Color {
  
  color gameBackground;
  color menuBackground;
  color elementBackground;
  color target;
  
  color[] player = new color[5];
  
  public Color() {
    
    gameBackground = color(0, 0, 0);
    menuBackground = color(0, 0, 0);
    elementBackground = color(255, 255, 255);
    target = color(255, 255, 255);
    
    player[0] = color(66, 134, 224);
    player[1] = color(155, 66, 244);
    player[2] = color(244, 65, 235);
    player[3] = color(88, 244, 65);
    player[4] = color(244, 145, 65);
    
  }
  
}