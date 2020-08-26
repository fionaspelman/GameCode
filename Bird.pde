class Bird {
  float r = 16;
  PVector pos; //position
  PVector vel;
  PVector acc;
  
  Bird() {
    //at beginning
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  void show() {
    ellipse(pos.x,pos.y, r*2, r*2);
  }
  
  void update() {
    pos.add(vel);
    vel.add(acc);
    vel.limit(4);
    acc.mult(0);
    
    if(pos.y > height) {
      pos.y = height;
      vel.mult(0);
    }
    if(pos.y < 0) {
      pos.y = 0;
      vel.mult(0);
    }
  }
  void applyForce(PVector force) {
    acc.add(force);
  }
}
