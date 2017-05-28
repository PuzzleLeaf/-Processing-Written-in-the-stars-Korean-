PImage starBg;
ArrayList<Point> myArr;
int starNum = 800;
int starLimit = 300;
PFont font;
String text[] = {"안녕","하세요","만나서","반가워요"};
color c = #332233;
color b = #ff0000;
color currentColor = lerpColor(255,255, 200);

Star myStar[] = new Star[starNum];
void setup()
{
   starBg = loadImage("mainbg.png");
   myArr = new ArrayList();
   font = loadFont("휴먼가는샘체-70.vlw");
   size(1000,500);
   imageMode(CENTER);
    starBg.resize(width,height);
    
  for(int i=0;i<starNum;i++)
    myStar[i] = new Star();
  setText("안녕");
}

void draw()
{
  image(starBg,width/2,height/2);
   for(int i=0;i<starLimit;i++)
    {
      if(i%starLimit/3==0)
      {
        myStar[i].drop();
        myStar[i].dropDisplay();
      }
      else
      {
        myStar[i].shine();
        myStar[i].display();
      }
   }
   for(int i=0;i<myArr.size();i++){
     myArr.get(i).update();
     myArr.get(i).display();
   }
}

void mouseClicked()
{
  myArr.clear();
  setText(text[1]);
}

void setText(String txt)
{
  PGraphics pg = createGraphics(width, height);
  pg.beginDraw();
  pg.fill(0);
  pg.textAlign(CENTER);
  pg.textFont(font,200);
  pg.text(txt,width/2,height/2);
  pg.endDraw();
  pg.loadPixels();  
  
  for(int h=0;h<height;h+=4)
    for(int w=0;w<width;w+=4)
    {
     if(pg.pixels[width*h+w]!=0){
       Point temp = new Point(w,h);
       myArr.add(temp);
     }
    }
}

class Point
{
  PVector pos;
  PVector des;
  PVector vel;
  PVector acc;
  int speed = (int)random(10,23);
  float size = random(1,6);
  Point(float x, float y)
  {
    pos = new PVector(random(0,width),random(0,height));
    des = new PVector(x,y);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
  }
  void display()
  {
     fill(currentColor);
     ellipse(pos.x,pos.y,size,size);  
  }
  
  void update()
  {
    float distance = dist(pos.x,pos.y,des.x,des.y);
    float check =1.0;
    if(distance<50)
    {
      check =0;
    }
    PVector toward = new PVector(this.des.x,this.des.y);
    toward.sub(pos);
    toward.normalize();
    toward.mult(speed*check);
    
    PVector steer = new PVector(toward.x,toward.y);
    steer.sub(vel);
    steer.normalize();
    steer.mult(check);
    acc.add(steer);
    
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }
}


class Star
{
  float xpos, ypos;
  PVector location;
  float brightness;
  float starSize;
  float light;
  float dropSpeed = random(1,4);
  
  
  Star()
  {
    noStroke();
    location = new PVector(random(width),random(height));
    starSize = random(1,4);
    light = random(1,7);
    brightness =30;
  }
  
  void display()
  {
    for(int i=0;i<starSize;i++)
    {
      fill(255,brightness-i*5);
      ellipse(location.x,location.y,i,i);
    }
  }
  
  //빛나는 효과
  void shine()
  {
    if(brightness>255){
      brightness =255;
      light = random(-1,-7);
      
    }
    if(brightness<0)
    {
     location = new PVector(random(width),random(height-height/5));
      light = random(1,7);
      starSize = random(3);
      brightness =0 ;
    }
     brightness +=light;
     
  }
  
  void drop()
  {
    if(location.x >width || location.y>height-height/8)
    {
      location.x = random(width);
      location.y = random(height-height/8);
      dropSpeed = random(2,6);
    }
    location.x+=dropSpeed;
    location.y+=dropSpeed;
    
  }
  
  void dropDisplay()
  {
    fill(255);
    for(float i=20;i>0;i-=1){
      ellipse(location.x-i,location.y-i,starSize/i,starSize/i);
    }
    ellipse(location.x,location.y,starSize,starSize);
  }
 
  
}