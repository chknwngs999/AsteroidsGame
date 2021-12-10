class Bullet extends Floater{
  public Bullet(Spaceship theship){
    corners = 0;
    xCorners = new int[0];
    yCorners = new int[0];
    myCenterX = theship.getX();
    myCenterY = theship.getY();
    myXspeed = theship.getXspeed();
    myYspeed = theship.getYspeed();
    myPointDirection = theship.getPointDirection();
    myColor = color(255);
    accelerate(1.5);
  }
  public void show(){
    fill(myColor);
    stroke(myColor);
    ellipse((float)myCenterX, (float)myCenterY, 10, 10);
  }
  public double getX(){
    return myCenterX;
  }
  public double getY(){
    return myCenterY;
  }
}
