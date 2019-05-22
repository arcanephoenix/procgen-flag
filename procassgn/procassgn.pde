// country generator
// creates a flag

int flag_pattern = 0; // flag patterns are crosses, tricolors, bicolors
// flag pattern
int flag_ratio = 0; // common ratios are 2/3 and 1/2, others are 3/5, 1/1 and 10/19
// flag ratio
int flag_orientation = 0;
// flag orientation horizontal or vertical
int color1r = 0;
int color1g = 0;
int color1b = 0;
// rgb components for color1
int color2r = 0;
int color2g = 0;
int color2b = 0;
// rgb components for color2
int color3r = 0;
int color3g = 0;
int color3b = 0;
// rgb components for color3
// colors in the flag


void setup() {
  size(1280,720);
  smooth();
  fill(255,255,255);
  //stroke(255,255,255);
  noStroke();
  noLoop();
}

void draw() {
  // background(255,255,255);
  background(0,0,0);
  
  resetFlag();
  
  drawFlag();
  //String s = "Henlo world";
  //text(s,10,10);
}

void resetFlag() {
  flag_ratio = int(random(5));
  print("ratio is " + flag_ratio);
  flag_pattern = int(random(3));
  flag_orientation = int(random(2));
  color1r = int(random(256));
color1g = int(random(256));
  color1b = int(random(256));
 color2r = int(random(256));
 color2g = int(random(256));
   color2b = int(random(256));
color3r = int(random(256));
color3g = int(random(256));
color3b = int(random(256));
}

void drawFlag() {
  float flagh = 150; // flag height
  float flagw = 0; // flag width (set in the flag_ratio switch)
  switch(flag_ratio) {
    case 0:  // 1:1
      flagw = flagh;
      break;
    case 1: // 2:3
      flagw = 225;
      break;
      case 2: // 3:5
      flagw = 250;
      break;
      case 3: // 1:2
     flagw = flagh * 2;
      break;
      case 4: // 10:19
      flagw = 285;
      break;
  }
  float startx = (width - flagw)/2; // x coordinate of the flag
  float starty = (height - flagh)/2; // y coordinate of the flag
        //rect(startx, starty, flagw,flagh);
  
  switch(flag_pattern) {
    case 0: // tricolor
      if(flag_orientation == 0) { //h
          fill(color1r,color1g,color1b);
          rect(startx,starty,flagw,flagh/3);
          fill(color2r,color2g,color2b);
          rect(startx,starty+flagh/3,flagw,flagh/3);
         fill(color3r,color3g,color3b);
          rect(startx,starty+((2 * flagh)/3),flagw,flagh/3);
      }
      else {
          fill(color1r,color1g,color1b);
          rect(startx,starty,flagw/3,flagh);
          fill(color2r,color2g,color2b);
          rect(startx+flagw/3,starty,flagw/3,flagh);
          fill(color3r,color3g,color3b);
          rect(startx+((2 * flagw)/3),starty,flagw/3,flagh);
      }
      break;
      case 1: //bicolor
      if(flag_orientation == 0) { //h
          fill(color1r,color1g,color1b);
          rect(startx,starty,flagw,flagh/2);
          fill(color2r,color2g,color2b);
          rect(startx,starty+flagh/2,flagw,flagh/2);
      }
      else {
          fill(color1r,color1g,color1b);
          rect(startx,starty,flagw/2,flagh);
          fill(color2r,color2g,color2b);
          rect(startx+flagw/2,starty,flagw/2,flagh);
      }
      break;
      case 2: //cross
      float str_width = random(50); // width of the strip of the cross
      float str_pos = 10;// position of the oblique strip
      if(flag_orientation == 0) { //h
          str_pos = random(flagw/2,flagw * 2 / 3);
          fill(color1r,color1g,color1b);
          rect(startx,starty,flagw,flagh);
          fill(color2r,color2g,color2b);
          rect((startx),(starty+(flagh/2)-(str_width/2)),flagw,str_width);
          rect(startx + str_pos,starty,str_width,flagh);
      }
      else {
          str_pos = random(flagh/2,flagh * 2 / 3);
          fill(color1r,color1g,color1b);
          rect(startx,starty,flagw,flagh);
          fill(color2r,color2g,color2b);
          rect((startx),(starty+ str_pos),flagw,str_width); 
          rect(startx +(flagw/2)-(str_width/2),starty,str_width,flagh);
      }
      break;
  }
  
}

void mousePressed() {
  redraw();
}
