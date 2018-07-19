public class CrystalTarget extends Target {

  public void draw() {
    fill(colors.target);

    quad(position.x, position.y - radius, position.x - radius, position.y, position.x, position.y + radius, position.x + radius, position.y);
  }

  public void collision(int index) {

    ArrayList<Target> FiveClosest = new ArrayList<Target>();

    for (int i = 0; i < target.size(); i++) {
      if (target.get(i).position.y > player.get(index).position.y)
        continue;

      if (FiveClosest.size() < 5) {
        FiveClosest.add(target.get(i));
        continue;
      }

      Target farest = FiveClosest.get(0);
      for (int j = 1; j < FiveClosest.size(); j++) {
        float distance = calculateDistance(farest, player.get(index));
        float distance2 = calculateDistance(FiveClosest.get(j), player.get(index));

        if (distance2 > distance)
          farest = FiveClosest.get(j);
      }

      float distance = calculateDistance(farest, player.get(index));
      float distance2 = calculateDistance(target.get(i), player.get(index));

      if (distance2 < distance) {
        FiveClosest.remove(farest);
        FiveClosest.add(target.get(i));
      }
    }

    for(int i = 0; i < FiveClosest.size(); i++) {
      FiveClosest.get(i).position.x = player.get(index).position.x;
    }

    super.collision(index);
  }

  public float calculateDistance(Target t, Player p) {
    float distanceX = abs(t.position.x - p.position.x);
    float distanceY = abs(t.position.y - p.position.y);
    float distance = sqrt(pow(distanceX, 2) + pow(distanceY, 2));

    return distance;
  }
}