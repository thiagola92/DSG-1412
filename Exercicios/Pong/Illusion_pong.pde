
int ilusoes = 5; // nao passe do tamanho do array please
int nova_ilusao_no_array = 0;
int[] ilusaoPosX = {-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000};
int[] ilusaoPosY = {-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000,-1000};
int[] ilusaoVeloX = {-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0};
int[] ilusaoVeloY = {-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0,-0};

void illusion_pong() {
  background(0, 255, 0);
  rect(posX, posY, 30, 30);
  posX = posX + veloX;
  posY = posY + veloY;
  
  for(int i=0; i < ilusoes; ++i) {
    rect(ilusaoPosX[i], ilusaoPosY[i], 30, 30);
    ilusaoPosX[i] = ilusaoPosX[i] + ilusaoVeloX[i];
    ilusaoPosY[i] = ilusaoPosY[i] + ilusaoVeloY[i];
  }
  
  // colisao na parede em baixo
  if(posY >= height - 15) {
    veloY = -veloY;
  }
  
  // colisao na parede em baixo, ilusao
  for(int i=0; i < ilusoes; ++i) {
    if(ilusaoPosY[i] >= height - 15) {
      ilusaoVeloY[i] = -ilusaoVeloY[i];
    }
  }
  
  // colisao no pad da computador
  rect(10 + 30/2, posY, 30, 120);
  if(posX <= 10+15+15+15) {
    veloX = -veloX;
  }
  
  // colisao no pad da computador ilusao
  for(int i=0; i < ilusoes; ++i) {
    if(ilusaoPosX[i] <= 10+15+15+15) {
      ilusaoVeloX[i] = -ilusaoVeloX[i];
    }
  }
  
  // colisao em cima
  if(posY <= 15) {
    veloY = - veloY;
  }
  
  // colisao em cima
  for(int i=0; i < ilusoes; ++i) {
    if(ilusaoPosY[i] <= 15) {
      ilusaoVeloY[i] = - ilusaoVeloY[i];
    }
  }
  
  // pad do jogador
  rect(width - 10 - 15, mouseY, 30, 120);
  
  // colisao no jogador
  if(posX >= width-10-15-15-15 &&
      posY >= mouseY - 60 - 15 &&
      posY <= mouseY + 60 + 15) {
    ilusao();
    veloX = -veloX;
  }
  
  // colisao no jogador ilusao
  for(int i=0; i < ilusoes; ++i) {
    if(ilusaoPosX[i] >= width-10-15-15-15) {
      ilusaoVeloX[i] = -ilusaoVeloX[i];
    }
  }
}

void ilusao() {
  println(nova_ilusao_no_array);
  
  ilusaoPosX[nova_ilusao_no_array] = posX;
  ilusaoPosY[nova_ilusao_no_array] = posY;
  ilusaoVeloX[nova_ilusao_no_array] = veloX;
  ilusaoVeloY[nova_ilusao_no_array] = -veloY;
  
  if(nova_ilusao_no_array+1 >= ilusoes)
    nova_ilusao_no_array = 0;
  else
    ++nova_ilusao_no_array;
}