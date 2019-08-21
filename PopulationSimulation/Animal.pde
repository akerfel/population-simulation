public class Animal {
  float w = 20;
  float h = 20;
  
  float x = 10;
  float y = 10;
  
  float vx = 1;
  float vy = 0;
  float v = 3;
  
  color c;
  
  Animal(float x, float y) {
    setStartvx();
    this.x = x;
    this.y = y;
    fixPos();
    randomizeColor();
  }
  
  void randomizeColor() {
    c = color(random(0, 255), random(0, 255), random(0, 255));
  }
  
  void fixPos() {
    if (y > height - h) {
      y = height - h - 5;
    }
    if (x > width - w) {
      x = height - w - 5;
    }
  }
  
  void setStartvx() {
    vx = random(-3, 3);
  }
  
  void calcvy() {
      if (vx > v) {
        vx = v;  
      }
      if (vy > 0) {
        vy = sqrt(abs(pow(v, 2) - pow(vx, 2)));
      }
      else {
        vy = -sqrt(abs(pow(v, 2) - pow(vx, 2)));
      }
  }

  void update() {
    changevx();
    calcvy();
    x += vx;
    y += vy;
    checkWall();
    rect(x, y, w, h);
  }
  
  void changevx() {
    vx += random(-0.5, 0.5);
  }
  
  void draw() {
    fill(c);
    rect(x, y, w, h);  
  }
  
  void checkWall() {
    if (y < 0) {
      vy *= -1;
      y += 5;
    }
    if (y > height - h) {
      vy *= -1;
      y -= 5;
    }
    if (x < 0) {
      vx *= -1;
      x += 5;
    }
    if (x > width - w) {
      vx *= -1;  
      x -= 5;
    }
  }
  
  void printLocation() {
    println("--------");
    println("x: ", x);
    println("y: ", y);
    println("vx: ", vx);
    println("vy: ", vy);
    float currentv = sqrt(pow(vx, 2) + pow(vy, 2));
    println("currentv: ", currentv);
    println("--------");
  }
}
