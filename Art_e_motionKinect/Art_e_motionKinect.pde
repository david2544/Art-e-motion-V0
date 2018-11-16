import org.openkinect.processing.*;

Kinect kinect;
PImage result;

int k = 0; 
int totalPixels = 0;

void setup()
{
  size(640, 480);
  kinect = new Kinect(this);
  kinect.enableMirror(true);
  kinect.initDepth();
  result = createImage(width,height,RGB);
}

void draw()
{
  background(0);
  totalPixels = 0;
  int[] depth = kinect.getRawDepth();  
 
 for (int x = 0; x < kinect.width; x++) {
    for (int y = 0; y < kinect.height; y++) {
      int offset = x + y * kinect.width;
      int d = depth[offset];
      //Check if the current pixel is between the threshold values
      if (d > 600 && d < 725) {
        // Hold in a variable the amount of pixels that are within the threshold
        totalPixels++;
        // If more than 100 pixels are withing the threshold, color them
        if(totalPixels > 100) {
          result.pixels[offset] = color(255, 150, 244);
          // Print how many times there were more than 100 pixels within the threshold
          print(k + 1, "\n");
          k = k + 1;
        }
      } else {
         result.pixels[offset] = color(0);
      }
    }
  }
  result.updatePixels();
  image(result, 0, 0);
}
