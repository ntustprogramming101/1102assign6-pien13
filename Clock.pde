class Clock extends Item {

  Clock(float x, float y) {
    super(x, y);
  }
  void display() {
    if (isAlive == true) {
      image(clock, this.x, this.y);
    }
  }
  void checkCollision(Player player) {
    if (isAlive == true) {
      if (isHit(this.x, this.y, SOIL_SIZE, SOIL_SIZE, player.x, player.y, player.w, player.h)) {
        addTime(CLOCK_BONUS_SECONDS);
        isAlive = false;
      }
    }
  }
}
