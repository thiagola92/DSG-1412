int contador_frames2 = 0;
int motion_a_cada_x_frames = 60;
int motion_maximo = 15;

void motion_pong() {
  background(0, 255, 0);
  rect(posX, posY, 30, 30);
  posX = posX + veloX;
  posY = posY + veloY;
  
  // motion
  if(contador_frames2 == teleporta_a_cada_x_frames) {
    motion();
    contador_frames2 = 0;
  } else {
    ++contador_frames2;
  }
  
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

void motion() {
  int motion = (int)random(motion_maximo) + 1;
  int motionX = motion;
  int motionY = motion;
  
  if(veloX < 0)
    motionX = -motionX;
  
  if(veloY < 0)
    motionY = -motionY;
    
  veloX = motionX;
  veloY = motionY;
  
  println(veloX + " && " + veloY);
}