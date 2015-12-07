/* A visualisation program for a boxing match
   Author: Ka Yu Chan
*/

  import ddf.minim.*;
  Minim minim;

  Pacquiao pac;
  Marquez marq;
  
  
  //To avoid hard coding when accessing the array of DATA2
  int round;
  int rounds;
  
  //This variable is for storing user inputs
  int input;
  
  //Used to draw the Xand Y axis for barchart
  int smallSpace;
  int space;
  int axisSize;
  int gap;
  
  //Colour for both fighters
  color pacRed;
  color marqBlue;
  
  PImage img;
  
  //Declaring sounds navRound is for when changing the rounds in the pie chart
  AudioPlayer select;
  AudioPlayer navRound;

void setup()
{ 
  size(500,500);
  
  //Accessing classes, making instances
  pac = new Pacquiao();
  marq = new Marquez();
  minim = new Minim(this);
  
  //This is here to bring up the menu and user input will change the value of this
  input = 0;
  
  //Setting round at 0 as defualt
  round = 0;
  
  //Total number of rounds = 12 rounds
  rounds = 12;
  
  pacRed = color(255,0,0);
  marqBlue = color(0,0,255);
  
  //Loading some sounds and background image
  img = loadImage("background.jpg");
  select = minim.loadFile ("select.wav");
  navRound = minim.loadFile ("round.wav");
}

void draw()
{
  
  //Space is for the distance from the edge of the window
  space = width/10;
  smallSpace = space/10;
  
  //length of the X-axis and Y-axis in the bar chart
  axisSize = width - space - space;
  //Dividing up the axis to for the smaller lines
  gap = axisSize/10;
  
  //Drawing a menu
  switch(input)
  {
    case 0:
    {
      background(img);
      //Title
      textSize(width/20);
      fill(255,0,0);
      textAlign(CENTER);
      text("Pacquiao vs Marquez III", width/2 , space);
    
      //Drawing a box with text in it
      stroke(255);
      fill(0);
      rect(width/5,space*2,3*(width/5),height/2-(space));
    
      //Option 1
      textSize(width/31);
      fill(255);
      text("1. A Barchart displaying total number \nof punches thrown by both fighters.",width/2,height/4);
    
      //Option 2
      text("2. A Pie Chart showing the types of \npunches landed/thrown by both \nfighters.",width/2,height/3+(4*smallSpace));
      
      //Telling user what to do
      fill(0,255,100);
      text("*^^ Using the keyboard ^^*\n select one of the options above", width/2, height/2+(2*smallSpace));

      break;
    }
  
    //Draw barchart
    case 1:
    {
      //Calling the function which draw the X and Y axis
      drawingGraph();
    
      boxes();
    
      //Pac's bars
      for(int i = 0;i < rounds;i++)
      {
        pac.x=space+((axisSize/rounds)*i);
        pac.y=space;
        pac.i= i;
        pac.graphSize=axisSize;
        pac.bar();
      }
    
      //Marq's bars
      for(int i = 0; i < rounds;i++)
      {
        marq.x=space+((axisSize/rounds)*i);
        marq.y=space;
        marq.i= i;
        marq.graphSize=axisSize;
        marq.bar();
      }
    
      barfeature();
      break;
    }
  
    //Draw piechart
    case 2:
    {
      //Display for option 2
      textAlign(CENTER);
    
      background(0);
      fill(255);
      text("Round", width/2, height/10);
      text(round+1, width/2, height/10+(height/25));
      textAlign(LEFT);
      text("Press B for menu\n\nUse '<' and '>' key \nto change rounds",10,space/2);
    
      pac.round = round;
      pac.pie();
    
      marq.round = round;
      marq.pie();
      
      boxes();
      break;
    }  
  }
}


//Drawing boxes for each fighter
void boxes()
{
   //Size for the boxes
   int boxes = space/5;
   
   //drawing boxes on to show colours which represent fighters
   stroke(255);
   fill(pacRed);
   textAlign(LEFT);
   text("Pacquiao",width-(2*space)+boxes+smallSpace,2*boxes);
   rect(width-2*space,boxes,boxes,boxes);
    
   fill(marqBlue);
   textAlign(LEFT);
   text("Marquez",width-(2*space)+boxes+smallSpace,5*boxes);
   rect(width-2*space,4*boxes,boxes,boxes);
}

void drawingGraph()
{
    //For populating the Y axis
    int numbers = 100;
    stroke(255);
    fill(0);
    
    //X and Y axis drawn
    background(0);
    line(space,height-space,width-space,height-space);
    line(space,height-space,space,space);
    
    //Some text
    fill(255);
    text("0",space-gap,height-space);
    textAlign(CENTER);
    text("TOTAL PUNCHES PER ROUND",width/2, space/2);
    text("Press B for menu",width/2,space);
    text("<----Rounds---->",width/2, height-10);
    
    textAlign(LEFT);
    
    //Drawing the little lines on the graph
    for(int i = 0; i < 10; i++)
    {
      line(space,space+(gap*i),space-10,space+(gap*i));
      fill(255);
      text(numbers,space-gap, space+(gap*i));
      numbers -= 10;
    }
    
    //Populating the X axis
    for(int i = 0; i < rounds; i++)
    {
      text(i+1,(space/10)+space+(axisSize/rounds)*i,height-(space/2));
    }
}

//This is where you can hover over the Graph and shows the user the exact value on the bar
void barfeature()
{
  int lineDigit;
  
  if(mouseY > space && mouseY < space+axisSize)
  {
    stroke(200,255,200);
    fill(200,255,200);
    line(0, mouseY,width,mouseY);
    lineDigit = int(map(height-mouseY-space, 0, axisSize,0, 100));
    
    text(lineDigit,width-space,mouseY);
  }
}

//User inputs
 void keyPressed()
 {
   if(keyPressed)
   {
     if(key == 'b')
     {
       select.rewind();
       select.play();
       input = 0;
     }
     
     if(key == '1')
     {
       select.rewind();
       select.play();
       input = 1;
     }
   
     if(key == '2')
     {
       select.rewind();
       select.play();
       input = 2;
     }
     
     if(input == 2 && key == '.' || input == 2 && key == '>')
     {
       if(round < 11)
       {
         navRound.rewind();
         navRound.play();
         round++;
       }
     }
     
     if(input == 2 && key == ',' || input == 2 && key == '<')
     {
       if(round > 0)
       {
         navRound.rewind();
         navRound.play();
         round--;
       }
     }
   }
 }
