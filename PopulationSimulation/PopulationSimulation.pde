import java.util.Iterator;

ArrayList<Animal> animals = new ArrayList<Animal>();
int numAnimals = 15;
boolean eatAtCollision = true;
boolean colorAlliance = true;    // if true: balls of same color will not eat each other
int clans = 2;                  // number of clans (relating to colorAlliance)
ArrayList<Integer> clanColors = new ArrayList<Integer>();       // List of clan colors

void setup() {
  size(600, 900);
  println(clans);
  makeClanColors();
  makeAnimals();
}

void makeClanColors() {
  println(clans);
  for (int i = 0; i < clans; i++) {
    clanColors.add(color(random(0, 255), random(0, 255), random(0, 255)));
    print("ey");
  }
}

void makeAnimals() {
  for (int i = 0; i < numAnimals; i++) {
    float startx = random(0, width);
    float starty = random(0, height);
    animals.add(new Animal(startx, starty));
  }
}

void draw() {
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
    a.draw();
  }
  animals.removeAll(toRemove);
}

// The biggest animal grows. The smallest animal is returned.
Animal animalSizeFight(Animal a, Animal b) {
  if (a.biggerThan(b)) {
    a.grow(b.r/4);
    return b;
  }
  else {
    b.grow(a.r/4);
    return a;
  }
}
