/* A visualisation program for a boxing match
   Author: Ka Yu Chan
*/

void setup()
{ 
  size(500,500);
  background(0);
}

  int rounds;
  int dataNum; 

void draw()
{
  int start = 0;
  int input = 0;
  
  rounds = 12;
  dataNum = 4;
  
  float[][] pacData = new float[rounds][dataNum]; 
  float[][] marqData = new float[rounds][dataNum];
  
  do
  {
    pacData = readPac();
    marqData = readMarq();
    start++;
  }while(start<1);
  
  //Drawing a menu
  if(input == 0)
  {
    //Drawing a box with text in it
    textSize(width/20);
    fill(255,0,0);
    text("Pacquiao vs Marquez 3", int(width/5) , 50);
    fill(0);
    stroke(255);
    rect(width/5,height/2,3*(width/5),height/3);
  }
  
  //Draw barchart
  if(input == 1)
  {
  }
  
  //Draw piechart
  if(input == 2 )
  {
 
  
  
  //Test to see if data is loaded
  for(int i = 0; i<dataNum;i++)
  {
    println(marqData[11][i]);
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
