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

public void draw() 
{
  background(0);
  for (int i = 0; i < shiny.length; i++){
    shiny[i].show();
  }
  if (accelerate)
    bob.accelerate(0.1);
  if (decelerate)
    bob.accelerate(-0.1);
  if (leftturn)
    bob.turn(-3);
  if (rightturn)
    bob.turn(3);
  if (braking)
    bob.brake();
  bob.move();
  bob.show();
}

public void keyPressed()
{
  if (keyCode == LEFT){
    leftturn = true;
  }
  if (keyCode == RIGHT){
    rightturn = true;
  }
  if (keyCode == UP){
    accelerate = true;
  }
  if (keyCode == DOWN){
    decelerate = true;
  }
  if (keyCode == 32){
    braking = true;
  }
}
public void keyReleased()
{
  if (keyCode == LEFT){
    leftturn = false;
  }
  else if (keyCode == RIGHT){
    rightturn = false;
  }
  if (keyCode == UP){
    accelerate = false;
  }
  else if (keyCode == DOWN){
    decelerate = false;
  }
  if (keyCode == 32){
    braking = false;
  }
  if (keyCode == SHIFT){
    bob.hyperspace();
  }
}
