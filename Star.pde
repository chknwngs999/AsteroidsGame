class Star //note that this class does NOT extend Floater
{
  protected int myX, myY;
  protected color filler;
  Star ()
  {
    myX = (int)(Math.random()*width);
    myY = (int)(Math.random()*height);
    filler = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
  public void show()
  {
    fill(filler);
    noStroke();
    ellipse(myX, myY, 3, 3);
  }
}
