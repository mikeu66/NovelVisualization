PFont Stencil;
int fontSize = 20;
color col1 = 0;
color col2 = 255;
color col3 = color (52, 143, 235);

// list of the words in the book and a string class for each individual word
String[] words;
String word;

// variables that make the click function work, ensures same word is not chosen in each word cloud, and sets font size
int click = 1;
IntList indexlist;
int size;


void setup(){
  size(700, 600); 
  Stencil = createFont("Stencil", fontSize);
  textFont(Stencil);
  words = loadStrings("uniquewords.txt");
}

void draw(){
   background(120);
   float x = 0;
   float y = 28;
   indexlist = new IntList();
  
  // if clicked a new word cloud appears
  while (click == 1) {
    int index = int(random(words.length));
    
    //if word has already been used find a new one
    while (indexlist.hasValue(index) == true) {
      index = int(random(words.length));
    }
    indexlist.append(index);
    word = words[index];
    
    // based on word size assign text size and color.
    if (word.length() < 5) {
      size = 40;
      textSize(size);
      fill(col1);
    }
    if (word.length() > 4 && word.length() < 8) {
      size = 30;
      textSize(size);
      fill(col2);
    }
    if (word.length() > 7) {
      size = 20;
      textSize(size);
      fill(col3);
    }
    
    //Based upon text width determine if the word goes too far
    if (x + textWidth(word) > width - 8) {
      x = 8;
      y += 40;
    }
    
    // Make sure the words do not go too far down
    if (y < height - 8) {
      textAlign(LEFT);
      text(word, x, y);
    }
    
    // change x position and make common spacing
    x = x + textWidth(word) + 8;
    
    // if it goes too far down stop the loop
    if (y > height - 8) {
      click = 0;
      noLoop();
    }
  }
}

// redraw the word cloud if clicked, make click = 1 so the loop works
void mouseClicked() {
  click = 1;
  redraw();
}
