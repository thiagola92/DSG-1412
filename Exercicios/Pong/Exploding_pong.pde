int cor_vermelho = 0;
int explosao_a_cada_x_frames = 300;

int explosoes = 5; // nao passe do tamanho do array please
int nova_explosao_no_array = 0;
int[] explodiuX = {-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000};
int[] explodiuY = {-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000};

void exploding_pong() {
  background(0, 255, 0);
  fill(cor_vermelho, 0, 0);
  rect(posX, posY, 30, 30);
  fill(255);
  posX = posX + veloX;
  posY = posY + veloY;
  
  // explodir
  if(cor_vermelho >= 255) {
    cor_vermelho = 0;
    explodiu();
  } else {
    if((int)255/explosao_a_cada_x_frames == 0)
      cor_vermelho += 1;
    else
      cor_vermelho += (int)255/explosao_a_cada_x_frames;
  }
  
  // explosões
  for(int i = 0; i < explosoes; ++i) {
    fill(0, 0, 0);
    rect((float)explodiuX[i], (float)explodiuY[i], 300, 300);
    fill(255);
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

void explodiu() {
  explodiuX[nova_explosao_no_array] = posX;
  explodiuY[nova_explosao_no_array] = posY;
  
  if(nova_explosao_no_array+1 >= explosoes)
    nova_explosao_no_array = 0;
  else
    ++nova_explosao_no_array;
}