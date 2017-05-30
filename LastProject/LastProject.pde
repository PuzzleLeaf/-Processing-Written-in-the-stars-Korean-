import java.util.Scanner; 
Scanner scan = new Scanner(System.in);


PImage starBg;
ArrayList<Point> myArr;
int starNum = 800;
int starLimit = 500;
int textSize = 210;
PFont font;
String text[] = {"디자인 프로그래밍","★☆★☆★","배경에 별이","깜빡이고","별똥별이","떨어지네","!@#!@#","Star!"};
int idx = 0;

String myText = "Type something";

Star myStar[] = new Star[starNum];


void setup()
{
  starBg = loadImage("bg.png");
  myArr = new ArrayList();
   
  font = loadFont("휴먼가는샘체-70.vlw");

  size(1900,1000);
  imageMode(CENTER); 
  starBg.resize(width,height);
  for(int i=0;i<starNum;i++)
    myStar[i] = new Star();
    
  setText(text[idx]);
  
  
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
   
   
   keyInput();
   
   description();
   auto();
}

void description()
{
   textSize(15);
   fill(200+random(-30,30),180);
   text("Click to Screen",width-width/5,height-height/20);
      text(myText, 0, 0, width, height);
}

void auto()
{
  for(int i=0;i<myArr.size();i++)
  {
    if(!myArr.get(i).isEnd())
      return;
  }
  textChange();
}

void keyInput()
{
 if(scan.hasNext())
 {
   myText += scan.next();
 }
}



void textChange()
{
  myArr.clear();
  idx++;
  
  if(idx==text.length)
    idx = 0;
    
  setText(text[idx]);
}
void mouseClicked()
{
  textChange();
  
}


void setText(String txt)
{
  PGraphics pg = createGraphics(width, height);
  pg.beginDraw();
  pg.fill(0);
  pg.textAlign(CENTER);
  pg.textFont(font,textSize);
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