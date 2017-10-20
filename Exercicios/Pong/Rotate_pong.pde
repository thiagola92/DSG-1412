int estado_da_rotacao = 1;

void rotate_pong() {
  if(estado_da_rotacao == 1)
    rotate1();
  else if (estado_da_rotacao == 2)
    rotate2();
  else if (estado_da_rotacao == 3)
    rotate3();
  else if (estado_da_rotacao == 4)
    rotate4();
}

void rotate1() {
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
      estado_da_rotacao = (int)random(4)+1;
    }
  } else {
    esta_colidindo = false;
  }
}

void rotate2() {
  background(0, 255, 0);
  rect(posX, posY, 30, 30);
  posX = posX + veloX;
  posY = posY + veloY;
  
  // colisao na parede direita
  if(posX >= width - 15) {
    veloX = -veloX;
  }
  
  // colisao no pad da computador
  rect(posX, 10 + 30/2, 120, 30);
  if(posY <= 10+15+15+15) {
    veloY = -veloY;
  }
  
  // colisao na esquerda
  if(posX <= 15) {
    veloX = - veloX;
  }
  
  // se for para usar o sensor como controle
  if(usar_sensor == true) {
    sensorY();
    //println("posicao_da_barra_usando_sensor: " + posicao_da_barra_usando_sensor);
    
    int nova_posicao_da_barra_usando_sensor = (int)(posicao_da_barra_usando_sensor/0.75);
    mouseX = nova_posicao_da_barra_usando_sensor;
    println("mouseX: " + mouseX);
  }
  
  // pad do jogador
  rect(mouseX, height - 10 - 15, 120, 30);
  
  // colisao no jogador
  if(posY >= height-10-15-15-15 &&
      posX >= mouseX - 60 - 15 &&
      posX <= mouseX + 60 + 15 &&
      posY <= height-10+15) {
    if(esta_colidindo == false) {
      veloY = -veloY;
      esta_colidindo = true;
      estado_da_rotacao = (int)random(4)+1;
    }
  } else {
    esta_colidindo = false;
  }
}

void rotate3() {
  background(0, 255, 0);
  rect(posX, posY, 30, 30);
  posX = posX + veloX;
  posY = posY + veloY;
  
  // colisao na parede em baixo
  if(posY >= height - 15) {
    veloY = -veloY;
  }
  
  // colisao no pad da computador
  rect(width - 10 - 15, posY, 30, 120);
  if(posX >= width-10-15-15-15) {
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
  rect(10 + 30/2, mouseY, 30, 120);
  
  // colisao no jogador
  if(posX <= 10+15+15+15 &&
      posY >= mouseY - 60 - 15 &&
      posY <= mouseY + 60 + 15 &&
      posX >= 10-15) {
    if(esta_colidindo == false) {
      veloX = -veloX;
      esta_colidindo = true;
      estado_da_rotacao = (int)random(4)+1;
    }
  } else {
    esta_colidindo = false;
  }
}

void rotate4() {
  background(0, 255, 0);
  rect(posX, posY, 30, 30);
  posX = posX + veloX;
  posY = posY + veloY;
  
  // colisao na parede direita
  if(posX >= width - 15) {
    veloX = -veloX;
  }
  
  // colisao no pad da computador
  rect(posX, height - 10 - 30/2, 120, 30);
  if(posY >= height-10-15-15-15) {
    veloY = -veloY;
  }
  
  // colisao na esquerda
  if(posX <= 15) {
    veloX = - veloX;
  }
  
  // se for para usar o sensor como controle
  if(usar_sensor == true) {
    sensorY();
    //println("posicao_da_barra_usando_sensor: " + posicao_da_barra_usando_sensor);
    
    int nova_posicao_da_barra_usando_sensor = (int)(posicao_da_barra_usando_sensor/0.75);
    mouseX = nova_posicao_da_barra_usando_sensor;
    println("mouseX: " + mouseX);
  }
  
  // pad do jogador
  rect(mouseX, 10 + 15, 120, 30);
  
  // colisao no jogador
  if(posY <= 10+15+15+15 &&
      posX >= mouseX - 60 - 15 &&
      posX <= mouseX + 60 + 15 &&
      posY >= 10-15) {
    if(esta_colidindo == false) {
      veloY = -veloY;
      esta_colidindo = true;
      estado_da_rotacao = (int)random(4)+1;
    }
  } else {
    esta_colidindo = false;
  }
}