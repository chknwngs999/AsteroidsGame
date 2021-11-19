Spaceship bob;
Star [] shiny;

boolean accelerate = false;
boolean decelerate = false;
boolean leftturn = false;
boolean rightturn = false;
boolean braking = false;

public void setup() 
{
  size(500, 500);
  bob = new Spaceship();
  shiny = new Star[200];
  for (int i = 0; i < shiny.length; i++){
    shiny[i] = new Star();
  }
}
