class FlowField {

  // A flow field is a two-dimensional array of PVectors.
  PVector[][] field;
  int cols, rows;
  int resolution;

  FlowField(int r) {
    resolution = r;
    //[full] Determine the number of columns and rows.
    cols = width/resolution;
    rows = height/resolution;
    println("Rows, Cols" + rows + " " + cols);
    //[end]
    field = new PVector[cols][rows];
    init();
  }

  void init() {
    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        //[offset-up] In this example, we use Perlin noise to seed the vectors.
        float theta = map(noise(xoff, yoff), 0, 1, 0, TWO_PI);
        println("Theta: " +  theta);
        //[offset-down] Polar to Cartesian coordinate transformation to get x and y components of the vector
        field[i][j] = new PVector(cos(theta) * 10, sin(theta) * 10);
        yoff += 0.1;
      }
      xoff += 0.1;
    }
  }

  //[full] A function to return a PVector based on a location
  PVector lookup(PVector lookup) {

    int column = int(constrain(lookup.x, 0, cols-1));
    int row = int(constrain(lookup.y, 0, rows-1));
    return field[column][row].copy();
 
  }
  //[end]
}