// forum.processing.org/two/discussion/6256/
// classnotfoundexception-when-extending-papplet
 
// forum.processing.org/two/discussion/6822/
// mousepressed-from-another-frame
 
// forum.processing.org/two/discussion/7036/multiple-screens
import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;
//magic voudou thing, basically it scan the name of class and run them as application.
//its called reflection
static final void main(final String[] args) {
  final String sketch = Thread.currentThread()
    .getStackTrace()[1].getClassName();
 
  final Class[] nested;
  try {
    nested = Class.forName(sketch).getClasses();
  }
  catch (final ClassNotFoundException cause) {
    throw new RuntimeException(cause);
  }
 
  println(nested);
  
  for (int i = 0, ii = max(0, nested.length);i != ii; ++i)  try {

    PApplet.main(nested[i].getName(), args);
  }
  catch (final Exception cause) {
    println(nested[i] + " isn't a PApplet or isn't public static!");
  }
}
 //Here write the code that work for the 3D. You can call other class as usual
public static final class View3D extends PApplet {
  PeasyCam cam;
  void setup() {
    //size(300, 200, OPENGL);
    cam = new PeasyCam(this, width/2-120, height/2, 0, 1000);
    //noLoop();
    println("OK!");
  }
  public void settings(){
    size(300,200,"processing.opengl.PGraphics3D");
  }
 
  void draw() {
    pushMatrix();
  background(0);
  stroke(128);
  translate(610,500,200);
  rotateY(0.5);
  box(40,20,50);
  popMatrix();
  }
}
 //Here write the code as a different application in 2D
public static final class View2D extends PApplet {
   public void settings(){
    size(300,200,"processing.awt.PGraphicsJava2D");
  }
  void setup() {
    noLoop();
    println("Frame!");
  }
 
  void draw() {
    background(0);
    rect(130,80,170,120);
  }
}