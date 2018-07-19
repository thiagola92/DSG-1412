public class Navigation extends BaseComponnent {
  
  public Navigation() {
    super.color_red = 255;
    super.color_green = 255;
    super.color_blue = 255;
    
    super.this_width = width;
    super.this_height = 50;
    
    super.this_position_x = 0;
    super.this_position_y = height - this_height;
  }
  
  public void draw() {
    stroke(0, 0, 0);
    fill(color_red, color_green, color_blue);
    rect(this_position_x, this_position_y, this_width, this_height);
  }
  
  public boolean onClick(int x, int y) {
    if(super.onClick(x, y)) {
      print("Navigation\n");
      return true;
    }
    
    return false;
  }
  
}
