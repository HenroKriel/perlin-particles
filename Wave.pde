PVector[][] squares = new PVector[25][25];
ArrayList<Particle> particles = new ArrayList<Particle>();
float w, h;
float inc = 0.01;
float zoff = 0;

void setup() {
  size(2000, 2000);
  strokeWeight(6);
  w = width/squares.length;
  h = height/squares[0].length;
  
  int size = 500;
  for(int i = 0; i < size; i++) {
    particles.add(new Particle(random(width/2 - w, width/2 + w), random(height/2 - h, height/2 + h)));
  }
  
  background(0);
}

void draw() {
  //background(0);
  
  float xoff = 0;
  float yoff = 0;
  for(int i = 0; i < squares.length; i++) {
    for(int j = 0; j < squares[0].length; j++) {
      squares[i][j] = PVector.fromAngle(noise(xoff, yoff, zoff)*TWO_PI*16);
      squares[i][j].setMag(0.3);
      xoff += inc;
      //drawVector(i, j);
    }
    yoff += inc;
  }
  zoff += 0.001;
      
  //if(mousePressed) {
  //    particles.add(new Particle(mouseX + random(-25, 25), mouseY + random(-25, 25)));
  //}
      
  for(int i = 0; i < particles.size(); i ++) {
    Particle p = particles.get(i);
    if(p.outOfBounds()) {
      particles.remove(i);
      i--;
    } else {
      p.update();
      p.display();
    }
  }
}

void keyPressed() {
  if(key == ENTER) {
    saveFrame("output####.png");
    println("saved");
  }
}

void drawVector(int i, int j) {
  pushMatrix();
  translate(w*(i+0.5), h*(j+0.5));
  rotate(squares[i][j].heading());
  stroke(0, 0, 255);
  line(-w/2, 0, 0, 0);
  stroke(255, 0, 0);
  line(0, 0, w/2, 0);
  popMatrix();
}
