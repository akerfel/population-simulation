import java.util.Iterator;

// Some settings variables to experiment with
int numAnimals = 100;
boolean automaticRestart = true;
boolean eatAtCollision = true;
boolean colorAlliance = true;    // if true: balls of same color will not eat each other
int clans = 2;                  // number of clans (relating to colorAlliance)
int timeToRestart = 180;

// Other
ArrayList<Animal> animals = new ArrayList<Animal>();
ArrayList<Integer> clanColors = new ArrayList<Integer>();       // List of clan colors
boolean restartTimerActive;
int restartTimer;
boolean paused ;

void setup() {
  size(600, 900);
  restartTimer = 0;
  paused = false;
  
  makeClanColors();
  makeAnimals();
}

void makeClanColors() {
  for (int i = 0; i < clans; i++) {
    clanColors.add(color(random(0, 255), random(0, 255), random(0, 255)));
  }
}

void makeAnimals() {
  for (int i = 0; i < numAnimals; i++) {
    float startx = random(0, width);
    float starty = random(0, height);
    animals.add(new Animal(startx, starty));
  }
}

void keyPressed() {
  paused = !paused;
}

void draw() {
  if (!paused) {
    clear();
    ArrayList<Animal> toRemove = new ArrayList<Animal>();
    for (Animal animal : animals) {
      animal.update();  
    }
    
    for (Animal a : animals) {
      for (Animal b : animals) {
        if (a.collidingWith(b) && a != b) {
          if (eatAtCollision) {
            if (colorAlliance) {
              if (a.c != b.c) {  
                toRemove.add(animalSizeFight(a, b));
              }
              else {
                a.bounceOffAnimal(b);  
              }
            }
            else {
              toRemove.add(animalSizeFight(a, b));
            }
          }
          else {
            a.bounceOffAnimal(b);  
          }
        }
      }
    }
    
    animals.removeAll(toRemove);
    
    for (Animal animal : animals) {
      animal.draw();  
    }
    
    if (oneClanLeft() && restartTimer == 0 && automaticRestart && colorAlliance) {
      startRestartTimer();
    }
    
    if (restartTimer > 0) {
        restartTimer--;
        textSize(32);
        textAlign(CENTER, CENTER);
        fill(color(255, 255, 255));
        text("Restart in " + (restartTimer/60 + 1), width/2, height/2);
        if (restartTimer == 0) {
          restart();
        }
    }
  }
}

void startRestartTimer() {
  restartTimer = timeToRestart;
}

void restart() {
  clearLists();
  setup();
}


void clearLists() {
  clanColors.clear();
  animals.clear();
}

boolean oneClanLeft() {
  int colorOfSomeAnimal = animals.get(0).c;
  for (Animal animal : animals) {
    if (animal.c != colorOfSomeAnimal) {
      return false;  
    }
  }
  return true;
}

// The biggest animal grows. The smallest animal is returned.
Animal animalSizeFight(Animal a, Animal b) {
  if (a.biggerThan(b)) {
    a.grow(b.r/8);
    return b;
  }
  else {
    b.grow(a.r/8);
    return a;
  }
}
