
class CA {

  Vec3D loc;
  int x;
  int y;
  int z;

  float a = random(1, 250);
  float b = random(1, 250);
  float c = random(1, 250);

  int A = 2;
  int B = (A + 1);

  int type = 0;
  int futType = 0;

  CA(Vec3D _loc, int _x, int _y, int _z) {

    loc = _loc;
    x = _x;
    y = _y;
    z = _z;

    float rnd = random(100);
    if (rnd < 50) {
      type = 1;
    }
  }

  void run() {
    display();
    evalN();
  }

  void updateType() {
    type = futType;
  }

  void evalN() {

    int count = 0;

    if (grid[(x+cols-1)%cols][(y+rows-1)%rows][(z+rows2-1)%rows2].type == 1) count ++;
    if (grid[(x+cols-1)%cols][(y+rows+1)%rows][(z+rows2-1)%rows2].type == 1) count ++;
    if (grid[(x+cols-1)%cols][(y+rows+1)%rows][(z+rows2+1)%rows2].type == 1) count ++;
    if (grid[(x+cols-1)%cols][(y+rows-1)%rows][(z+rows2+1)%rows2].type == 1) count ++;
    if (grid[(x+cols-1)%cols][(y+rows+1)%rows][(z+rows2)%rows2].type == 1) count ++;
    if (grid[(x+cols-1)%cols][(y+rows)%rows][(z+rows2-1)%rows2].type == 1) count ++;
    if (grid[(x+cols)%cols][(y+rows-1)%rows][(z+rows2-1)%rows2].type == 1) count ++;
    if (grid[(x+cols)%cols][(y+rows+1)%rows][(z+rows2-1)%rows2].type == 1) count ++;
    if (grid[(x+cols+1)%cols][(y+rows)%rows][(z+rows2-1)%rows2].type == 1) count ++;
    if (grid[(x+cols+1)%cols][(y+rows+1)%rows][(z+rows2)%rows2].type == 1) count ++;
    if (grid[(x+cols+1)%cols][(y+rows-1)%rows][(z+rows2-1)%rows2].type == 1) count ++;
    if (grid[(x+cols+1)%cols][(y+rows+1)%rows][(z+rows2-1)%rows2].type == 1) count ++;
    if (grid[(x+cols+1)%cols][(y+rows-1)%rows][(z+rows2+1)%rows2].type == 1) count ++;
    if (grid[(x+cols+1)%cols][(y+rows+1)%rows][(z+rows2+1)%rows2].type == 1) count ++;

    if (type == 1 && count < A) {
      futType = 0;
    }

    if (type == 1 && count <= B && count>=A) {
      futType = 1;
    }

    if (type == 1 && count > B) {
      futType = 0;
    }

    if (type == 0 && count == B) {
      futType = 1;
    }
  }

  void display() {
    if (type == 1) {
      stroke(a, b, c);
      strokeWeight(3);
      point(loc.x, loc.y, loc.z);
    }
  }
}
