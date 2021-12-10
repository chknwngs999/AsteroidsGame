class Spaceship extends Floater  
{   
  Spaceship() {
    corners = 8;
    xCorners = new int[]{16, 0, 0, -10, -4, -10, 0, 0};
    yCorners = new int[]{0, 7, 4, 10, 0, -10, -4, -7};
    myColor = color(255, 0, 0);
    myCenterX = width/2;
    myCenterY = height/2;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }
  Spaceship(int centerX, int centerY) {
    corners = 8;
    xCorners = new int[]{16, 0, 0, -10, -4, -10, 0, 0};
    yCorners = new int[]{0, 7, 4, 10, 0, -10, -4, -7};
    myColor = color(255, 0, 0);
    myCenterX = centerX;
    myCenterY = centerY;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }
  public void hyperspace(int centerX, int centerY, int newPoint){
    myXspeed = 0;
    myYspeed = 0;
    myCenterX = centerX;
    myCenterY = centerY;
    myPointDirection = newPoint;
  }
  public double getX(){
    return myCenterX;
  }
  public double getY(){
    return myCenterY;
  }
  public double getXspeed(){
    return myXspeed;
  }
  public double getYspeed(){
    return myYspeed;
  }
  public double getPointDirection(){
    return myPointDirection;
  }
}
