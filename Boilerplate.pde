//Global Variables
float BS;
float BSX;
float BSY;
int BMX;
int BMY;
float SPDX = 10;
float SPDY = 10;
int RGMode = #92EDE8;
int nightMode = 0;
float YP1 = 4;
float YP2 = 4;
float PSizeY;
float PSizeX;
float PStartY;


void setup() { 
  //size(900, 600);
  fullScreen();
  BSX = displayWidth *1/2;
  BSY = displayHeight*1/2;//change later
  BS = displayWidth*1/128;
  BMX = int(BSX);
  BMY = int(BSY);
  PSizeX = displayWidth*1/64;
  PSizeY = displayHeight*2/10;
  ellipse(BSX, BSY, BS, BS);
  //GUI();
}

void draw () {
  PSizeY = displayHeight*2/10;

  background(#92EDE8);
  noStroke();
  rect(0, 0, displayWidth*1/8, displayHeight);
  rect(displayWidth*7/8, 0, displayWidth, displayHeight);
  println("X start:", BSX, "Y start:", BSY);
  println("X move:", BMX, "Y move:", BMY);
  if (BMY >= displayHeight-(BS/2) || BMY<=0) {
    SPDY = SPDY*(-1);
  }
  if (BMX >= displayWidth-((BS/2)+(displayWidth*1/8)) || BMX<=(displayWidth*1/8)+BS/2) {
    SPDX = SPDX *(-1);
  }
  if (BMX <= ((displayWidth*11/64 + (BS/2))) && BMX >= displayWidth*5/32) {
    if (BMY >= displayHeight*YP1/10 && BMY <= displayHeight*(YP1/10)+PSizeY) {//Paddle deflection1
      SPDX = SPDX *(-1);
    }
  }
  if (BMX >= ((displayWidth*53/64 - (BS/2))) && BMX <= displayWidth*54/64) {
    if (BMY >= displayHeight*YP1/10 && BMY <= displayHeight*(YP1/10)+PSizeY) {//Paddle deflection1
      SPDX = SPDX *(-1);
    }
  }
  BMX += SPDX;
  BMY += SPDY;
  println("X:", BMX, "y:", BMY);
  rect(displayWidth*5/32, displayHeight*YP1/10, PSizeX, PSizeY);//paddle 1
  rect(displayWidth*53/64, displayHeight*YP2/10, PSizeX, PSizeY);//paddle 2
  fill(#CB0209);
  ellipse(BMX, BMY, BS, BS);
  fill(0);
}
