setup = function() {
    size(600, 400);
};

//Background Images

var Bedroom = loadImage("https://i.pinimg.com/736x/ad/74/36/ad74366b6f54153266ad23ff5883744d.jpg");

var alleyway = loadImage("https://img.freepik.com/premium-photo/group-zombies-attacking-lone-survivor-dark-alleyway_997534-55773.jpg");

var windowImage = loadImage("https://img.freepik.com/free-photo/spooky-zombie-hands-window_23-2149130240.jpg");

var dogImage = loadImage("https://cdn.glitch.global/5cb7a3f5-e6a9-4a61-87bf-75b3a192484c/Screenshot%202025-03-04%20at%201.14.46%20PM.png?v=1741112092287");

var biteImage = loadImage("https://i.dailymail.co.uk/1s/2023/02/27/08/68119959-11797365-image-a-115_1677486228920.jpg");

var abandonedBuilding = loadImage("https://i.pinimg.com/736x/35/ea/00/35ea00ec65797815cf7be9eb8ed5eafd.jpg");

//Variable Declarations
//var click = 0;
//var blacktextbox = color(0, 0, 0);
//var knifecolor = color(194, 105, 105);
//var dogcolor = color(129, 181, 148);
//var cancolor = color(141, 129, 181);

var sceneImage = Bedroom;
var sceneText = "You wake up in what appears to be a regular day until you hear \n a commotion outside. [Click to continue]";

var zombieobjects = 0;
var knifechoice = 0;
var canchoice = 0;
var dogchoice = 0;

var zombietarget = 0;
var targetColor = color(255, 0, 0);
var clickedColor = get(mouseX, mouseY);

var x = 0; // zombie position
var y = 0;
var speed = 9;

var canchoice1 = 0;
var canchoice2 = 0;

var knifechoice1 = 0;
var knifechoice2 = 0;

var dogchoice1 = 0;
var dogchoice2 = 0;
var dogchoice3 = 0;


draw = function(){
  fill(255, 255, 255);
  
  drawScene();
  
  //1st scene
  if(mousePressed && sceneImage == Bedroom){
  zombieobjects = 1;}
  
  //2nd scene
  if(zombieobjects == 1){
   textSize(100);
   fill(255,255,255);
   sceneImage = windowImage;
   textSize(20);
   sceneText = "You look out the window and see a ZOMBIE apocalypse! \n Quick, grab one of the following! [Press 'k', 'c', or 'd']";
   noStroke();
   fill(194, 105, 105);
   rect(15, 80, 180, 190); //knife
   fill(129, 181, 148);
   rect(220, 80, 150, 190); //can
   fill(141, 129, 181);
   rect(400, 80, 175, 190); //dog
   fill(255, 255, 255);
   textSize(150);
   text("🔪 🥫 🐕", 30, 230);
  };
    
  //if pick knife
  if(keyPressed){
     if(key == 'k'){
       sceneImage = alleyway;   
       sceneText = "Wow, did you just seriously leave your dog? Looks like \n karma caught up with you.";
       knifechoice = 1;
       zombieobjects = 0; 
    }
  };
  
  if(knifechoice == 1){
  QuestionBox();
   fill(0, 0, 0);
   textSize(20);
   text("You sure are in a pickle. There are zombies all \n around you, here are your options:", 70, 75);
   text("Try to throw your knife at zombies.", 70, 190);
   text("Try to quietly sneak past them.", 70, 290);
  
  if(mousePressed && mouseY < 220){
  knifechoice1 = 1;
  }else(knifechoice1 == 0);
  
  if(mousePressed && mouseY > 220){
  knifechoice2 = 1;
  }else(knifechoice2 == 0);
  }
  
  if(knifechoice2 == 1){
  knifechoice = 0;
  sceneImage = biteImage;
  textSize(100);
  fill(255, 0, 0);
  text("YOU DIE", 60, 90);
  sceneText = "Well, that failed miserably. Your knife fell out of your pocket, \n redirecting all the zombies' attention towards you.";
  }
  
  if(knifechoice1 == 1){
   zombietarget = 1;
   knifechoice = 0;
   sceneText = "Ok, you have ONE job. HIT THE RED TARGET \n [This feature is currently being developed, so it won't work!]"
    textSize(150);
    text("🧟‍♂️", x, 200);
    fill(targetColor);
    noStroke();
    ellipse(x + 75, 190, 30, 30); //red target
    
    if (x < 25) {
        speed = 9;
    } 
      if (x > 365) {
        speed = - 9;
    }
  }

 
 
//hit target
  if(zombietarget == 1){
  if(mousePressed){
    /*
    clickedColor = get(mouseX, mouseY);
    if(clickedColor == targetColor){
    textSize(100);
      text("YAY you win", 25, 200);
    }
    
    else{
    textSize(100);
      text("You die", 25, 200);
    }
    */
  }
  }

  
  //if pick can
  if(keyPressed){
     if(key == 'c'){
       sceneImage = alleyway;   
       sceneText = "Wow, did you just seriously leave your dog? Looks like \n karma caught up with you.";
       canchoice = 1;
       zombieobjects = 0;
     }
  };
  
  if(canchoice == 1){
  QuestionBox();
   fill(0, 0, 0);
   textSize(20);
   text("You sure are in a pickle. There are zombies all \n around you, here are your options:", 70, 75);
   text("Offer can as peace offering", 70, 190);
   text("Throw can as a distraction while you try to \n surreptitiously run past them.", 70, 280);
  
  if(mousePressed && mouseY < 220){
  canchoice1 = 1;
  }else(canchoice1 == 0);
  
  if(mousePressed && mouseY > 220){
  canchoice2 = 1;
  }else(canchoice2 == 0);
  };
    
  if(canchoice1 == 1){
  canchoice = 0;
  sceneImage = biteImage;
  textSize(100);
  fill(255, 0, 0);
  text("YOU DIE", 60, 90);
  sceneText = "The zombies are tempted by your offer until they see that it’s a \n can of tomato sauce and brains are way more delicious!";
  }
  
  if(canchoice2 ==1){
  canchoice = 0;
  sceneImage = abandonedBuilding;
  sceneText = " Well that works but now you no longer have food. \n You survive.. for now. [To be continued]";
  }
  
  //if pick dog
  if(keyPressed){
    if(key == 'd'){
     sceneImage = alleyway;
     sceneText = "Ok, you face your first challenge. But fear not, you have your \n trusted companion with you."
     dogchoice = 1;
     zombieobjects = 0;
    }
  }
  
  if(dogchoice == 1){
  QuestionBox2();
  fill(0, 0, 0);
   textSize(20);
   text("You sure are in a pickle. There are zombies all \n around you, here are your options:", 70, 72);
   text("Command your dog to attack!", 70, 165);
   text("Fight them with.. your fists? ", 70, 235);
   text("Run as fast as you can.", 70, 305);
  
  if(mousePressed && mouseY < 190){
   dogchoice1 = 1;
   }else(dogchoice1 == 0);
   
   if(mousePressed && 200 < mouseY && mouseY < 260){
   dogchoice2 = 1;
   }else(dogchoice2 == 0);
   
   if(mousePressed && mouseY > 270){
   dogchoice3 = 1;
   }else(dogchoice3 == 0);
   
   };
  
  if(dogchoice1 == 1){
   dogchoice = 0;
   sceneImage = biteImage;
   sceneText = "You’ve only ever taught your dog how to sit..";
   textSize(100);
   fill(255, 0, 0);
   text("YOU DIE", 60, 90);
   }

   if(dogchoice2 == 1){
   dogchoice = 0;
   sceneImage = biteImage;
   textSize(100);
   fill(255, 0, 0);
   text("YOU DIE", 60, 90);
   sceneText = "You think you’re a fighter? They are ZOMBIES!";
   }

  if(dogchoice3 == 1){
   dogchoice = 0;
   sceneImage = dogImage;
   sceneText = "Yay! You and your dog survive the apocalypse. \n [More to come]";
   }
    
     x = x + speed;
    
   };

var drawScene = function(){
    image(sceneImage, 0, 0);
    
    fill(0,0,0);
    rect(0, 350, 600, 100);
      
    fill(255,255,255);
    textSize(20);
   
   text(sceneText, 10, 370);   
    
};

var QuestionBox = function(){
   fill(255, 255, 255, 180);
   rect(55, 40, 480, 80);
   rect(55, 150, 480, 70); 
   rect(55, 250, 480, 70);
};

var QuestionBox2 = function(){
   fill(255, 255, 255, 180);
   rect(55, 40, 480, 70);
   rect(55, 130, 480, 60); 
   rect(55, 200, 480, 60);
   rect(55, 270, 480, 60);
}