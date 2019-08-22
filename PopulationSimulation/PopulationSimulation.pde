import java.util.Iterator;

ArrayList<Animal> animals = new ArrayList<Animal>();
int numAnimals = 25;
boolean eatAtCollision = true;

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
    for (Animal animal2 : animals) {
      if (animal != animal2 && !toRemove.contains(animal2) && !toRemove.contains(animal)) {
        if (animal.collidingWith(animal2)) {
          if (eatAtCollision) {
            animal.grow(animal2.r/2);
            toRemove.add(animal2);
            break;
          }
          else {
            animal.bounceOffAnimal(animal2);  
          }
        }
      }
    }
    animal.draw();
  }
  animals.removeAll(toRemove);
}
