ArrayList<Animal> animals = new ArrayList<Animal>();

void setup() {
  size(600, 400);
  makeAnimals();
}

void makeAnimals() {
  for (int i = 0; i < 1000; i++) {
    float startx = random(0, width);
    float starty = random(0, height);
    animals.add(new Animal(startx, starty));
  }
}

void draw() {
  clear();
  for (Animal animal : animals) {
    animal.update();
    animal.draw();
  }
}
