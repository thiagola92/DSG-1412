public class TriangleTarget extends Target {

  public void draw() {
    fill(colors.target);

    triangle(position.x - radius, position.y + radius, position.x + radius, position.y + radius, position.x, position.y - radius);
  }
  
  public void collision(int index) {
    
    for(int i = 0; i < player.size(); i++) {
      if(player.get(index).position.y < player.get(i).position.y) {
        player.get(i).alive = true;
        player.get(i).position.y = player.get(index).position.y;
        player.get(i).position.x = player.get(index).position.x;
      }
    }
    
    super.collision(index);
  }
  
}