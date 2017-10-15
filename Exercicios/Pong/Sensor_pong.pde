int positionY = 0;

boolean upHolding = false;
boolean downHolding = false;

void sensor_pong() {
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
  position_y();
  int bar_position = positionY * 120 + 60;
  
  // luz do arduino
  light_position();
  
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

void position_y() {
  int upPressed = arduino.analogRead(0);
  int downPressed = arduino.analogRead(1);
  
  //println("upPressed: " + upPressed);
  //println("downPressed: " + downPressed);
  
  if(upPressed > 0 && upHolding == false && positionY > 0) {
    positionY -= 1;
    upHolding = true;
  } else if(upPressed == 0 && upHolding == true) {
    upHolding = false;
  }
  
  if(downPressed > 0 && downHolding == false && positionY < 4) {
    positionY += 1;
    downHolding = true;
  } else if(downPressed == 0 && downHolding == true) {
    downHolding = false;
  }
  
  //println("positionY: " + positionY);
}

void light_position() {
  for(int i = 13; i > 8; i--) {
    if(positionY + i == 13)
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