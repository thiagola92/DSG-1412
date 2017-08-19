public abstract class BaseComponnent { 
  
  public int color_red = 0;
  public int color_green = 0;
  public int color_blue = 0;
  
  public int this_width = 0;
  public int this_height = 0;
  
  public int this_position_x = 0;
  public int this_position_y = 0;
  
  public void draw() {
  }
  
  public boolean onClick(int x, int y) {
    int position_x_start = this_position_x;
    int position_x_end = this_position_x + this_width;
    
    int position_y_start = this_position_y;
    int position_y_end = this_position_y + this_height;
    
    if(x > position_x_start && x < position_x_end && y > position_y_start && y < position_y_end)
      return true;
    
    return false;
  }
  
}
