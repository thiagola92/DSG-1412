int contador_frames3 = 0;
int invisible_a_cada_x_frames = 60;
int invisible_por_x_frames = 60;
boolean invisible = false;

void invisible_pong() {
  background(0, 255, 0);
  posX = posX + veloX;
  posY = posY + veloY;
  
  if(invisible == false)
    rect(posX, posY, 30, 30);
    
  // aparecer
  if(invisible == true) {
    if(contador_frames3 == invisible_por_x_frames) {
      invisible = false;
      contador_frames3 = 0;
    } else {
      ++contador_frames3;
    }
  }
  
  // invisible
  if(invisible == false) {
    if(contador_frames3 == invisible_a_cada_x_frames) {
      invisible = true;
      contador_frames3 = 0;
    } else {
      ++contador_frames3;
    }
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
  
  // se for para usar o sensor como controle
  if(usar_sensor == true) {
    sensorY();
    mouseY = posicao_da_barra_usando_sensor;
  }
  
  // pad do jogador
  rect(width - 10 - 15, mouseY, 30, 120);
  
  // colisao no jogador
  if(posX >= width-10-15-15-15 &&
      posY >= mouseY - 60 - 15 &&
      posY <= mouseY + 60 + 15 &&
      posX <= width-10+15) {
    if(esta_colidindo == false) {
      veloX = -veloX;
      esta_colidindo = true;
    }
  } else {
    esta_colidindo = false;
  }
}