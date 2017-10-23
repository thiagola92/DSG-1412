
void sensor_pong() {
  background(0, 255, 0);
  //rect(posX, posY, 30, 30);
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
  
  // se for para usar o sensor como controle
  if(usar_sensor == true) {
    sensorY();
    mouseY = posicao_da_barra_usando_sensor;
  }
  
  // luz do arduino
  light_position();
  
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

int numero_de_leds = 5;

void light_position() {
  
   int particao_da_posicao = sensor_positionY/(particionar_tela_em_x_pedacos/numero_de_leds);
   println(particao_da_posicao);
  
  for(int i = 13; i > 8; i--) {
    if(particao_da_posicao + i == 13)
      arduino.digitalWrite(i, Arduino.HIGH);
    else
      arduino.digitalWrite(i, Arduino.LOW);
    
    //print(">>" + ((13 - i - 1) * 120 + 120));
    //println(" --- " + ((13 - i) * 120 + 120));
    
    if((posY >= (13 - i - 1) * 120 + 120 && posY <= (13 - i) * 120 + 120 && veloX > 0) || posX > width)
      arduino.digitalWrite(i - 5, Arduino.HIGH);
    else
      arduino.digitalWrite(i - 5, Arduino.LOW);
  }
}