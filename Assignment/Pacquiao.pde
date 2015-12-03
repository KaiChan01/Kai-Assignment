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
    radius = (width/5)*3;
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
     totalPunches = pacData[round][total] + marqData[round][total];
     println(totalPunches);
     
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
      arc(cx,cy,radius,radius,last,section,PIE);
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
