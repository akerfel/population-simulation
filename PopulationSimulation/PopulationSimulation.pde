float w = 10;
float h = 10;

float x = 10;
float y = 10;

float vx = 1;
float vy = 0;
float v = 3;

void setup() {
  size(600, 400);
}

void draw() {
  changevx();
  calcvy();
  x += vx;
  y += vy;
  checkWall();
  rect(x, y, w, h);
  printLocation();
}

void checkWall() {
  if (y < 0 || y > height) {
    vy *= -1;  
  }
  if (x < 0 || x > width) {
    vx *= -1;  
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

void changevx() {
  vx += random(-0.5, 0.5);
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
