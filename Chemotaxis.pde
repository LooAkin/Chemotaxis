 //creates lists
int xValue[] = new int [100];
int yValue[] = new int [100];
Walker [] colony;

//Sets up size and values
void setup() {
  strokeWeight(1);
  size(1000, 1000);
  colony = new Walker[100];
  for (int i = 0; i < colony.length; i++)
  {
    colony[i] = new Walker(5, -1, -1);
  }
}

//Draws all the witch hat bacteria
void draw() {
  fill(50,50,50);
  rect(0, 0, 1000, 1000);
  for (int i = 0; i < colony.length; i++)
  {
    colony[i].show();
    colony[i].walk(i);
  }
}

//creates class of Walker
class Walker
{
  int myX, myY, r, g, b, value;
  Walker(int value, int x, int y)
  {
    //assigns random and color spot first time, keeps both from then on until dragged
    if (x == -1)
      myX = (int) (Math.random() * 900) + 50;
    else
      myX = x;
    if (y == -1)
      myY = (int) (Math.random() * 900) + 50;
    else 
    myY = y;
    //Defaults to brown, changes to a color based on the value
    r = 181;
    g = 101;
    b = 29;
    if (value == 5)
      value = (int) (Math.random()  * 4);
    if (value == 0) {
      r = 255;
      g = 150;
      b = 0;
    } else if (value == 1) {
      r = 0;
      g = 0;
      b = 0;
    } else if (value == 2) {
      r = 150;
      g = 0;
      b = 150;
    } else if (value == 3) {
      r = 20;
      g = 200;
      b = 20;
    } 
  }
  
  //Draws the witch hat shape
  void show()
  {
    fill(r, g, b);  
    beginShape();
    vertex(myX, myY);
    vertex(myX, myY);
    vertex(myX + 15, myY + 20);
    vertex(myX + 30, myY + 20);
    vertex(myX + 20, myY + 25);
    vertex(myX - 5, myY + 30);
    vertex(myX - 20, myY + 25);
    vertex(myX - 30, myY + 20);
    vertex(myX - 15, myY + 20);
    vertex(myX - 15, myY + 20);
    endShape(); 
    //draws lines out for detail and clarity
    line((float) myX, (float) myY, (float) myX - 15, (float) myY + 20);
    line((float) myX - 15, (float) myY + 20, (float) myX - 5, (float) myY + 25);
    line((float) myX - 5, (float) myY + 25, (float) myX + 15, (float) myY + 20);
  }
  //Chooses random direction to walk unless close to a wall, then biased walk
  void walk(int digit)
  {
    if ((myY < 1000) && (myY > 0)) {
      myY = myY + (int)(Math.random()*9) - 4;
    } else if (myY >= 1000) {
      myY = myY + (int)(Math.random()*9) - 8;
    } else if (myY <=0) {
      myY = myY + (int)(Math.random()*9);
    }
    if ((myX > 0) && (myX < 1000)) {
      myX = myX + (int)(Math.random()*9) - 4;
    } else if (myX >= 1000) {
      myX = myX + (int)(Math.random()*9) - 8;
    } else if (myX <= 0) {
      myX = myX + (int)(Math.random()*9);
    }
    //keeps the new X and Y values, 
    xValue[digit] = myX;
    yValue[digit] = myY;
  }
}


//reshuffles colors when a key is pressed
void keyPressed()
{
  for (int i = 0; i < colony.length; i++)
  {
    colony[i] = new Walker(5, xValue[i], yValue[i]);
  }
}

//starts a bloom of white, at the mouse's position 
void mouseDragged()
{
  for (int i = 0; i < colony.length; i++)
  {
    colony[i] = new Walker(6, mouseX, mouseY);
  }
}
