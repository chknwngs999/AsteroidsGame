class Asteroid extends Floater {
  private int rotatespeed;
  Asteroid (){
    corners = 4;
    xCorners = new int[4];
    yCorners = new int[4];
    int angle = (int)(Math.random()*360);
    for (int i = 0; i < corners; i++){
      angle += (int)(Math.random()*15);
      xCorners[i] = (int)(Math.sin(angle) * (int)(Math.random()*7+15));
      yCorners[i] = (int)(Math.cos(angle) * (int)(Math.random()*7+15));
      // sort it so it doesn't look like a demonic stick
    }
    /*Asteroid (){
    corners = 4;
    xCorners = new int[8];
    yCorners = new int[8];
    float buffer = radians((float)(Math.random()*360));
    for (int i = 0; i < 8; i++){
      buffer += radians((float)(Math.random()*30+15));
      buffer = buffer % 2;
      xCorners[i] = (int)(Math.sin(buffer) * (int)(Math.random()*20+15));
      yCorners[i] = (int)(Math.cos(buffer) * (int)(Math.random()*20+15));
      // sort it so it doesn't look like a demonic stick
    }*/
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    myCenterX = (int)(Math.random()*width);
    myCenterY = (int)(Math.random()*height);
    myXspeed = (int)(Math.random()*11)-5;
    myYspeed = (int)(Math.random()*11)-5;
    myPointDirection = 0;
    rotatespeed = (int)(Math.random()*7+3);
  }
  public void move() {
    //change the x and y coordinates by myXspeed and myYspeed       
    super.move();
    myPointDirection += rotatespeed;
  }
  
  public double getX () {
    return myCenterX;
  }
  public double getY () {
    return myCenterY;
  }
  public void setX (double newX){
    myCenterX = newX;
  }
  public void setY (double newY){
    myCenterY = newY;
  }
}
