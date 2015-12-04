class Pacquiao extends Fight
{
  int numbers;
  int barSize;
  int i;
  int graphSize;
  int position;
  float addUp;
  
  float startAngle;
  int round;
  int radius;
  int r;
  float cx, cy;
  float last;
  color[] gradient = new color[total];
  float mouseAngleX;
  float mouseAngleY;
  
  Pacquiao()
  {
    blue = 150;
    red = 255;
    green = 150;
    
    for(int i = 0 ; i<total;i++)
    {
      gradient[i]=color(red,green,blue);
      blue = blue - 40;
      green = green - 40;
    }
    
    barSize = width/50;
    corner = color(255,0,0);
    position = 0;
    //I want the radius to be 300
    radius = width/2;
    r = radius/2;
    cx = cy = width/2;
    startAngle = PI+(PI/2);
  }
  
  void bar()
  {
     fill(corner);
     rect((position*barSize)+x,height-y,barSize,-map(pacData[i][total], 0, 100, 0, graphSize));
   }
   
   void pie()
   {
     mouseAngleX = mouseX - cx;
     mouseAngleY = mouseY - cy;
     
     float mouseAngle = atan2(mouseAngleY, mouseAngleX);
     
     if(mouseAngle<0)
     {
       mouseAngle = map(mouseAngle, -PI,0,PI,TWO_PI);
     }
     
     totalPunches = pacData[round][total] + marqData[round][total];

     last = startAngle;
     addUp = 0;
     stroke(0);
     for(int i = 0; i<total; i++)
     {
      fill(gradient[i]);
      if(i !=totalJabs && i != totalPower)
      {
        addUp += pacData[round][i];
        //println(addUp);
      }
      else
      {
        if(i == totalJabs)
        {
          //Jabs missed
          addUp += (pacData[round][i]-pacData[round][jabs]);
        }
        else
        {
          if(i == totalPower)
          {
            //Power shots missed
            addUp += (pacData[round][i]-pacData[round][strong]);
          }
         }
        }
        
        float section = map(addUp, 0 ,totalPunches, 0, TWO_PI)+startAngle;
        //Bottom half < > top half
        if( (mouseAngle+PI > last-PI && mouseAngle+PI < section-PI) || (mouseAngle > last && mouseAngle < section))
        {
          radius = 325;
        }
        else
        {
          radius = width/2;
        }
        println("angle"+ (mouseAngle+PI));
        println(i,section);
        
        arc(cx,cy,radius,radius,last,section,PIE);
        
        fill(255);
        if(radius != width/2)
        {
          if(i==0)
          {
            text(int(pacData[round][jabs])+" Jabs landed",mouseX,mouseY);
          }
          if(i == 1)
          {
            text(int(pacData[round][strong])+" Power Punches landed",mouseX,mouseY);
          }
          if(i==2)
          {
            text(int(pacData[round][totalJabs]-pacData[round][jabs])+" Jabs missed",mouseX,mouseY);
          }
          if(i == 3)
          {
            text(int(pacData[round][totalPower]-pacData[round][strong])+" Power Punches missed",mouseX,mouseY);
          }
        }
        println(i,last);
        last = section;
     }
        
     
     addUp=0;
     last = startAngle;
    //Inner Pie charts
    stroke(0);
    fill(corner);
    addUp = pacData[round][total];
    float section = map(addUp, 0 ,totalPunches, 0, TWO_PI)+startAngle;
    arc(cx,cy,r,r,last,section,PIE);
   }
}
