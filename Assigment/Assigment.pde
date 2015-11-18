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
  int space;
  int axisSize;
  
  //Declaring 2 2D arrays to store the data
  float[][] pacData = new float[rounds][dataNum]; 
  float[][] marqData = new float[rounds][dataNum];
  

void draw()
{
  //Declaring some values
  rounds = 12;
  dataNum = 4;
  space = width/10;
  axisSize = width - space - space;
  
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
    text("Pacquiao vs Marquez 3", int(width/5) , 50);
    
    //Drawing a box with text in it
    
    stroke(255);
    fill(0);
    rect(width/5,height/2,3*(width/5),height/2-50);
    
    //Option 1

    textSize(width/31);
    fill(255);
    text("1. Barchart displaying total number \nof punches thrown by both fighters.",int(width/5+10),height/2+20);
  }
  
  //Draw barchart
  if(input == 1)
  {
    
    //X and Y axis drawn
    background(0);
    line(space,height-space,width-space,height-space);
    line(space,height-space,space,space);
    fill(255);
    text("0",space-40,height-space);
    
    int numbers = 100;
    for(int i = 0; i < 10; i++)
    {
      line(space,space+(40*i),space-10,space+(40*i));
      fill(255);
      text(numbers,space-40, space+(40*i));
      numbers -= 10;
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
  int barSize = 10;
  space = width/10;
  
  for(int i = 0; i < rounds; i++)
  {
    fill(255,0,0);
    //almost there
    rect(space+(axisSize/12)*i,height-space,barSize,-map(pacData[i][3],0,100,0,axisSize));
  }
}

void showMarq()
{
  int barSize = 10;
  space = (width/10);
  
  for(int i = 0; i < rounds; i++)
  {
    fill(0,0,255);
    //almost there
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
