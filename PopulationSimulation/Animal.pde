public class Animal {
  public float r = 20;  // radius
  
  public float x = 10;
  public float y = 10;
  
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
  
  void checkAnimalCollision(Animal animal) {
    //float distance = dist(this.x, this.y, animal.x, animal.y);
    float distance = dist(this.x, this.y, animal.x, animal.y);
    if (distance <= this.r + animal.r) {
      vx *= -1;
      vy *= -1;
    }
    
    println("----------");
    println("thisx: ", this.x);
    println("thisy: ", this.y);
    println("animalx: ", animal.x);
    println("animaly: ", animal.y);
    println("distance: ", distance);
    println("thisr: ", this.r);
    println("animalr: ", animal.r);
    println("----------");
  }
  
  void randomizeColor() {
    c = color(random(0, 255), random(0, 255), random(0, 255));
  }
  
  void fixPos() {
    if (y > height - r) {
      y = height - r - 5;
    }
    if (x > width - r) {
      x = height - r - 5;
    }
  }
  
  void setStartvx() {
    vx = random(-3, 3);
  }
  
  void calcvy() {
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
    limitvx();
    limitvy();
    x += vx;
    y += vy;
    checkWall();
  }
  
  void limitvx() {
    if (vx > v) {
        vx = v;  
      }
    else if (vx < -v) {
      vx = -v;  
    }
  }
  
  void limitvy() {
    if (vy > v) {
        vy = v;  
      }
    else if (vy < -v) {
      vy = -v;  
    }
  }
  
  void changevx() {
    vx += random(-0.5, 0.5);
  }
  
  void draw() {
    fill(c);
    circle(x, y, r * 2);  
  }
  
  void checkWall() {
    if (y < r) {
      vy *= -1;
      y += 5;
    }
    if (y > height - r) {
      vy *= -1;
      y -= 5;
    }
    if (x < r) {
      vx *= -1;
      x += 5;
    }
    if (x > width - r) {
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
