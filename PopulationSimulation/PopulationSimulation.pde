import java.util.Iterator;

ArrayList<Animal> animals = new ArrayList<Animal>();
int numAnimals = 10;
boolean eatAtCollision = false;

void setup() {
  size(400, 600);
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
  
  for (Animal animal : animals) {
    for (Animal animal2 : animals) {
      if (animal.collidingWith(animal2) && animal != animal2) {
        if (eatAtCollision) {
          toRemove.add(animalSizeFight(animal, animal2));
        }
        else {
          animal.bounceOffAnimal(animal2);  
        }
      }
    }
    animal.draw();
  }
  animals.removeAll(toRemove);
}

// if a is bigger than b, then a grows and b is returned. And vice versa.
Animal animalSizeFight(Animal a, Animal b) {
  if (a.r >= b.r) {
    a.grow(b.r/4);
    return b;
  }
  else {
    b.grow(a.r/4);
    return a;
  }
}
