ArrayList<Animal> animals = new ArrayList<Animal>();
int numAnimals = 15;

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
  for (Animal animal : animals) {
    animal.update();
    for (Animal animal2: animals) {
      if (animal != animal2) {
        animal.checkAnimalCollision(animal2);
      }
    }
    animal.draw();
  }
}
