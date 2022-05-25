class Dinosaur extends Enemy {

  float speed = 1f;
  float dic = 1; //dic = direction

  final float TRIGGERED_SPEED_MULTIPLIER = 5;

  void update() {
    if (dic == 1) {
      x += speed;
      if (x >= width - SOIL_SIZE) {
        this.dic = -1;
      }
    } else if (dic == -1) {
      x -= speed;
      if (x<=0) {
        this.dic = 1;
      }
    }
  }
  void display() {

    pushMatrix();
    translate(x, y);
    if (dic == 1) {
      scale(1, 1);
      image(dinosaur, 0, 0);
    } else {    
      scale(-1, 1);
      image(dinosaur, -w, 0);
    }
    popMatrix();
  }


  Dinosaur(float x, float y) {
    super(x, y);
    dic = 1;
  }
  void checkCollision(Player player) {
    if (dic == 1) {
      if (this.x < player.x && this.y == player.y) {
        speed = 5+1f;
      } else {
        speed = 1f;
      }
    } else {
      if (this.x > player.x && this.y == player.y) {
        speed = 5+1f;
      } 
      else {
        speed = 1f;
      }
    }

    if (isHit(x, y, w, h, player.x, player.y, player.w, player.h)) {

      player.hurt();
    }
  }
}
