final int NUMBER_OF_VERTEX = 6;
final float R = 200;
final float DOT_R = 10;

void setup() {
  size(1000, 600);
  noFill();
  stroke(20, 180, 20);
  strokeWeight(5);
}

void draw() {
  background(255);
  
  // A normal polygon

  translate(50 + R, 100 + R);

  beginShape();
  for (int i = 0; i <= 360; i += 360 / NUMBER_OF_VERTEX) {
    vertex(cos(radians(i)) * R, sin(radians(i)) * R);
  }
  endShape();

  // A polygon with dots

  translate(R * 2 + 100, 0);

  float lastDotX = 0;
  float lastDotY = 0;
  
  for (int i = 0; i < NUMBER_OF_VERTEX; i++) {
    float radian = radians(i * (360 / NUMBER_OF_VERTEX));
    float nextRadian = radians((i + 1) * (360 / NUMBER_OF_VERTEX));
    PVector vertex = new PVector(cos(radian) * R, sin(radian) * R);
    PVector nextVertex = new PVector(cos(nextRadian) * R, sin(nextRadian) * R);

    for (int j = 0; j < 360 / NUMBER_OF_VERTEX; j++) {
      float x = (nextVertex.x - vertex.x) / (360 / NUMBER_OF_VERTEX) * j + vertex.x;
      float y = (nextVertex.y - vertex.y) / (360 / NUMBER_OF_VERTEX) * j + vertex.y;

      if (j == 0 || Math.pow(x - lastDotX, 2) + Math.pow(y - lastDotY, 2) >= Math.pow(DOT_R * 2, 2)) { // Using pythagorean theorem to put dots without any overlaps
        ellipse(x, y, DOT_R * 2, DOT_R * 2);
        lastDotX = x;
        lastDotY = y;
      }
    }
  }
}
