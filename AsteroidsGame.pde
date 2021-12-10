Star [] shiny;
ArrayList <Spaceship> fleet;
ArrayList <Asteroid> asteroids;
ArrayList <Bullet> shots;

int points = 0;
int bullets = 10;
int reloadticks = 0;
int waves = 0;
int ships = 0;

boolean accelerate = false;
boolean decelerate = false;
boolean leftturn = false;
boolean rightturn = false;
boolean braking = false;

public void setup()     
{
  size(900, 900);
  shiny = new Star[200];
  for (int i = 0; i < shiny.length; i++) {
    shiny[i] = new Star();
  }
  fleet = new ArrayList <Spaceship>();
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      fleet.add(new Spaceship(width/2 + 50*(i-1), height/2 + 50*(j-1)));
    }
  }
  asteroids = new ArrayList <Asteroid>();
  for (int i = 0; i < 15; i++) {
    asteroids.add(new Asteroid());
  }
  shots = new ArrayList <Bullet>();
  textSize(20);
}

public void draw() 
{
  if (reloadticks != 0) {
    reloadticks--;
  }
  background(0);
  for (int i = 0; i < shiny.length; i++) {
    shiny[i].show();
  }
  if (accelerate) {
    for (int i = 0; i < fleet.size(); i++) {
      fleet.get(i).accelerate(0.1);
    }
  }
  if (decelerate) {
    for (int i = 0; i < fleet.size(); i++) {
      fleet.get(i).accelerate(-0.1);
    }
  }
  if (leftturn) {
    for (int i = 0; i < fleet.size(); i++) {
      fleet.get(i).turn(-3);
    }
  }
  if (rightturn) {
    for (int i = 0; i < fleet.size(); i++) {
      fleet.get(i).turn(3);
    }
  }

  for (int i = fleet.size()-1; i >= 0; i--) {
    if (fleet.size() == 0) {
      break;
    }
    fleet.get(i).move() ;
    fleet.get(i).show();
    for (int j = asteroids.size()-1; j >= 0; j--) {
      float d = dist((float)fleet.get(i).getX(), (float)fleet.get(i).getY(), (float)asteroids.get(j).getX(), (float)asteroids.get(j).getY());
      if (d < 20) {
        //error when 0 ships?
        asteroids.remove(j);
        fleet.remove(i);
        asteroids.add(new Asteroid());
        points--;
        ships++;
        break;
      }
    }
  }
  if (fleet.size() == 0) {
    points -= 3;
    for (int a = 0; a < 3; a++) {
      for (int b = 0; b < 3; b++) {
        fleet.add(new Spaceship(width/2 + 50*(a-1), height/2 + 50*(b-1)));
      }
    }
  }
  for (int i = shots.size()-1; i >= 0; i--) {
    Bullet currentbullet = shots.get(i);
    if (currentbullet.getX() == width || currentbullet.getX() == 0 || currentbullet.getY() == height || currentbullet.getY() == 0) {
      shots.remove(i);
    } else {
      currentbullet.move();
      currentbullet.show();
    }
    for (int j = asteroids.size()-1; j >= 0; j--) {
      float d = dist((float)currentbullet.getX(), (float)currentbullet    .getY(), (float)asteroids.get(j).getX(), (float)asteroids.get(j).getY());
      if (d < 20) {
        asteroids.remove(j);
        shots.remove(i);     
        points++;
        break;
      }
    }
  }
  //arraylist trap?
  if (asteroids.size() == 0) {
    waves++;
    points += 3;
    for (int i = 0; i < 15; i++) {
      asteroids.add(new Asteroid());
    }
  } else {
    for (int i = asteroids.size()-1; i >= 0; i--) {
      asteroids.get(i).show();    
      asteroids.get(i).move();
    }
  }
  fill(255);
  text("Points: " + points, 25, 25);
  text(reloadticks + " until " + bullets + " can be fired", 25, 50);
  text("Asteroids until next wave: " + asteroids.size(), 275, 25);
  text("Ships in fleet: " + fleet.size(), 275, 50);
  text("Waves destroyed: " + waves, 575, 25);
  text("Ships destroyed: " + ships, 575, 50);
  
}

public void keyPressed()
{
  if (keyCode == LEFT || key == 'a') {
    leftturn = true;
  }
  if (keyCode == RIGHT || key == 'd') {
    rightturn = true;
  }
  if (keyCode == UP || key == 'w') {
    accelerate = true;
  }
  if (keyCode == DOWN || key == 's') {
    decelerate = true;
  }
}
public void keyReleased()
{
  if (keyCode == LEFT || key == 'a') {
    leftturn = false;
  } 
  if (keyCode == RIGHT || key == 'd') {
    rightturn = false;
  }
  if (keyCode == UP || key == 'w') {
    accelerate = false;
  } 
  if (keyCode == DOWN || key == 's') {
    decelerate = false;
  }
  if (keyCode == 32) {
    if (bullets > 0 && reloadticks == 0) {
      for (int i = 0; i < fleet.size(); i++) {
        shots.add(new Bullet(fleet.get(i)));
      }
      bullets -= 1;
    }
    if (bullets == 0) {
      bullets = 10;
      reloadticks = 250;
    }
  }
  if (key == 'r' || key == 'R'){
    reloadticks = 25*(10-bullets);
    bullets = 10;
  }
  if (keyCode == SHIFT) {
    //bob.hyperspace();
    int hyperX = (int)(Math.random()*width);
    int hyperY = (int)(Math.random()*height);
    int newPoint = (int)(Math.random()*360);
    for (int i = 0; i < fleet.size(); i++) {
      if (i < 3)
        fleet.get(i).hyperspace(hyperX + 50*(i%3-1), hyperY - 50, newPoint);
      else if (i < 6)
        fleet.get(i).hyperspace(hyperX + 50*(i%3-1), hyperY, newPoint); 
      else
        fleet.get(i).hyperspace(hyperX + 50*(i%3-1), hyperY + 50, newPoint);
    }
  }
}
