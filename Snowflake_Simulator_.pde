// these are the tabs. They are only used switching screens, nothing else will be done to the different screens 
// so a function makes more sense to use than a class in this case. 

boolean draw;
boolean create;
int type;
int image;
int image2;
int image3; 
int image4; 
int image5; 
int f = 0;
Toggle toggleTemp = new Toggle(170, 270); 
Toggle toggleSat = new Toggle(170, 400); 
Button button1 = new Button(700, 100, image);
Button button2 = new Button(700, 200, image2);
Button button3 = new Button(700, 300, image3); 
Button button4 = new Button(700, 400, image4);
Button button5 = new Button(700, 500, image5);
PImage graph;
PImage thinPlates;
PImage dendrites;
PImage solidPrisms;
PImage hollowColumns;
PImage needles;
PImage solidPlates;
PImage sectoredPlates;
PImage Plates;
PImage columns;
PImage thinPlates2;
PImage dendrites2;
PImage solidPrisms2;
PImage hollowColumns2;
PImage needles2;
PImage solidPlates2;
PImage sectoredPlates2;
PImage Plates2;
PImage columns2;
PImage inspiration1;
PImage inspiration2;
boolean save;
boolean restart;
int pressCount; 
boolean iButton1;
boolean iButton2;
boolean iButton3;
boolean iButton4;
boolean iButton5;


void setup() {

  restart = true;
  save = false; 
  pressCount = 0; 
  iButton1 = false;
  iButton2 = false;
  iButton3 = false;
  iButton4 = false;
  iButton5 = false;

  pixelDensity(2);
  size(1024, 768);
  rectMode(CENTER);
  //I noticed this slight gradient while my friend was writing his essay on microsoft word 
  // I like the way that it looks so i decided to implement it in my project
  for (int i = 0; i < 21; i++) {
    fill(180-(3*i));
    stroke(180-(3*i));
    rect(width/2, (height/20)*i, width, height/20);
  }
  stroke(0);
  fill(10, 50, 150);
  textSize(50);
  text("Snowflake Simulator", 150, 150); 
  textSize(15);
  text("To use the Snowflake Simulator, slide the red squares to select a temperature and supersaturation.", 150, 200);
  text("Hover over the graph to make it larger", 150, 220);
  text("Click create to begin", 150, 240);
  text("By Evlynn Hofbauer", 150, 300);


  graph = loadImage("graph.jpg");
  graph.resize(0, 200);
  inspiration1 = loadImage("inspiration1.jpg");
  inspiration1.resize(0, 250);
  inspiration2 = loadImage("inspiration2.jpg");
  inspiration2.resize(0, 250);

  // these are the images used for the create screen 
  thinPlates = loadImage("thinPlates.png");
  thinPlates.resize(0, 250);  
  dendrites = loadImage("dendrites.png");
  dendrites.resize(0, 250); 
  solidPrisms = loadImage("solidPrisms.png");
  solidPrisms.resize(0, 250); 
  hollowColumns = loadImage("hollowColumns.png");
  hollowColumns.resize(250, 0);  
  needles = loadImage("needles.png");
  needles.resize(0, 250);  
  solidPlates = loadImage("solidPlates.png");
  solidPlates.resize(0, 250);
  sectoredPlates = loadImage("sectoredPlates.png");
  sectoredPlates.resize(0, 250); 
  Plates = loadImage("plates.png");
  Plates.resize(0, 250);
  columns = loadImage("columns.png");
  columns.resize(0, 250);

  //these are the images used for the draw screen, they are smaller 
  thinPlates2 = loadImage("thinPlates.png");
  thinPlates2.resize(0, 50);  
  dendrites2 = loadImage("dendrites.png");
  dendrites2.resize(0, 50); 
  solidPrisms2 = loadImage("solidPrisms.png");
  solidPrisms2.resize(0, 50); 
  hollowColumns2 = loadImage("hollowColumns.png");
  hollowColumns2.resize(50, 0);  
  needles2 = loadImage("needles.png");
  needles2.resize(0, 50);  
  solidPlates2 = loadImage("solidPlates.png");
  solidPlates2.resize(0, 50);
  sectoredPlates2 = loadImage("sectoredPlates.png");
  sectoredPlates2.resize(0, 50); 
  Plates2 = loadImage("plates.png");
  Plates2.resize(0, 50);
  columns2 = loadImage("columns.png");
  columns2.resize(0, 50);

  //these are the initial snoflake pictures with framed in a white outline 
  fill(200);
  stroke(200);
  rect(700, 500, 250, 230);
  image(inspiration1, 600, 400);
  rect(350, 500, 150, 230);
  image(inspiration2, 300, 400);
}

void draw() {

  //the buttons  
  rectMode(CENTER);
  stroke(0);

  // these if statements mus go on the top so that the colors are loading after the background does when the program loops around
  if (draw == true) {
    drawScreen();
  } else if (create == true) {
    createScreen();
  }

  // I used nested if statements to make hover highlighting of the tabs possible 
  if (mouseX > 700 && mouseX < 790 && mouseY > 0 && mouseY < 20) {
    //drawbutton
    fill(100);
    rect(750, 5, 100, 30, 7);
    fill(200, 200, 210);
    rect(850, 5, 100, 30, 7); 
    if (mousePressed == true) {
      //drawButton
      draw = false;
      create = true;
    }
  } else if (mouseX > 800 && mouseX < 890 && mouseY > 0 && mouseY < 20) {
    //createButton
    fill(100);    
    rect(850, 5, 100, 30, 7);
    fill(200, 200, 210);
    rect(750, 5, 100, 30, 7);  
    if (mousePressed == true) {
      //createButton
      f = 0;
      draw = true;
      create = false;
    }
  } else {
    fill(200, 200, 210);
    rect(750, 5, 100, 30, 7);       //create 
    rect(850, 5, 100, 30, 7);       //draw
  }



  //the text must always stay below the rects 
  textSize(15);
  fill(0);
  text("Create", 750 - 40, 15);
  text("Draw", 850 - 40, 15);



  ////////////////////////////////////////////////////////// TYPES /////////////////////////////////////////////////////////
  // this decides the type of snowflake being made
  // for this instance of the program xpos = 170 

  textSize(25);
  fill(200, 30, 30); 

  if (toggleTemp.xslide < ((toggleTemp.xpos + 110)/4*1) && toggleSat.xslide < ((toggleSat.xpos + 110)/4*2)) {
    //println("Thin Plates");
    type = 1;
  } else if (toggleTemp.xslide < ((toggleTemp.xpos + 110)/4*1) && toggleSat.xslide < ((toggleSat.xpos + 110)/4*4)) {
    //println("Dendriets");
    type = 2;
  }
  //second section of the graph
  else if (toggleTemp.xslide < ((toggleTemp.xpos + 110)/5*2) && toggleSat.xslide < ((toggleSat.xpos + 110)/4*1)) {
    //println("Solid Prisms");
    type = 3;
  } else if (toggleTemp.xslide < ((toggleTemp.xpos + 110)/5*2) && toggleSat.xslide < ((toggleSat.xpos + 110)/4*2)) {
    //println("Hollow columns");
    type = 4;
  } else if (toggleTemp.xslide < ((toggleTemp.xpos + 110)/5*2) && toggleSat.xslide < ((toggleSat.xpos + 110)/4*4)) {
    //println("Needles");
    type = 5;
  }
  // third vertical section of the graph
  else if (toggleTemp.xslide < ((toggleTemp.xpos + 110)/5*3) && toggleSat.xslide < ((toggleSat.xpos + 110)/4*1)) {
    //println("Solid Plates");
    type = 6;
  } else if (toggleTemp.xslide < ((toggleTemp.xpos + 110)/5*3) && toggleSat.xslide < ((toggleSat.xpos + 110)/4*2)) {
    //println("Thin Plates");
    type = 7;
  } else if (toggleTemp.xslide < ((toggleTemp.xpos + 110)/5*3) && toggleSat.xslide < ((toggleSat.xpos + 110)/4*3)) {
    //println("Sectored Plates");
    type = 8;
  } else if (toggleTemp.xslide < ((toggleTemp.xpos + 110)/5*3) && toggleSat.xslide < ((toggleSat.xpos + 110)/4*4)) {
    //println("Dendrietes");
    type = 9;
  }
  //fourth vertical section of the graph
  else if (toggleTemp.xslide < ((toggleTemp.xpos + 110)/5*4) && toggleSat.xslide < ((toggleSat.xpos + 110)/4*1)) {
    //println("Plates");
    type = 10;
  } else {
    //println("Columns");
    type = 11;
  }
} 



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void createScreen() { 
  for (int i = 0; i < 21; i++) {
    fill(180-(3*i));
    stroke(180-(3*i));
    rect(width/2, (height/20)*i, width, height/20);
  }
  //rects for the tab colors 
  fill(100, 130, 250);
  rect(750, 5, 100, 30, 7);
  fill(200, 200, 210);
  rect(850, 5, 100, 30, 7);
  //I noticed this slight gradient while my friend was writing his essay on microsoft word 
  // I like the way that it looks so i decided to implement it in my project


  //display temperature and super saturation toggles
  fill(0);
  stroke(0);
  textSize(18); 
  text("Temperature", 100, 250);
  toggleTemp.display(); 
  toggleTemp.move();
  stroke(0); 
  fill(0);
  text("Supersaturation", 100, 380);
  toggleSat.display();
  toggleSat.move();

  //display snowflake preview box
  stroke(0);
  fill(255); 
  rect(550, 300, 350, 500);

  //display save button
  fill(200, 30, 30);
  rect(850, 200, 120, 50, 7);
  fill(255);
  text("Save", 825, 210);
  if (mousePressed == true && mouseX > 790 && mouseX < 910 && mouseY > 175 && mouseY < 225) {
    save = true; 
    fill(20, 30, 30);
    rect(850, 200, 120, 50, 7);
  }


  //the restart button is so that the user can start another snowflake, then save that snow flake to the next button 
  fill(30, 30, 150);
  rect(850, 250, 120, 50, 7);
  fill(255);
  text("Restart", 825, 260);
  if (mousePressed == true && mouseX > 790 && mouseX < 910 && mouseY > 225 && mouseY < 275) {
    restart = true; 
    fill(30, 30, 20);
    rect(850, 250, 120, 50, 7);
  }

  text("To use the Snowflake Simulator, ", 10, 60);
  text("-Select a temperature by siling the", 10, 100); 
  text("temperature and supersaturation toggles.", 10, 120);
  text("-Hover over the graph to make it larger", 10, 160);
  text("-Click restart before clicking save after to create more buttons", 10, 600);

  // the different snowflake types are displayed here so that 
  // they are only being displayed on this page 
  textSize(25);
  fill(200, 30, 30); 

  if (type == 1 || type == 7) { 
    text("Thin Plates", 400, 500);
    image(thinPlates, 400, 100);
  }
  if (type == 2 || type == 9) { 
    text("Dendriets", 400, 500);
    image(dendrites, 400, 100);
  }
  if (type == 3) { 
    text("Solid Prisms", 400, 500);
    image(solidPrisms, 400, 100);
  }
  if (type == 4) { 
    text("Hollow columns", 400, 500);
    image(hollowColumns, 400, 100);
  }
  if (type == 5) { 
    text("Needles", 400, 500);
    image(needles, 400, 100);
  }
  if (type == 6) { 
    text("Solid Plates", 400, 500);
    image(solidPlates, 400, 100);
  }
  if (type == 8) { 
    text("Sectored Plates", 400, 500);
    image(sectoredPlates, 400, 100);
  }
  if (type == 10) {
    text("Plates", 400, 500);
    image(Plates, 400, 100);
  }
  if (type == 11) {
    text("Columns", 400, 500);
    image(columns, 400, 100);
  }


  //these are for the display of buttons that the user can add using the design page 
  // restart will keep the user from accedently creating all the buttons in under one second.
  if (restart == true && save == true && pressCount == 0) {
    iButton1 = true;
    pressCount++;
    print("button one created");
    restart = false;
    save = false;
  } else if (restart == true && save == true && pressCount == 1) {
    iButton2 = true;
    pressCount++;
    print("button two created");
    restart = false;
    save = false;
  } else if (restart == true && save == true && pressCount == 2) {
    iButton3 = true;
    pressCount++;
    print("button three created");
    restart = false;
    save = false;
  } else if (restart == true && save == true && pressCount == 3) {
    iButton4 = true;
    pressCount++;
    print("button four created");
    restart = false;
    save = false;
  } else if (restart == true && save == true && pressCount == 4) {
    iButton5 = true;
    pressCount++;
    print("button five created");
    restart = false;
    save = false;
    print("Max number of buttons have been created");
  }


  if (mouseX > 550 && mouseY > 560) {
    graph = loadImage("graph.jpg");
    image(graph, 280, 200);
    graph.resize(0, 500);
  } else {
    image(graph, 700, 560);
    graph = loadImage("graph.jpg");
    graph.resize(0, 200);
  }
}

void drawScreen() {
  //f keeps the background from continuously being redrawn 
  // this f thing took a while to come up with and would have solved the problem in another one of my programs 
  if (f == 0) {
    for (int i = 0; i < 21; i++) {
      fill(180-(3*i));
      stroke(180-(3*i));
      rect(width/2, (height/20)*i, width, height/20);
    }

    //rects for the tab colors 
    fill(100, 130, 250);
    rect(850, 5, 100, 30, 7);
    fill(200, 200, 210);
    rect(750, 5, 100, 30, 7);


    //change button color
    fill(255);
    stroke(0);
    rect(350, 380, 500, 650, 7);
    f = 1;
  }

  // this just draws the background for the deactivate button made in the Button class
  //size(1024,768);
  stroke(0);
  fill(150, 100, 100);
  rect(912, 384, 224, 600);
  fill(0);
  text("Dactivate", 862, 340);
  text("current", 862, 370);
  text("buttton", 862, 400);

  text("Click deactivate current button between selecting buttons to avoid overlapping ", 10, 740);

  //this fixes the problem that the buttons are quickly appering then not getting redrawn
  //the user still has to switch to the draw screen after clicking save.....
  if (iButton1 == true) {
    if (type == 1 || type == 7) { 
      image = 1;
    }
    if (type == 2 || type == 9) { 
      image = 2;
    }
    if (type == 3) { 
      image = 3;
    }
    if (type == 4) { 
      image = 4;
    }
    if (type == 5) { 
      image = 5;
    }
    if (type == 6) { 
      image = 6;
    }
    if (type == 8) { 
      image = 7;
    }
    if (type == 10) {
      image = 8;
    }
    if (type == 11) {
      image = 9;
    } 
    iButton1 = false;
  }
  button1.display(image);
  button1.clicked(image);
  if (iButton2 == true) {
    if (type == 1 || type == 7) { 
      image2 = 1;
    }
    if (type == 2 || type == 9) { 
      image2 = 2;
    }
    if (type == 3) { 
      image2 = 3;
    }
    if (type == 4) { 
      image2 = 4;
    }
    if (type == 5) { 
      image2 = 5;
    }
    if (type == 6) { 
      image2 = 6;
    }
    if (type == 8) { 
      image2 = 7;
    }
    if (type == 10) {
      image2 = 8;
    }
    if (type == 11) {
      image2 = 9;
    } 
    iButton2 = false;
  }
  button2.display(image2);
  button2.clicked(image2);
  if (iButton3 == true) {
    if (type == 1 || type == 7) { 
      image3 = 1;
    }
    if (type == 2 || type == 9) { 
      image3 = 2;
    }
    if (type == 3) { 
      image3 = 3;
    }
    if (type == 4) { 
      image3 = 4;
    }
    if (type == 5) { 
      image3 = 5;
    }
    if (type == 6) { 
      image3 = 6;
    }
    if (type == 8) { 
      image3 = 7;
    }
    if (type == 10) {
      image3 = 8;
    }
    if (type == 11) {
      image3 = 9;
    } 
    iButton3 = false;
  }
  button3.display(image3);
  button3.clicked(image3);
  if (iButton4 == true) {
    if (type == 1 || type == 7) { 
      image4 = 1;
    }
    if (type == 2 || type == 9) { 
      image4 = 2;
    }
    if (type == 3) { 
      image4 = 3;
    }
    if (type == 4) { 
      image4 = 4;
    }
    if (type == 5) { 
      image4 = 5;
    }
    if (type == 6) { 
      image4 = 6;
    }
    if (type == 8) { 
      image4 = 7;
    }
    if (type == 10) {
      image4 = 8;
    }
    if (type == 11) {
      image4 = 9;
    }   
    iButton4 = false;
  }
  button4.display(image4);
  button4.clicked(image4);
  if (iButton5 == true) {
    if (type == 1 || type == 7) { 
      image5 = 1;
    }
    if (type == 2 || type == 9) { 
      image5 = 2;
    }
    if (type == 3) { 
      image5 = 3;
    }
    if (type == 4) { 
      image5 = 4;
    }
    if (type == 5) { 
      image5 = 5;
    }
    if (type == 6) { 
      image5 = 6;
    }
    if (type == 8) { 
      image5 = 7;
    }
    if (type == 10) {
      image5 = 8;
    }
    if (type == 11) {
      image5 = 9;
    } 
    iButton5 = false;
  } 
  button5.display(image5);
  button5.clicked(image5);
}

class Toggle {
  float xpos;
  float ypos;
  float xslide = xpos + 150;
  //  string type = "Default"; 

  Toggle(float xpos_, float ypos_) {
    xpos = xpos_;
    ypos = ypos_;
  }

  void display() {
    fill(0);
    stroke(0);
    rect(xpos, ypos, 250, 5);
    //left rect
    rect(xpos - 125, ypos, 5, 30);
    //right rect
    rect(xpos + 125, ypos, 5, 30);
    // the slider rect
    fill(200, 30, 30);
    stroke(255, 30, 30);
    rect(xslide, ypos, 30, 30);
  } 

  void move() {
    if (mouseX < (xpos + 110) && mouseX > (xpos - 110) && mouseY < (ypos + 15) && mouseY > (ypos - 15) && mousePressed == true) {
      xslide = mouseX;
    }
  }
}


class Button {
  int xpos;
  int ypos;
  int imagex = 0;
  boolean active = false; 
  Button(int xpos_, int ypos_, int imagex_) {
    xpos = xpos_;
    ypos = ypos_;
    imagex = imagex_;
  }

  void display(int imagex) {
    //for(int i = 0; i < 6; i++){
    //  int x = i 
    if (imagex == 1) { 
      image(thinPlates2, xpos, ypos);
    }
    if (imagex == 2) { 
      image(dendrites2, xpos, ypos);
    }
    if (imagex == 3) { 
      image(solidPrisms2, xpos, ypos);
    }
    if (imagex == 4) { 
      image(hollowColumns2, xpos, ypos);
    }
    if (imagex == 5) { 
      image(needles2, xpos, ypos);
    }
    if (imagex == 6) { 
      image(solidPlates2, xpos, ypos);
    }
    if (imagex == 7) { 
      image(sectoredPlates2, xpos, ypos);
    }
    if (imagex == 8) {
      image(Plates2, xpos, ypos);
    }
    if (imagex == 9) {
      image(columns2, xpos, ypos);
    }
  }

  void clicked(int imagex) {
    if (mousePressed == true && mouseX < (xpos + 60) && mouseX > (xpos - 60) && mouseY < (ypos + 60) && mouseY > (ypos - 60)) {
      active = true;
      print("click to draw on the screen now!!!"); 
      //this is so that the current drawing tool does not change if the user changes the other page.
    }
    if (mousePressed == true && mouseX > (800)) {
      active = false;
      print("click to draw on the screen now!!!"); 
      //this is so that the current drawing tool does not change if the user changes the other page.
    }
    // the drawing place from the draw page - rect(350,380,500,650,7);
    if (active == true && mousePressed == true && mouseX < (350 + 170) && mouseX > (350 - 250) && mouseY < (380 + 250) && mouseY > (380 - 325)) {
      if (imagex == 0) {
        print("click save on the create screen");
      }
      if (imagex == 1) { 
        image(thinPlates2, mouseX, mouseY);
      }
      if (imagex == 2) { 
        image(dendrites2, mouseX, mouseY);
      }
      if (imagex == 3) { 
        image(solidPrisms2, mouseX, mouseY);
      }
      if (imagex == 4) { 
        image(hollowColumns2, mouseX, mouseY);
      }
      if (imagex == 5) { 
        image(needles2, mouseX, mouseY);
      }
      if (imagex == 6) { 
        image(solidPlates2, mouseX, mouseY);
      }
      if (imagex == 7) { 
        image(sectoredPlates2, mouseX, mouseY);
      }
      if (imagex == 8) {
        image(Plates2, mouseX, mouseY);
      }
      if (imagex == 9) {
        image(columns2, mouseX, mouseY);
      }
    }
  }
}




/*////////////////////////////////////////////////////////////////////////////////////////////////
 
 pictures cited 
 
 http://www.its.caltech.edu/~atomic/snowcrystals/class/class-old.htm
 
 http://www.cabinetmagazine.org/issues/29/wertheim.php
 */