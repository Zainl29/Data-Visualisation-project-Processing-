PImage img;
Table table;

float minLon = -13.1;
float maxLon =  2.8;
float minLat = 50;
float maxLat = 59.4;

boolean census1991 = false;
boolean census2001 = false;
boolean census2011 = false;

float camX = 0, camY = 0, camZ;
float targetCamX = 0, targetCamY = 0, targetCamZ;

boolean upPressed, downPressed, leftPressed, rightPressed;
float mousePanX, mousePanY;
float x, y;

void setup() {
  size(700, 800, P3D);
  
  img = loadImage("uk-admin-8817f8eb-4be8-40a7-adbf-814f9cdf0f0d.jpg");
  table = loadTable ("Data.csv", "header");
  
  // initial camera distance
  camZ = (height/2.0) / tan(PI*30.0 / 180.0)*4.5;
  targetCamZ = camZ;
  
  println("- Press '1' to view Census 1991");
  println("- Press '2' to view Census 2001");
  println("- Press '3' to view Census 2011");
  println("- Press 'z' to clear Census data from map");
  println();
  println("- Scroll mouse wheel to zoom in and out");
  println("- Press arrow keys to pan around the map");
  println("- Use mouse cursor to pan around the map");
  println("- Double click to zoom");
 
}

void draw() {
  background(197, 236, 243);

  
  camX = lerp(camX, targetCamX, 0.1);
  camY = lerp(camY, targetCamY, 0.1);
  camZ = lerp(camZ, targetCamZ, 0.1);

  // keyboard + mouse panning
  float speed = 20;
  if (upPressed)     targetCamY -= speed; 
  if (downPressed)   targetCamY += speed; 
  if (leftPressed)   targetCamX -= speed;  
  if (rightPressed)  targetCamX += speed; 
  
  mousePanY -= speed;
  mousePanY += speed; 
  mousePanX -= speed; 
  mousePanX += speed; 
  
   
  camera(camX, camY, camZ, 0, 0, 0, 0, 1, 0);

  // draw map in world
  
  image(img, -img.width/2, -img.height/2);
  lights();
  
  if (census1991) {
    
    for (TableRow row : table.rows()) { 
    float lat = row.getFloat("Latitude");
    float lon = row.getFloat("Longitude");
    float pop = row.getFloat("1991");
  
    x = map(lon, minLon, maxLon, -img.width/2.0, img.width/2.0);
    y = map(lat, maxLat, minLat, -img.height/2.0, img.height/2.0);
   
  // assign colour based on population size
    if (pop < 100000) {
      fill(255);
    } else if (pop < 200000) {
      fill(242,255,0);
    } else if (pop < 300000) {
      fill(255,221,0);
    } else if (pop < 400000) {
      fill(255, 179, 0);
    } else if (pop < 500000) {
      fill(255, 136, 0);
    } else if (pop < 600000) {
      fill(255, 85, 0);
    } else if (pop < 1000000) {
      fill(255, 0, 0);
    } else {
      fill(100, 0, 0);
    }
  
    pushMatrix();
    translate(x, y);
    strokeWeight(0.5);
    box(30);
    popMatrix();
  
    }
 } 
 
 else if (census2001) {
    
    for (TableRow row : table.rows()) { 
    float lat = row.getFloat("Latitude");
    float lon = row.getFloat("Longitude");
    float pop = row.getFloat("2001");
  
    x = map(lon, minLon, maxLon, -img.width/2.0, img.width/2.0);
    y = map(lat, maxLat, minLat, -img.height/2.0, img.height/2.0);
   
  // assign colour based on population
    if (pop < 100000) {
      fill(255);
    } else if (pop < 200000) {
      fill(242,255,0);
    } else if (pop < 300000) {
      fill(255,221,0);
    } else if (pop < 400000) {
      fill(255, 179, 0);
    } else if (pop < 500000) {
      fill(255, 136, 0);
    } else if (pop < 600000) {
      fill(255, 85, 0);
    } else if (pop < 1000000) {
      fill(255, 0, 0);
    } else {
      fill(100, 0, 0);
    }
  
    pushMatrix();
    translate(x, y);
    strokeWeight(0.5);
    box(30);
    popMatrix();
  
   }
   
 }
 
  else if (census2011) {
    
    for (TableRow row : table.rows()) { 
    float lat = row.getFloat("Latitude");
    float lon = row.getFloat("Longitude");
    float pop = row.getFloat("2011");
  
    x = map(lon, minLon, maxLon, -img.width/2.0, img.width/2.0);
    y = map(lat, maxLat, minLat, -img.height/2.0, img.height/2.0);
   
  // assign colour based on population
    if (pop < 100000) {
      fill(255);
    } else if (pop < 200000) {
      fill(242,255,0);
    } else if (pop < 300000) {
      fill(255,221,0);
    } else if (pop < 400000) {
      fill(255, 179, 0);
    } else if (pop < 500000) {
      fill(255, 136, 0);
    } else if (pop < 600000) {
      fill(255, 85, 0);
    } else if (pop < 1000000) {
      fill(255, 0, 0);
    } else {
      fill(100, 0, 0);
    }
  
    pushMatrix();
    translate(x, y);
    strokeWeight(0.5);
    box(30);
    popMatrix();
  
   }
   
 }

// colour legend setup
 camera();

// legend background
fill(255, 255, 255, 200);
rect(10, 10, 160, 235);

// legend title
fill(0);// set text colour black
text("Population", 20, 30);

fill(255); // set rectangle colour         
rect(20, 45, 15, 15);
fill(0); 
text("< 100,000", 40, 57);

fill(242, 255, 0);  
rect(20, 70, 15, 15);
fill(0); 
text("100k - 200k", 40, 82);

fill(255, 221, 0);   
rect(20, 95, 15, 15);
fill(0);
text("200k - 300k", 40, 107);

fill(255, 179, 0); 
rect(20, 120, 15, 15);
fill(0);
text("300k - 400k", 40, 132);

fill(255, 136, 0);  
rect(20, 145, 15, 15);
fill(0); 
text("400k - 500k", 40, 157);

fill(255, 85, 0);    
rect(20, 170, 15, 15);
fill(0); 
text("500k - 600k", 40, 182);

fill(255, 0, 0);     
rect(20, 195, 15, 15);
fill(0); 
text("600k - 1M", 40, 207);

fill(100, 0, 0);     
rect(20, 220, 15, 15);
fill(0);
text("1M+", 40, 232);
      
}

 

// Key Press Handling
void keyPressed() {
  if (keyCode == UP)    upPressed = true;
  if (keyCode == DOWN)  downPressed = true;
  if (keyCode == LEFT)  leftPressed = true;
  if (keyCode == RIGHT) rightPressed = true;
  
  if (key == '1') {
   census1991 = true;
   census2001 = false;
   census2011 = false;
 }
  
  if (key == '2') {
   census1991 = false;
   census2001 = true;
   census2011 = false;
 }
  
  if (key == '3') {
   census1991 = false;
   census2001 = false;
   census2011 = true;
  }
  
  if (key == 'z') {
    census1991 = false;
    census2001 = false;
    census2011 = false; 
  }
  
}

void keyReleased() {
  if (keyCode == UP)    upPressed = false;
  if (keyCode == DOWN)  downPressed = false;
  if (keyCode == LEFT)  leftPressed = false;
  if (keyCode == RIGHT) rightPressed = false;
}


// Zoom
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  targetCamZ += e * 50;
 
}

// double click
void mouseClicked(MouseEvent event) {
  if (event.getCount() == 2) {

    targetCamZ = constrain(targetCamZ*0.5, 200, 2000);
  }
  
}

void mouseMoved() {
  float dx = mouseX - width/2;
  float dy = mouseY - height/2;
  targetCamX = mousePanX + dx * 1.2;
  targetCamY = mousePanY + dy * 1.2;
}
