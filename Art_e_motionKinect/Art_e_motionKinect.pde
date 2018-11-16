//1: import libraries:: -> sketch ->Import Library
import org.openkinect.processing.*;
//2: make a variable to to hold the SimpleOpenNI object (to be able to access data from the kinect)
Kinect kinect;
PImage result;
//3: declare PImage variable to hold and display the pixel data from the kinect
 
//3:: setup
void setup()
{
 
  // make the sketch size a that of kinect sample
  size(640, 480);
  // set a background color
  kinect = new Kinect(this);
  kinect.initDepth();
  result = createImage(width,height,RGB);
}
 
//4: our drawing loop
void draw()
{
  //reset the background
  background(0);
  // get the next frame from the kinect
  // get the depth image and assign to the PImage var (using the lib)
  int[] depth = kinect.getRawDepth(); 
  // get the depthMap (mm) values
 
  // load the pixel array of the result image 
 
 for (int x = 0; x < kinect.width; x++) {
    for (int y = 0; y < kinect.height; y++) {
      int offset = x + y * kinect.width;
      int d = depth[offset];
      // print(d, " this:");
      if (d > 600 && d < 750) {
        //print(d, "\n");
         result.pixels[offset] = color(255, 150, 244);
      } else {
          result.pixels[offset] = color(0);
      }
    }
  }
  //go through the matrix - for each row go through every column
  // update
  result.updatePixels();
  //display the result
  image(result, 0, 0);
}
