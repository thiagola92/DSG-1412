int contador_frames = 0;
int teleporta_a_cada_x_frames = 60;
int puloMax = 100;

void teleport_pong() {
  background(0, 255, 0);
  rect(posX, posY, 30, 30);
  posX = posX + veloX;
  posY = posY + veloY;
  
  // teleporte
  if(contador_frames == teleporta_a_cada_x_frames) {
    teleporte();
    contador_frames = 0;
  } else {
    ++contador_frames;
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

void teleporte() {
  int puloX = 0;
  int puloY = 0;
  
  // calcular se pulo vai passar do player/tela
  for(int i=0; i < puloMax; ++i) {
    puloX = i;
    puloY = i;
    
    if(veloX < 0)
      puloX = -puloX;
      
    if(veloY < 0)
      puloY = -puloY;
    
    // colisão com o pad do computador
    if(posX+veloX+puloX >= width-10-15-15-15) {
      puloX = puloX - 1;
      break;
    }
    
    // passando do player
    if(posX + puloX <= 10+15+15+15) {
      puloX = puloX + 1;
      break;
    }
  
    // colisao na parede em baixo
    if(posY+puloY >= height - 15) {
      puloY = puloY + 1;
      break;
    }
  
    // colisao em cima
    if(posY+puloY <= 15) {
      puloY = puloY - 1;
      break;
    }
    
  }
  
  // pular
  posX += puloX;
  posY += puloY;
}