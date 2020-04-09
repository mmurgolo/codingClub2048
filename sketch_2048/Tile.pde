class Tile {
  int value;
  PVector position;
  PVector pixelPos;//top left
  boolean alreadyIncreased = false;
  boolean moving = false;

  color colour;
  PVector positionTo;
  PVector pixelPosTo;


  boolean deathOnImpact = false;

  Tile(int x, int y) {
    if (random(1)< 0.1) {
      value = 4;
    } else {
      value =2;
    }

    position = new PVector(x, y);
    positionTo = new PVector(x, y);

    pixelPos = new PVector(xoffset +x*200 + (x+1) *10, yoffset + y*200 + (y+1) *10);
    pixelPosTo = new PVector(xoffset + x*200 + (x+1) *10, yoffset + y*200 + (y+1) *10);

    setColour();
  }

  void show() {
    if (!deathOnImpact || moving) {
      fill(colour);
      noStroke();
      rect(pixelPos.x, pixelPos.y, 200, 200);
      if (value < 2048) {
        fill(40);
      } else {
        fill(240);
      }
      textAlign(CENTER, CENTER);
      textSize(50);
      text(value, pixelPos.x+100, pixelPos.y+100);
    }
  }

  void moveTo(PVector to) {
    positionTo = new PVector(to.x, to.y);
    pixelPosTo = new PVector(xoffset +to.x*200 + (to.x+1) *10, yoffset +to.y*200 + (to.y+1) *10);
    moving = true;
  }
  void moveToNow(PVector to) {
    position = new PVector(to.x, to.y);
    pixelPos = new PVector(xoffset +to.x*200 + (to.x+1) *10, yoffset +to.y*200 + (to.y+1) *10);
  }

  void move(int speed) {
    if (moving) {
      if (!teleport && dist(pixelPos.x, pixelPos.y, pixelPosTo.x, pixelPosTo.y) > speed) {
        PVector MoveDirection = new PVector(positionTo.x - position.x, positionTo.y - position.y); 
        MoveDirection.normalize();
        MoveDirection.mult(speed);
        pixelPos.add(MoveDirection);
      } else {
        moving = false;
        pixelPos = new PVector(pixelPosTo.x, pixelPosTo.y);
        position = new PVector(positionTo.x, positionTo.y);
      }
    }
  }
  
  void setColour() {
    if (value == 2) {
      colour = color(255,255,255);
      }
    if (value == 4) {
      colour = color(245,245,220);
      }
    if (value == 8) {
      colour = color(255,245,238);
      }
    if (value == 16) {
      colour = color(255,160,122);
      }
    if (value == 32) {
      colour = color(250,128,114);
      }
    if (value == 64) {
      colour = color(233,150,122);
      }
    if (value == 128) {
      colour = color(240,128,128);
      }
    if (value == 256) {
      colour = color(205,92,92);
      }
    if (value == 512) {
      colour = color(220,20,60);
      }
    if (value == 1028) {
      colour = color(178,34,34);
      }
    if (value == 2048) {
      colour = color(139,0,0);
      }
  }

  Tile clone() {
    Tile clone = new Tile(floor(position.x), floor(position.y));
    clone.value = value;
    clone.setColour();

    return clone;
  }
}
