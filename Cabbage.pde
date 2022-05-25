class Cabbage extends Item {

  Cabbage(float x, float y) {
    super(x, y);
  }
  void display() {
    if (isAlive == true) {
      image(cabbage, this.x, this.y);
    }
  }
  void checkCollision(Player player) {
    if (isAlive == true) {
      if (player.health < player.PLAYER_MAX_HEALTH&& isHit(this.x, this.y, SOIL_SIZE, SOIL_SIZE, player.x, player.y, player.w, player.h)){
        player.health ++ ;
        isAlive = false;
      }
    }
  }
}
