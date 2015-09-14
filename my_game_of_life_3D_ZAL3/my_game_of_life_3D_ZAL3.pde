import peasy.*;
import toxi.geom.*;

PeasyCam cam;

int n = 33;
int cols = n;
int rows = n;
int rows2 = n;

float x;
float y;
float zoom = -50;
float angle = 0.5;

CA grid[][][] = new CA[cols][rows][rows2];

void setup() {
  size(800, 800, P3D);
  x = width/2;
  y = height/2;

  cam = new PeasyCam(this, 100);

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      for (int k = 0; k < rows2; k++) {

        Vec3D ptLoc = new Vec3D(i * 10, j * 10, k* 10);
        grid[i][j][k] = new CA(ptLoc, i, j, k);
      }
    }
  }

}

void draw() {
  background(0);
  smooth();
  lights();

  pushMatrix();
  // translate(-500, -500, -500);
  // scale(zoom);
  // rotate (angle);
  rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.01);
  popMatrix();

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      for (int k = 0; k < rows2; k++) {
        grid[i][j][k].run();
      }
    }
  }

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      for (int k = 0; k < rows2; k++) {
        grid[i][j][k].updateType();
      }
    }
  }
}

