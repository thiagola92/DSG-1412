class Ball {

  PVector position;
  float radius;
  color cor;

  Ball() {
    int x = int(random(width));
    int y = int(random(height));

    position = new PVector(x, y);
    radius = 0;

    float red = random(256);
    float green = random(256);
    float blue = random(256);
    cor = color(red, green, blue);
  }

  void draw() {
    radius++;

    fill(cor);
    noStroke();
    ellipse(position.x, position.y, radius*2, radius*2);
  }

  boolean clicked() {
    Click click = clickList.get(0);
    PVector mouse = new PVector(click.position.x, click.position.y);
    
    if (mouse.dist(this.position) < radius) {
      return true;
    }

    return false;
  }
}