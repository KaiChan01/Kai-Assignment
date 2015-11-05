void setup()
{ 
  size(500,500);
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
  if(input == 255)
  {
    background(255);
  }
  
  
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
