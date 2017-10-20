import ddf.minim.*;
import ddf.minim.ugens.*;
import processing.serial.*;
import cc.arduino.*;

Minim minim;
AudioOutput out;
Arduino arduino;

int pong_game = 8;
boolean usar_sensor = true;

int posX;
int posY;
int veloX = -5;
int veloY = 5;
boolean esta_colidindo = false;

void setup() {
  size(800, 600);
  posX = width/2;
  posY = height/2;
  rectMode(CENTER);
  noStroke();
  
  try {
    minim = new Minim(this);
    out = minim.getLineOut();
  } catch (Exception e) {
    println("Não foi detectado saida de audio");
  }
  
  try {
    arduino = new Arduino(this, Arduino.list()[0], 57600);
    for(int i = 13; i > 3; i--) {
      arduino.pinMode(i, Arduino.OUTPUT);
    }
  } catch (Exception e) {
    println("Não foi detectado arduino na porta 0");
  }
}

void draw() {
  if(pong_game == 1)
    classic_pong();
  else if(pong_game == 2)
    teleport_pong();
  else if(pong_game == 3)
    motion_pong();
  else if(pong_game == 4)
    invisible_pong();
  else if(pong_game == 5)
    exploding_pong();
  else if(pong_game == 6)
    illusion_pong();
  else if(pong_game == 7)
    blind_pong();
  else if(pong_game == 8)
    rotate_pong();
  else if(pong_game == 9)
    sensor_pong();
  else if(pong_game == 0)
    sensor2_pong();
}

void resetar(int n) {
  posX = width/2;
  posY = height/2;
  veloX = -5;
  veloY = 5;
  esta_colidindo = false;
  
  pong_game = n;
}
void keyPressed() {
  if(key == '1')
    resetar(1);
  else if(key == '2')
    resetar(2);
  else if(key == '3')
    resetar(3);
  else if(key == '4')
    resetar(4);
  else if(key == '5')
    resetar(5);
  else if(key == '6')
    resetar(6);
  else if(key == '7')
    resetar(7);
  else if(key == '8')
    resetar(8);
  else if(key == '9')
    resetar(9);
  else if(key == '0')
    resetar(0);
}

int sensor_positionY = 0;
int posicao_da_barra_usando_sensor = 0;

int max_sensorY = 0;
int min_sensorY = 1023;

int contador_frames_para_o_sensor = 0;
int particionar_tela_em_x_pedacos = 30;

void sensorY() {
  int sensorAnswer = arduino.analogRead(0);
  //println("sensorAnswer: " + sensorAnswer);
  
  // Descobrindo o novo valor máximo e minimo que o sensor consegue chegar
  if(sensorAnswer > max_sensorY) 
    max_sensorY = sensorAnswer;
  if(sensorAnswer < min_sensorY && sensorAnswer != 0)
    min_sensorY = sensorAnswer;
  //println("max_sensorY: " + max_sensorY);
  //println("min_sensorY: " + min_sensorY);
    
  // Se não passou 150/particionar_tela_em_x_pedacos frames, não precisa atualizar a posição da barra
  // Isso é para que não atualize a posição da barra rápido demais, se quiser que altere mais rapido diminua o valor 150
  contador_frames_para_o_sensor++;
  if(contador_frames_para_o_sensor < 150/particionar_tela_em_x_pedacos)
    return;
  else
    contador_frames_para_o_sensor = 0;
    
  // Se o sensor estiver no 1/3 mais alto, subir
  // Se o sensor estiver no 1/3 mais alto, descer
  float diferenca = max-min;
  if(sensorAnswer < min + diferenca/3 && sensor_positionY > 0)
    sensor_positionY--;
  else if(sensorAnswer > min + 2*diferenca/3 && sensor_positionY < particionar_tela_em_x_pedacos)
    sensor_positionY++;
  //println("sensor_positionY: " + sensor_positionY);
  
  posicao_da_barra_usando_sensor = sensor_positionY * (height-60)/particionar_tela_em_x_pedacos + 60;
  //println("posicao_da_barra_usando_sensor: " + posicao_da_barra_usando_sensor);
}