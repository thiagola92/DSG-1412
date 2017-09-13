
int posX = 400;
int posY = 300;
int veloX = -3;
int veloY = 3;

void setup() {
  size(800, 600);
  rectMode(CENTER);
  noStroke();
}

void draw() {
  background(0, 255, 0);
  rect(posX, posY, 30, 30);
  posX = posX + veloX;
  posY = posY + veloY;
  // colisao na parede em baixo
  if(posY >= height - 15) {
    veloY = -veloY;
  }
  // colisao no pad da computador
  rect(10 + 30/2, posY, 30, 120);
  if(posX <= 10+15+15+15) {
    veloX = -veloX;
  }
  // colisao em cima
  if(posY <= 15) {
    veloY = - veloY;
  }
  // pad do jogador
  rect(width - 10 - 15, mouseY, 30, 120);
  
  // colisao no jogador
  if(posX >= width-10-15-15-15 &&
      posY >= mouseY - 60 - 15 &&
      posY <= mouseY + 60 + 15) {
    veloX = -veloX;
  }
}
