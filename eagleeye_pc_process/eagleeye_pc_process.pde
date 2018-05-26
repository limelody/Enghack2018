/*
INSTRUCTIONS:
1. Note the COM port of the Arduino attached to the PC. Set 'port' to also communicate with this port.
2. Upload the Arduino code to the Arduino attached to the PC.
3. Run this code. "data.txt" will be created inside this directory.
*/

import processing.serial.*;
Serial port;
PrintWriter output;

void setup() 
{
   port = new Serial( this, Serial.list()[0], 9600 ); //COFIG SERIAL LIST PORT FOR YOUR LAPTOP
   output = createWriter( "data.txt" );
}

void draw() 
{
    if (port.available() > 0 ) {
         String val = port.readString();
         if (val != null)
              output.println(val);
    }
}

//terminate process when key is pressed
void keyPressed() 
{ 
    output.flush();
    output.close();
    exit();
}
