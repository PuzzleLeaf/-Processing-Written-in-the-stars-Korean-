//별 효과 모음
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
    starSize = random(3,7);
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
      starSize =  random(3,7);
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