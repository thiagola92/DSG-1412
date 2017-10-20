int positionY2 = 0;

float max = 0;
float min = 1023;

int contador_frames5 = 0;

void sensor2_pong() {
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
  
  // carrega a posição do jogador
  position_y2();
  int bar_position = positionY2 * 120 + 60;
  
  // pad do jogador
  rect(width - 10 - 15, bar_position, 30, 120);
  
  // colisao no jogador
  if(posX >= width-10-15-15-15 &&
      posY >= bar_position - 60 - 15 &&
      posY <= bar_position + 60 + 15 &&
      posX <= width-10+15) {
    if(esta_colidindo == false) {
      veloX = -veloX;
      esta_colidindo = true;
    }
  } else {
    esta_colidindo = false;
  }
}

void position_y2() {
  int sensorAnswer = arduino.analogRead(0);
  println("sensorAnswer: " + sensorAnswer);
  
  // Descobrindo o novo valor máximo e minimo que o sensor consegue chegar
  if(sensorAnswer > max) 
    max = sensorAnswer;
  if(sensorAnswer < min)
    min = sensorAnswer;
    
  // Se não passou 30 frames, não precisa atualizar a posição da barra
  contador_frames5++;
  if(contador_frames5 < 30)
    return;
  else
    contador_frames5 = 0;
    
  // Se o sensor estiver no 1/3 mais alto, subir
  // Se o sensor estiver no 1/3 mais alto, descer
  float diferenca = max-min;
  if(sensorAnswer < min + diferenca/3 && positionY2 > 0)
    positionY2--;
  else if(sensorAnswer > min + 2*diferenca/3 && positionY2 < 4)
    positionY2++;
    
  println("positionY2: " + positionY2);
}