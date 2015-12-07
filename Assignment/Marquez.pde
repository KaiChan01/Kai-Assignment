class Marquez extends Fight
{
  //These fields are ainly for the barchart method
  int numbers;
  int barSize;
  int i;
  int graphSize;
  int position;
  float addUp;
  
  //These are mostly for the pie chart method
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
    //Creating an array of colours
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
    radius = width/2;
    r = radius/2;
    cx = cy = width/2;
    //startAngle is to change where the first sector in being drawn
    startAngle = (PI/2);
  }
  
  //Bar chart method
  void bar()
  {
     fill(corner);
     rect((position*barSize)+x,height-y,barSize,-map(marqData[i][total], 0, 100, 0, graphSize));
  }
   
  //Pie chart method
  void pie()
  {
     mouseAngleX = mouseX - cx;
     mouseAngleY = mouseY - cy;
     
     //Finding the angle of the mouse in relation to the center of the program
     float mouseAngle = atan2(mouseAngleX, mouseAngleY);
     
     //If mouseAngle is negative then change it to positive
     if(mouseAngle<0)
     {
       mouseAngle = map(mouseAngle, -PI,0,PI,TWO_PI);
     }
     
     //Total punches combining both fighters into one
     totalPunches = pacData[round][total] + marqData[round][total];
     
     last = startAngle;
     addUp = 0;
     stroke(0);
     
     //Drawing 4 sectors
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
          //Calculating jabs missed
          addUp += (marqData[round][i]-marqData[round][jabs]);
        }
        else
        {
          if(i == totalPower)
          {
            //Calculating power shots missed
            addUp += (marqData[round][i]-marqData[round][strong]);
          }
         }
        }
        //Calculating the angle of this particular sector
        float section = map(addUp, 0 ,totalPunches, 0, TWO_PI)+startAngle;
        if( (mouseAngle > last+startAngle  && mouseAngle < section+startAngle ))
        {
          radius = radius+(radius/4);
        }
        else
        {
          radius = width/2;
        }
      
      //Drawing the actual sector
      arc(cx,cy,radius,radius,(TWO_PI-section),TWO_PI-last,PIE);
      last = section;
      
      //IF the mouse is hovered over one of the sectors, display this text
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
    
    
    //Resetting these values to draw the inner bar chart
    addUp=0;
    last = startAngle;
    
    //Inner Pie chart
    stroke(0);
    fill(corner);
    addUp = marqData[round][total];
    float section = map(addUp, 0 ,totalPunches, 0, TWO_PI)+startAngle;
    arc(cx,cy,r,r,TWO_PI-section,TWO_PI-last,PIE);
    
    
    //Extra details for Marq
    textAlign(LEFT);
    text("Total jabs: " + int(marqData[round][totalJabs]), 10,height-(2*space));
    text("Total PowerPunches: " + int(marqData[round][totalPower]), 10,height-((2*space)-(space/2)));
    text("Total Punches: " + int(marqData[round][total]), 10,height-(space));
   }
 }
