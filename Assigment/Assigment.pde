/* A visualisation program for a boxing match
   Author: Ka Yu Chan
*/

void setup()
{ 
  size(500,500);
  //This is here to bring up the menu
  input = 0;
  //This lets the program to read the data once
  start = 0;
}

  //Gobal variables
  int rounds;
  //There are 4 columns of data to be stored
  int dataNum; 
  //This variable is for storing user inputs
  int input = 0;
  int start;
  
  //Used to draw the Xand Y axis for barchart
  int smallSpace;
  int space;
  int axisSize;
  int gap;
  
  //Declaring 2 2D arrays to store the data
  float[][] pacData = new float[rounds][dataNum]; 
  float[][] marqData = new float[rounds][dataNum];
  
  //Colour for both fighters
  color pacRed;
  color marqBlue;

void draw()
{
  pacRed = color(255,0,0);
  marqBlue = color(0,0,255);
  
  //Declaring some values
  rounds = 12;
  dataNum = 4;
  
  //Space is for the distance from the edge of the window
  space = width/10;
  smallSpace = space/10;  
  //Size of the x and Y axis
  axisSize = width - space - space;
  gap = axisSize/10;
  
  //This will make the data to be read in once
  do
  {
    pacData = readPac();
    marqData = readMarq();
    start++;
  }while(start<1);
  
  //Drawing a menu
  if(input == 0)
  {
    background(0);
    //Title
    textSize(width/20);
    fill(255,0,0);
    textAlign(CENTER);
    text("Pacquiao vs Marquez 3", width/2 , space);
    
    //Drawing a box with text in it
    
    stroke(255);
    fill(0);
    rect(width/5,height/2,3*(width/5),height/2-space);
    
    //Option 1
    textSize(width/31);
    fill(255);
    text("1. A Barchart displaying total number \nof punches thrown by both fighters.",width/2,height/2+(4*smallSpace));
    
    //Option 2
    text("2. A Pie Chart showing the types of \npunches landed/thrown between \nboth fighters.",width/2,height/2+(16*smallSpace));
  }
  
  //Draw barchart
  if(input == 1)
  {
    //Size for box
    int boxes = space/5;
    
    //X and Y axis drawn
    background(0);
    line(space,height-space,width-space,height-space);
    line(space,height-space,space,space);
    fill(255);
    text("0",space-gap,height-space);
    textAlign(CENTER);
    text("Press B to return to the menu",width/2,space);
    
    //drawing boxes on to show colours which represent fighters
    fill(pacRed);
    textAlign(LEFT);
    text("Pacquiao",width-(2*space)+boxes+smallSpace,2*boxes);
    rect(width-2*space,boxes,boxes,boxes);
    
    fill(marqBlue);
    textAlign(LEFT);
    text("Marquez",width-(2*space)+boxes+smallSpace,5*boxes);
    rect(width-2*space,4*boxes,boxes,boxes);
    
    //Drawing the little lines on the graph
    int numbers = 100;
    for(int i = 0; i < 10; i++)
    {
      line(space,space+(gap*i),space-10,space+(gap*i));
      fill(255);
      text(numbers,space-gap, space+(gap*i));
      numbers -= 10;
    }
    
    for(int i = 0; i < rounds; i++)
    {
      text(i+1,(space/10)+space+(axisSize/12)*i,height-(space/2));
    }

    showPac();
    showMarq();
  }
  
  //Draw piechart
  if(input == 2 )
  {
  }  
}


void showPac()
{
  int barSize = width/50;
  space = width/10;
  
  for(int i = 0; i < rounds; i++)
  {
    fill(pacRed);
    rect(space+(axisSize/12)*i,height-space,barSize,-map(pacData[i][3],0,100,0,axisSize));
  }
}

void showMarq()
{
  int barSize = width/50;
  space = (width/10);
  
  for(int i = 0; i < rounds; i++)
  {
    fill(marqBlue);
    rect(barSize+space+(axisSize/12)*i,height-space,barSize,-map(marqData[i][3],0,100,0,axisSize));
  }
}


//Function to read Pac's data
float[][] readPac()
{  
  rounds = 12;
  dataNum = 4;
  
  ArrayList<Float> pac = new ArrayList<Float>();
  //ArrayList<Float> marq = new ArrayList<float>();
  
  //Creating a 2d array
  float[][] f = new float[rounds][dataNum];
  
  //loading csv file
  String[] score = loadStrings("pac.csv");
  int row = 0;
  
  for(String p:score)
  {
    // line one is stored in here now e.g 2 2 2 2
    String[] temp = split(p, ","); 
    
    for(int i = 0; i<dataNum;i++)
    {
      f[row][i] = Float.parseFloat(temp[i]);
    }
    row++;
  }
  
  return f;
 }
 
 
 //Function to read marq's data
 float[][] readMarq()
{  
  rounds = 12;
  dataNum = 4;
  
  ArrayList<Float> marq = new ArrayList<Float>();
  
  //Creating a 2d array
  float[][] f = new float[rounds][dataNum];
  
  //loading csv file
  String[] score = loadStrings("marq.csv");
  int row = 0;
  
  for(String p:score)
  {
    // line one is stored in here now e.g 2 2 2 2
    String[] temp = split(p, ",");
    
    for(int i = 0; i<dataNum;i++)
    {
      f[row][i] = Float.parseFloat(temp[i]);
    }
    row++;
  }
  
  return f;
 }
 
 void keyPressed()
 {
   if(keyPressed)
   {
     if(key == 'b')
     {
       input = 0;
     }
     
     if(key == '1')
     {
       input = 1;
     }
   
     if(key == '2')
     {
       input = 2;
     }
   }
 }
