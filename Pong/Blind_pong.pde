int contador_frames4 = 0;
int fazer_som_a_cada_x_frames = 30;

void blind_pong() {
  background(0, 255, 0);
  rect(posX, posY, 30, 30);
  posX = posX + veloX;
  posY = posY + veloY;
  
  if(contador_frames4 == fazer_som_a_cada_x_frames) {
    tocar_som();
    contador_frames4 = 0;
  } else {
    ++contador_frames4;
  }
  
  // colisao na parede em baixo
  if(posY >= height - 15) {
    veloY = -veloY;
  }
  
  // colisao no pad da computador
  //rect(10 + 30/2, posY, 30, 120);
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
  //rect(width - 10 - 15, mouseY, 30, 120);
  
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

void tocar_som() {  
  if(out == null)
    return;
    
  out.setTempo( 120 );
  out.playNote( 0, 0.2, posY );
}