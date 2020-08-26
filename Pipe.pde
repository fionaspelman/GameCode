class Pipe {
  float x;
  float top;
  float bottom;
  float w = 40;
  
  Pipe() {
    x = width + w;
    top = random(100, height/2);
    bottom = random(100, height/2);
  }
  void show(boolean hit) {
    if(hit) {
      fill(255, 0, 0);
    }
    else {
      fill(255, 255, 255);
    }
    rect(x, 0, w, top);
    rect(x, height - bottom, w, bottom);
  }
  void update() {
    x -= 3;
  }
  boolean hits(Bird b) { //going to return true of false
    if((b.pos.x > x ) && (b.pos.x < x + w)) {
      if(!((b.pos.y > top) && (b.pos.y < (height - bottom)))) {
        return true;
      }
    }
    return false;
  }
  
}
