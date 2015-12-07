class Fight
{
  //fields
  int jabs;
  int strong;
  int totalJabs;
  int totalPower;
  int total;
  int rounds;
  int dataNum; 
  float x, y;
  float totalPunches;
  
  String pac = "pac.csv";
  String marq = "marq.csv";
  
  //Declaring 2 2D arrays to store the data
  float[][] pacData = new float[rounds][dataNum]; 
  float[][] marqData = new float[rounds][dataNum];
  
  //Colour for both fighters
  color corner;
  
  int blue;
  int red;
  int green;
  
  //Constructors;
  Fight()
  {
    //This is also to avoid hard coding
    jabs = 0;
    strong = 1;
    totalJabs = 2;
    totalPower = 3;
    total = 4;
    
    //these values are for making the 2D arrays
    dataNum = 5;
    rounds = 12;
    
    pacData = readData(pac);
    marqData = readData(marq);
  }
  
  //Function to read Pac's data
  float[][] readData(String s)
  {  
  
  ArrayList<Float> List = new ArrayList<Float>();
  
  //Creating a 2d array
  float[][] f = new float[rounds][dataNum];
  
  //loading csv file
  String[] score = loadStrings(s);
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
}


