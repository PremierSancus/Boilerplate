//Global Variables
float BS;
float BSX;
float BSY;
int BMX;
int BMY;
float SPDX = 2;
float SPDY = 2.5;
int RGMode = #92EDE8;
int nightMode = 0;
float YP1 = 4;
float YP2 = 4;
float PSizeY;
float PSizeX;
float PStartY;
Boolean PRUp;
Boolean PRdown;
Boolean PLUp;
Boolean PLdown;
Boolean gameOn = false;
float PRMove;
float PLMove;
int score1 = 2;
int score2 = 2;
PFont calibri;
int startColor;
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
  calibri = createFont ("Calibri-48", 48);
}

void draw () {
  PSizeY = displayHeight*2/10;

  background(#92EDE8);
  noStroke();
  rect(0, 0, displayWidth*1/8, displayHeight);
  rect(displayWidth*7/8, 0, displayWidth, displayHeight);
  println("X start:", BSX, "Y start:", BSY);
  println("X move:", BMX, "Y move:", BMY);
  fill(255);
  textFont( calibri, displayWidth*1/8);
  text(score1-2, displayWidth*1/32, displayHeight*3/16);
  text(score2-2, displayWidth*29/32, displayHeight*3/16);
  fill(0);
  if (gameOn == false) {
    startColor=255;
    if (mouseX >= displayWidth*11/32 && mouseX <= displayWidth*0.677 && mouseY >= displayHeight*1/6 && mouseY<=displayHeight*5/12) {
      startColor = #51FC30;
    }
    fill(startColor);
    rect(displayWidth*11/32, displayHeight*1/6, displayWidth*1/3, displayHeight*1/4);
    fill(0);
    text("Start", displayWidth*3/8, displayHeight*3/8);
  }
  if (gameOn == true) {
    if (score1 == 6) {
    }
    if (score2 ==6) {
    }
    if (BMX <= displayWidth*1/2){
      //SPDX = SPDX+sqrt(
    }
    if (BMX >= displayWidth-((BS/2)+(displayWidth*1/8))) {//right side net catch ball
      SPDX = SPDX *(-1);
      BMX = int(BSX);
      BMY = int(BSY);
      score2 += 1;
    }
    if (BMX<=(displayWidth*1/8)+BS/2) {//left side net catch ball
      SPDX = SPDX *(-1);
      BMX = int(BSX);
      BMY = int(BSY);
      score1 += 1;
    }
    if (BMY >= displayHeight-(BS/2) || BMY<=0) {
      SPDY = SPDY*(-1);
    }
    if (BMX <= ((displayWidth*11/64 + (BS/2))) && BMX >= displayWidth*5/32) {
      if (BMY >= displayHeight*YP1/10 && BMY <= displayHeight*(YP1/10)+PSizeY) {//Paddle deflection1
        SPDX = SPDX *(-1);
      }
    }
    if (BMX >= ((displayWidth*53/64 - (BS/2))) && BMX <= displayWidth*54/64) {
      if (BMY >= displayHeight*YP2/10 && BMY <= displayHeight*(YP2/10)+PSizeY) {//Paddle deflection2
        SPDX = SPDX *(-1);
      }
    }
    BMX += SPDX;
    BMY += SPDY;
  }
  println("X:", BMX, "y:", BMY);
  line(displayWidth*1/2,0,displayWidth*1/2,displayHeight);
  rect(displayWidth*5/32, displayHeight*YP1/10, PSizeX, PSizeY);//paddle 1
  rect(displayWidth*53/64, displayHeight*YP2/10, PSizeX, PSizeY);//paddle 2
  fill(#CB0209);
  ellipse(BMX, BMY, BS, BS);
  fill(0);
}

void mouseClicked () {
  if (mouseX >= displayWidth*11/32 && mouseX <= displayWidth*0.677 && mouseY >= displayHeight*1/6 && mouseY<=displayHeight*5/12) {
    gameOn = true;
  }
}
