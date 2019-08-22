import java.util.Iterator;

ArrayList<Animal> animals = new ArrayList<Animal>();
int numAnimals = 100;
boolean eatAtCollision = true;

void setup() {
  size(600, 900);
  makeAnimals();
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
          toRemove.add(animalSizeFight(a, b));
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
