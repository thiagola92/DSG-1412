public class Movable {

  public PVector position = new PVector(0, 0);
  public PVector velocity = new PVector(0, 0);
  public PVector aceleration = new PVector(0, 0);

  public PVector destination = new PVector(0, 0);

  public void draw() {

    if (position.x != destination.x) {
      velocity.x += aceleration.x;
      position.x += velocity.x;
    }

    if (position.x != destination.x) {
      velocity.y += aceleration.y;
      position.y += velocity.y;
    }
  }
}