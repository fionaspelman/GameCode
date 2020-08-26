PImage bg;
int bgx, bgy;
Bird b;
int score = 0;
PVector gravity = new PVector(0, 0.5);
ArrayList<Pipe> pipes = new ArrayList<Pipe>();

void setup() {
 size(500, 500);
 bg = loadImage("bg1.png");
 b = new Bird();
 
}

void draw() {
  image(bg, bgx, bgy);
  image(bg, bgx + bg.width, bgy);
  bgx = bgx - 1;
  if(bgx < -bg.width)
  {
    bgx = 0;
  }
  
  boolean safe = true;
  
  if(frameCount % 75 == 0) {
    pipes.add(new Pipe());
  }
  b.show();
  if(keyPressed) {
    PVector up = new PVector(0, -5);
    b.applyForce(up);
  }
  b.applyForce(gravity);
  b.update();
 
 for(int i = pipes.size()-1; i >=0; i--) {
  Pipe p = pipes.get(i);
  
  if(p.x < -p.w) {
    pipes.remove(i);
  }
  else {
  p.update();
  p.show(p.hits(b));
  safe = !p.hits(b);
  }
 }
 if(safe) {
   score++;
 }
 else {
   score -= 50;
 }
 fill(255, 0, 255);
 textSize(60);
 score = constrain(score, 0, score);
 text(score, width/2, 50);
}
