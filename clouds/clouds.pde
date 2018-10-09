// Daniel Shiffman
// The Nature of Code
// http://natureofcode.com

float increment = 0.02;

void setup() {
  size(1080,270);
  //noLoop();
  
  fill(60,123,236);
  rect (0,0, width/4, height);  
  rect (width/4, 0, width/2, height);
  rect (3*(width/4) , 0, width, height);
  
 frameRate(25);

}

void draw() {
  
  // Optional: adjust noise detail here
   //noiseDetail(3,0.65f);


  drawClouds(width/4, 0, width/2, height, random(0.01), false);
  delay(250);


  //drawClouds(width/4, 0, width/2, height, random(0.01, 0.05), false);
  //delay(800);
  drawClouds(width/2, 0, 3*(width/4), height,  random (0.01), true);
  delay(250);

}


void drawClouds(int initX, int initY, int endX, int endY, float increment, boolean inColor){

  loadPixels();

  float xoff = 0.0; // Start xoff at 0
  
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = initX; x < endX; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = initY; y < endY; y++) {
      yoff += increment; // Increment yoff
      
      // Calculate noise and scale by 255
      //float bright = noise(xoff,yoff)*random(255);
      float bright = noise(xoff,yoff)*255;

      // Try using this line instead
      //float bright = random(0,255);
      
      // Set each pixel onscreen to a grayscale value
      if(inColor){
        pixels[x+y*width] = color(bright,100,236);
      }else{
        
        if(bright <= 100){
          pixels[x+y*width] = color(random(50,64),random(100,125), random(220,236), 220);
        }else{
          pixels[x+y*width] = color(bright+120, 250);
        }
        
      } 

    }
  }
  
  updatePixels();

}
