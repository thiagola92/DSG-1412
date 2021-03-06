public class MiniToolbar extends BaseComponnent {
  
  public MiniToolbar() {
    super.color_red = 0;
    super.color_green = 0;
    super.color_blue = 0;
    
    super.this_width = width;
    super.this_height = 20;
    
    super.this_position_x = 0;
    super.this_position_y = 0;
  }
  
  public void draw() {
    noStroke();
    fill(color_red, color_green, color_blue);
    rect(this_position_x, this_position_y, this_width, this_height);
  }
  
  public boolean onClick(int x, int y) {
    if(super.onClick(x, y)) {
      print("MiniToolbar\n");
      return true;
    }
    
    return false;
  }
  
}
