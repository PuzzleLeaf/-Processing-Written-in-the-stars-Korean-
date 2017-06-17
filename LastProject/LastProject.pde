
ArrayList<Point> myArr;
int starNum = 800;
int starLimit = 500;
int textSize ;
PFont font;
float num = 0;
String text[] = {"밤 하늘에 쓰여진 별들\nStars written in the night sky","디자인 프로그래밍","Puzzle Leaf"};
int idx = 0;

String myText = "Type something";

Star myStar[] = new Star[starNum];


void setup()
{
  myArr = new ArrayList();
   
  font = loadFont("휴먼가는샘체-70.vlw");

  size(1200,800);
  imageMode(CENTER); 
  for(int i=0;i<starNum;i++)
    myStar[i] = new Star();

  noStroke();


  textSize = width/10;
  setText(text[idx]);
  
}



void draw()
{
  
  background(7,20,29);
  drawMoon();
  drawShadow(((width-width/4)+130)-(num),height/8);
  
  num++;
  if(num>300)
    num=0;
    
   for(int i=0;i<starLimit;i++)
    {
   
      if(i%starLimit/7==0)
      {
        myStar[i].myStar();
        myStar[i].myDisplay();
        
      }
      else if(i%starLimit/10==0)
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
   
   if(mousePressed)
   {
     Point temp = new Point(mouseX,mouseY);
     myArr.add(temp);
   }
   description();
  // auto();
}

void drawMoon(){
    for(int i=1; i<50; i++) {
      fill(245,10);
      ellipse(width-width/4, height/8,130-i*5,130-i*5);
      ellipse(width-width/4, height/8,90,90);
    }
}

void drawShadow(float x, float y) {
    for(int i=1; i<30; i++) {
      fill(7,20,29,100);
      ellipse(x, y,130-i*5,130-i*5);
    }
}



void description()
{
   textSize = width/20;
   fill(200+random(-30,30),180);
   text("왼쪽 클릭 - 그리기\n오른쪽 클릭 - 새로운 문자",width-width/4,height-height/10);
   textSize = width/10;

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
    if(mouseButton == RIGHT)
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
  
  int val = 4;

  if(width>1100)
    val = 4;
  else if(width>800)
    val =3;
  else
    val =2;

    
  for(int h=0;h<height;h+=val)
    for(int w=0;w<width;w+=val)
    {
       if(pg.pixels[width*h+w]!=0){
         Point temp = new Point(w,h);
         myArr.add(temp);
       }
    }
}