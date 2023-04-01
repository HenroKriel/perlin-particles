class Particle {
  private PVector pos = new PVector();
  private PVector vel = new PVector();
  private PVector accel = new PVector();
  private float maxV = 5;
  private float u = 0.1; //friction
  
  Particle(float x, float y) {
    pos.x = x;
    pos.y = y;
  }
  
  void update() {
    int i = (int) (pos.x/w);
    int j = (int) (pos.y/h);
    if(i == 25) i = 24;
    if(j == 25) j = 24;
    accel.x = squares[i][j].x;
    accel.y = squares[i][j].y;
    
    //friction
    //if(vel.x > u)
    //  vel.x -= Math.signum(vel.x)*u;
    //if(vel.y > u)
    //  vel.y -= Math.signum(vel.y)*u;
    
    vel.add(accel);
      
    if(vel.mag() > maxV)
      vel.setMag(maxV);
      
    pos.add(vel);
    
    if(pos.x < 0) pos.x += width;
    if(pos.x > width) pos.x -= width;
    if(pos.y < 0) pos.y += height;
    if(pos.y > height) pos.y -= height;
  }
  
  boolean outOfBounds() {
    return (pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height);
  }
  
  void display() {
    fill(255, 0, 0, 127);
    noStroke();
    ellipse(pos.x, pos.y, 1, 1);
  }
}
