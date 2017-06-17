//별 효과 모음
class Star
{
  PVector location;
  float brightness;
  float starSize;
  float light;
  float dropSpeed = random(1,4);
  
  PVector myStarLoc[] = new PVector[4];
  
  
  
  Star()
  {
    noStroke();
    location = new PVector(random(width),random(height));
    for(int i =0;i<4;i++)
    {
      myStarLoc[i] = new PVector(random(location.x-50,location.x+50),
      random(location.y-50,location.y+50));
    }
    starSize = random(3,7);
    light = random(1,7);
    brightness =30;
  }
  
  void display()
  {
    for(int i=0;i<starSize;i++)
    {
      fill(255,brightness);
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
     location = new PVector(random(width),random(height));
      light = random(1,7);
      starSize =  random(3,7);
      brightness =0 ;
    }
     brightness +=light;
     
  }
  
  void drop()
  {
    if(location.x >width || location.y>height)
    {
      location.x = random(width);
      location.y = 0;
      dropSpeed = random(2,6);
    }
    location.x+=dropSpeed;
    location.y+=dropSpeed;
    
  }
  
  void dropDisplay()
  {
    fill(255);
    for(float i=5;i>0;i-=1){
      ellipse(location.x-i,location.y-i,starSize/i,starSize/i);
    }
    ellipse(location.x,location.y,starSize,starSize);
  }
  
  //별자리
  void myDisplay()
  {
    fill(255,brightness);
    pushMatrix();
    stroke(255,brightness);
    ellipse(location.x,location.y,starSize,starSize);
    line(location.x,location.y,myStarLoc[0].x,myStarLoc[0].y);
    ellipse(myStarLoc[0].x,myStarLoc[0].y,starSize,starSize);
    line(location.x,location.y,myStarLoc[1].x,myStarLoc[1].y);
    ellipse(myStarLoc[1].x,myStarLoc[1].y,starSize,starSize);
    line(myStarLoc[1].x,myStarLoc[1].y,myStarLoc[2].x,myStarLoc[2].y);
    ellipse(myStarLoc[2].x,myStarLoc[2].y,starSize,starSize);
    line(myStarLoc[2].x,myStarLoc[2].y,myStarLoc[3].x,myStarLoc[3].y);
    ellipse(myStarLoc[3].x,myStarLoc[3].y,starSize,starSize);
    popMatrix();
    noStroke();
  }
  
  void myStar()
  {
  if(brightness>255){
      brightness =255;
      light = random(-1,-7);
    }
    if(brightness<0)
    {
     location = new PVector(random(width),random(height));
     for(int i =0;i<4;i++)
      {
        myStarLoc[i] = new PVector(random(location.x-50,location.x+50),
        random(location.y-50,location.y+50));
      }
      light = random(1,7);
      starSize =  random(3,7);
      brightness =0 ;
    }
     brightness +=light;
     for(int i =0;i<4;i++)
      {
        myStarLoc[i].x += noise(1)*random(-2,2);
        myStarLoc[i].y += noise(1)*random(-2,2);
      }
  }
}