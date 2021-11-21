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
  public void brake () {
    
    if (myXspeed > 0){
      if (myXspeed > 15){
        myXspeed *= 0.75;
      } else if (myXspeed > 5){
        myXspeed *= 0.85;
      } else {
        myXspeed = 0;
      }
    } else {
      if (myXspeed < -15){
        myXspeed *= 0.75;
      } else if (myXspeed < -5){
        myXspeed *= 0.85;
      } else {
        myXspeed = 0;
      }
    }
   if (myYspeed > 0){
      if (myYspeed > 15){
        myYspeed *= 0.75;
      } else if (myYspeed > 5){
        myYspeed *= 0.85;
      } else {
        myYspeed = 0;
      }
   } else {
     if (myYspeed < -15){
        myYspeed *= 0.75;
      } else if (myYspeed < -5){
        myYspeed *= 0.85;
      } else {
        myYspeed = 0;
      }
   }
  }
  public void hyperspace(){
    myXspeed = 0;
    myYspeed = 0;
    myCenterX = (int)(Math.random()*width);
    myCenterY = (int)(Math.random()*height);
    myPointDirection = (int)(Math.random()*360);
  }
}
