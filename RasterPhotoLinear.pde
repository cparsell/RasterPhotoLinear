import processing.pdf.*;

PImage myImg;

float wRes = 50;   
float hRes = 120;  //Density of lines
float maxWidth = 5; //max width of vector shapes

void setup() {
  size(1600,1200);
  myImg = loadImage("marilyn.jpg");
  myImg.resize(int(myImg.width*1.55), int(myImg.height*1.55));
  String date = month() + "" + day() + "" + year() + "" + hour() + "" + minute() + "" + second();
  beginRecord(PDF, "Marilyn-"+date+".pdf");
  myImg.filter(GRAY);
  myImg.loadPixels();
  background(255);
  noLoop();
}

void draw() { 
  float tone;
  float offs; 
  strokeWeight(.6);
  //noFill();
  fill(0);
  stroke(0);
  
  for (int h = 0; h < myImg.height; h=h+(int(height/hRes))) {
    beginShape();
    
    for (int w = 0; w < myImg.width; w=w+(int(width/wRes))) {
      tone = brightness(myImg.get(w,h));  //measure brightness of sampled pixel
      offs = map(tone,255,0,1,maxWidth);  //map brightness to size of vector shapes
      curveVertex(w, h+offs); 
    }
    
    curveVertex(myImg.width, h);
    
    for (int w = myImg.width; w > myImg.width/wRes; w=w-(int(width/wRes))) {  
      //follow line in reverse to offset vector shapes in the other direction and close the shape
      tone = brightness(myImg.get(w,h));
      offs = map(tone,255,0,-1,-1*maxWidth);
      curveVertex(w, h+offs);
    }
    
    curveVertex(0, h);
    endShape(CLOSE);
  }    
  endRecord();
}
