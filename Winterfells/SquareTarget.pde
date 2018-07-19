public class SquareTarget extends Target {
  
  public void draw() {
    fill(colors.target);
    
    rect(position.x, position.y, 2*radius, 2*radius);
  }
  
  public void collision(int index) {
    
    for(int i = 0; i < player.size(); i++) {
      if(player.get(i).alive == true && i != index)
        player.get(i).jump();
    }
    
    super.collision(index);
  }
  
}