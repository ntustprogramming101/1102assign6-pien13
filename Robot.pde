class Robot extends Enemy {

  float speed = 2f;
  float dic = 1; //dic = direction

  final int PLAYER_DETECT_RANGE_ROW = 2;
  final int LASER_COOLDOWN = 180;
  final int HAND_OFFSET_Y = 37;
  final int HAND_OFFSET_X_FORWARD = 64;
  final int HAND_OFFSET_X_BACKWARD = 16;
  
  boolean checkX;
  boolean checkY;

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
      image(robot, 0, 0);
    } else {    
      scale(-1, 1);
      image(robot, -w, 0);
    }
    popMatrix();
  }

  Robot (float x, float y) {
    super(x, y);
    dic = 1;
  }

  void checkCollision(Player player) {
    if (dic == 1) {
      if (this.x > player.x && (player.y - this.y) <= PLAYER_DETECT_RANGE_ROW*h) {
        speed = 2f;
      } else {
        speed = 2f;
      }
    }
  }
}


// HINT: Player Detection in update()
/*

 	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
 					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )
 
 	boolean checkY = player is less than (or equal to) 2 rows higher or lower than me
 
 	if(checkX AND checkY){
 		Is laser's cooldown ready?
 			True  > Fire laser from my hand!
 			False > Don't do anything
 	}else{
 		Keep moving!
 	}
 
 	*/
