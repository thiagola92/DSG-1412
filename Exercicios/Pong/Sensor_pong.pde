
float maxSensor = 0;
float minSensor = 1023;
float sensorY;
float newMouseY;

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
  
  // calibrando o mouse + nova posicao y
  calibrar_sensor();
  
  // checando se a bola esta chegando
  if(veloX > 0 && posX < width-10+15) {
    int distance = abs((int)newMouseY - posX);
    int lightWhenCloser = abs(255 - distance);
    
    if(lightWhenCloser > 255)
      lightWhenCloser = 255;
    
    println("distance: " + distance);
    println("light bright: " + lightWhenCloser);
    
    arduino.analogWrite(3, lightWhenCloser);
  } else {
    arduino.analogWrite(3, 0);
  }
  
  // pad do jogador
  rect(width - 10 - 15, newMouseY, 30, 120);
  
  // colisao no jogador
  if(posX >= width-10-15-15-15 &&
      posY >= newMouseY - 60 - 15 &&
      posY <= newMouseY + 60 + 15 &&
      posX <= width-10+15) {
    if(esta_colidindo == false) {
      veloX = -veloX;
      esta_colidindo = true;
    }
  } else {
    esta_colidindo = false;
  }
}

void calibrar_sensor() {
  if(arduino == null)
    return;
  
  sensorY = arduino.analogRead(0);
  
  if(sensorY > maxSensor)
    maxSensor = sensorY;
  
  minSensor = maxSensor / height;
  
  newMouseY = (sensorY/minSensor) - 60;
    
  //println("sensorY: " + sensorY);
  //println("minSensor: " + minSensor);
  //println("maxSensor: " + maxSensor);
  //println("newPositionY: " + newMouseY);
  
}