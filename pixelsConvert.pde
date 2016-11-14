PImage img;
int photWidth = 0,photHeigh = 0;
byte red,green,gereen1,gereen2,blue;
PrintWriter outputBMP;
color c;
int pictx;
int picty;

void setup() {
  
  /******please change********/
  pictx = 128;
  picty = 160;
  size(128,160); //just width=pictx, height = picty
  img = loadImage("sample.jpg");
  outputBMP = createWriter("sample.txt");
  /***************************/
  c = get(0,0);
  red = byte(32*red(c)/255);
  green = byte(63*green(c)/255);
  blue = byte(32*blue(c)/255);
  
}

void draw() {
  background(230,240,255);
  image(img,0,0);
  
}

void keyPressed() { 
  if(key == 's'){
  for(int y=0;y<80;y++){
    outputBMP.print("{");
    for(int x=0;x<64;x++){
      c = get(x,y);
      red = byte(30*(red(c)/255));
      byte green1 = byte(61*(green(c)/255));
      byte green2 = byte(61*(green(c)/255));
      blue = byte(30*blue(c)/255);
      if(x>=(pictx-1)){
        outputBMP.print("0x" + hex(((red<<3) | (green1>>3))<<8|((green2<<3) | blue),4));
      }else{
        outputBMP.print("0x" + hex(((red<<3) | (green1>>3))<<8|((green2<<3) | blue),4) + ",");
      }
    }
    if(y>=picty-1){
      outputBMP.println("}");
    }else{
      outputBMP.println("},");
    }
  }
    outputBMP.flush();
    outputBMP.close();
    exit();
  }
}