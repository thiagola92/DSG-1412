import processing.video.*;

Capture myVideo;

int maxPlayer = 2;
int player = 0;
color[] playerColor = new color[2];

int red = 0;
int green = 0;
int blue = 0;

void setup() {
  size(640, 480);
  
  myVideo = new Capture(this, width, height, 30);
  myVideo.start();  
  
  playerColor[0] = color(red, green, blue);
  playerColor[1] = color(red, green, blue);
  
  rectMode(CENTER);
  noStroke();
}

void draw() {
  if(player < maxPlayer) {
    text("'q' incrementa vermelho, 'a' decrementa vermelho", 10, 10);
    text("'w' incrementa verde, 's' decrementa verde", 10, 20);
    text("'e' incrementa azul, 'd' decrementa azul", 10, 30);
    
    if(player == 0) {
      text("vermelho: " + red + ", verde: " + green + ", azul: " + blue, 10, 40);
      text("Escolha a cor do player 1 e aperte enter", 10, 50);
    } else if(player == 1) {
      text("vermelho: " + int(red(playerColor[0])) + ", verde: " + int(green(playerColor[0])) + ", azul: " + int(blue(playerColor[0])), 10, 40);
      text("vermelho: " + red + ", verde: " + green + ", azul: " + blue, 10, 50);
      text("Escolha a cor do player 2 e aperte enter", 10, 60);
    }
  }
  
  if (myVideo.available()) {
    myVideo.read();
    image(myVideo, 0, 0, width, height); // Coloca a imagem da camera na tela
    
    int[] playerX = new int[2];
    int[] playerY = new int[2];
    playerX[0] = 0;
    playerY[0] = 0; 
    playerX[1] = 0;
    playerY[1] = 0;
    
    float[] smallestDifference = new float[2];
    smallestDifference[0] = 255.0;
    smallestDifference[1] = 255.0;
    
    int index = 0;
    for (int y = 0; y < myVideo.height; y++) {
      for (int x = 0; x < myVideo.width; x++) {
        
        int pixelColor = myVideo.pixels[index];
        
        for(int i=0; i < maxPlayer; i++) {
          float diff = (abs(red(playerColor[i]) - red(pixelColor)) +
          abs(green(playerColor[i]) - green(pixelColor))+
          abs(blue(playerColor[i]) - blue(pixelColor)))/3;
          
          if (diff <= smallestDifference[i]) {
            smallestDifference[i] = diff;
            if(x >= playerX[i] + 100 || x <= playerX[i] - 100)
              playerX[i] = x;
            if(y >= playerY[i] + 15 || y <= playerY[i] - 15)
              playerY[i] = y;
          }
        }
        
        index++;
      }
    }
    
    fill(255, 255, 255);
    rect(playerX[0], playerY[0], 200, 30);
    if(player > 0)
      rect(playerX[1], playerY[1], 200, 30);
  }
}

void keyPressed() {
  if(key == '\n' && player < maxPlayer) {
    player++;
    if(player < maxPlayer)
      playerColor[player] = color(red, green, blue);
    key = 'q';
    return;
  }
  
  if(key == 'q') {
    if(red < 255)
      red++;
  } else if(key == 'a') {
    if(red > 0)
      red--;
  } else if(key == 'w') {
    if(green < 255)
      green++;
  } else if(key == 's') {
    if(green > 0)
      green--;
  } else if(key == 'e') {
    if(blue < 255)
      blue++;
  } else if(key == 'd') {
    if(blue > 0)
      blue--;
  }
  
  if(player < maxPlayer)
    playerColor[player] = color(red, green, blue);
}