import gab.opencv.*;
import processing.video.*;
import java.awt.*;
Capture facecam;
OpenCV ocv;

void setup() {
  size(640, 480, P3D);
  facecam = new Capture(this, 640, 480);
  ocv = new OpenCV(this, 640, 480);
  ocv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  facecam.start();
  
}

void draw() {
   clear();
   background(255);
  ocv.loadImage(facecam);

  //image(facecam, 0, 0 );


  Rectangle[] myface = ocv.detect();
  println(myface.length);


  for (int i = 0; i < myface.length; i++) {
    println(myface[i].x + "," + myface[i].y);
    camera(-(myface[i].x-width/2+myface[i].width/2), myface[i].y-height/2 + myface[i].width/2, 350, 0, 0, 0, 0, 1, 0);
    //camera(mouseX-width/2, mouseY-height/2, 350, 0, 0, 0, 0, 1, 0);
  }
  fill(#ff1323,77);
  strokeWeight(5);
  box(123,123,123);
 
}

void captureEvent(Capture c) {
  c.read();
}