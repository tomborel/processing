void setup() {
  background(255);
  size(400, 400);
}

FlowField flowfield = new FlowField(1);
int numVehicles = 100;
public ArrayList<Vehicle> vehicles = createVehicles(width, height);
void draw() {

  for (int i = 0; i < vehicles.size(); i ++) {
    Vehicle vehicle = vehicles.get(i);
    vehicle.update();
    vehicle.follow(flowfield);
    vehicle.display();
  }
}

ArrayList<Vehicle> createVehicles(int w, int h) {
  ArrayList<Vehicle> vehicles = new ArrayList();
  for (int i = 0; i < numVehicles; i ++) {
    float randX = random(w);
    float randY = random(h);
    println("width, heihgt " + width + "/" + height + " " + randX + ", " + randY);
    vehicles.add(new Vehicle(randX, randY));
  }
  return vehicles;
}