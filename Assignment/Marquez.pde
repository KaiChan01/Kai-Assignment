class Marquez extends Fight
{
  int numbers;
  int barSize;
  int i;
  int graphSize;
  int position;
  float addUp;
  
  int round;
  int radius;
  int r;
  float cx, cy;
  float last;
  float startAngle;
  color[] gradient = new color[total];
  float mouseAngleX;
  float mouseAngleY;
  
  Marquez()
  {
    blue = 255;
    red = 200;
    green = 200;
    
    for(int i = 0 ; i<total;i++)
    {
      gradient[i]=color(red,green,blue);
      red = red - 50;
      green = green - 50;
    }
    
    barSize = width/50;
    position = 1;
    corner = color(0,0,255);
    //radius = 300
    radius = width/2;
    r = radius/2;
    cx = cy = width/2;
    startAngle = (PI/2);
  }
  
  void bar()
  {
     fill(corner);
     rect((position*barSize)+x,height-y,barSize,-map(marqData[i][total], 0, 100, 0, graphSize));
  }
   
  void pie()
  {
     mouseAngleX = mouseX - cx;
     mouseAngleY = mouseY - cy;
     
     float mouseAngle = atan2(mouseAngleX, mouseAngleY);
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
        addUp += marqData[round][i];
      }
      else
      {
        if(i == totalJabs)
        {
          //Jabs missed
          addUp += (marqData[round][i]-marqData[round][jabs]);
        }
        else
        {
          if(i == totalPower)
          {
            //Power shots missed
            addUp += (marqData[round][i]-marqData[round][strong]);
          }
         }
        }
      float section = map(addUp, 0 ,totalPunches, 0, TWO_PI)+startAngle;
      if( (mouseAngle > last+startAngle  && mouseAngle < section+startAngle ))
        {
          radius = radius+(radius/4);
        }
        else
        {
          radius = width/2;
        }
      
      arc(cx,cy,radius,radius,(TWO_PI-section),TWO_PI-last,PIE);
      last = section;
      
      textAlign(CENTER);
      if(radius != width/2)
      {
        if(i==0)
        {
          text(int(marqData[round][jabs])+" Jabs landed",width/2,height-space/2);
        }
        if(i == 1)
        {
          text(int(marqData[round][strong])+" Power Punches landed",width/2,height-space/2);
        }
        if(i==2)
        {
          text(int(marqData[round][totalJabs]-marqData[round][jabs])+" Jabs missed",width/2,height-space/2);
        }
        if(i == 3)
        {
          text(int(marqData[round][totalPower]-marqData[round][strong])+" Power Punches missed",width/2,height-space/2);
        }
       }
     }
     
     addUp=0;
     last = startAngle;
    //Inner Pie charts
    stroke(0);
    fill(corner);
    addUp = marqData[round][total];
    float section = map(addUp, 0 ,totalPunches, 0, TWO_PI)+startAngle;
    arc(cx,cy,r,r,TWO_PI-section,TWO_PI-last,PIE);
    
    textAlign(LEFT);
    text("Total jabs: " + int(marqData[round][totalJabs]), 10,height-(2*space));
    text("Total PowerPunches: " + int(marqData[round][totalPower]), 10,height-((2*space)-(space/2)));
    text("Total Punches: " + int(marqData[round][total]), 10,height-(space));
   }
 }
