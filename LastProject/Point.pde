// 포인트 이벤트
class Point
{
  PVector pos;
  PVector des;
  PVector vel;
  PVector acc;
  
  float limit = 1;
  int speed = (int)random(5,12);
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
     fill(255);
     ellipse(pos.x,pos.y,size,size);  
  }
  
  void update()
  {
    float distance = dist(pos.x,pos.y,des.x,des.y);
    float proximityMult = 1.0;
    
    if(distance<50)
    {
        proximityMult = distance/50;
    }
    
    //벡터의 방향과 크기를 정해준다.
      PVector toward = new PVector(this.des.x,this.des.y);
      toward.sub(pos);
      toward.normalize();
      toward.mult(proximityMult*speed);
  
      
      PVector steer = new PVector(toward.x,toward.y);
      steer.sub(vel);

      
      acc.add(steer);
      vel.add(acc);
      pos.add(vel);
      
      acc.mult(0);
  }
  
  boolean isEnd()
  {
    float distance = dist(pos.x,pos.y,des.x,des.y);
    if(distance <5)
      return true;
    else
      return false;
  }
}