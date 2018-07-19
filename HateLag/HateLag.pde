
int DELAY = 0;
int BALLS_MAX_QUANTITY = 10;
float BALLS_MAX_RADIUS = 75;
float PROBABILITY_FROM_BALL_APPEAR = 10;

ArrayList<Ball> ballList;
ArrayList<Click> clickList;
ArrayList<JumpLabel> jumpLabelList;
Score score;
Label delay;

void setup() {
  size(1000, 800);
  //fullScreen();

  ballList = new ArrayList<Ball>();
  clickList = new ArrayList<Click>();
  jumpLabelList = new ArrayList<JumpLabel>();
  score = new Score("", new PVector(30, 30));
  delay = new Label(str(DELAY), new PVector(30, 60));
}

void draw() {
  background(0);

  addBall();
  drawBalls();
  deleteBalls();

  removeOldestClick();

  drawJumpLabels();
  deleteJumpLabels();

  score.draw();
  delay.draw();
}

void addBall() {
  if (ballList.size() >= BALLS_MAX_QUANTITY)
    return;

  if (random(100.0) > PROBABILITY_FROM_BALL_APPEAR)
    return;

  ballList.add(new Ball());
}

void drawBalls() {
  for (Ball b : ballList)
    b.draw();
}

void deleteBalls() {
  for (int i = 0; i < ballList.size(); ) {
    Ball b = ballList.get(i);

    if (b.radius > BALLS_MAX_RADIUS)
      ballList.remove(b);
    else
      i++;
  }
}

void removeOldestClick() {
  if (clickList.isEmpty())
    return;

  Click c = clickList.get(0);
  int timeNow = millis();
  if (timeNow - c.time < DELAY)
    return;

  if (isBallListSmaller() == false) {
    jumpLabelList.add(new JumpLabel("miss", c.position));
    score.points = 0;
  } else {
    jumpLabelList.add(new JumpLabel("hit", c.position));
  }
}

boolean isBallListSmaller() {
  int sizeBefore = ballList.size();

  doClick();
  clickList.remove(0);

  if (sizeBefore > ballList.size())
    return true;

  return false;
}

void doClick() {
  for (int i = 0; i < ballList.size(); ) {
    Ball b = ballList.get(i);

    if (b.clicked())
      hitBall(b);
    else
      i++;
  }
}

void hitBall(Ball b) {
  ballList.remove(b);
  score.points++;
}

void drawJumpLabels() {
  for (JumpLabel jl : jumpLabelList)
    jl.draw();
}

void deleteJumpLabels() {
  for(int i=0; i < jumpLabelList.size();) {
    JumpLabel jl = jumpLabelList.get(i);
    
    if(jl.isTimeToDelete())
      jumpLabelList.remove(jl);
    else
      i++;
    
  }
}

void mousePressed() {
  clickList.add(new Click());
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP)
      changeDelay(60);
    else if (keyCode == DOWN)
      changeDelay(-60);
  }
}

void changeDelay(int i) {
  DELAY += i;

  if (DELAY < 0)
    DELAY = 0;

  delay.text = str(DELAY);
}