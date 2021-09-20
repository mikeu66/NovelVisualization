import java.util.Random;

String[] lines;
int num_words;
int largest_frequency;
String[] values;
color[] colors = {#9B4949,#F0DB88, #CFF581, #81F5D1, #F581E0};

void setup(){
 size(690, 600);
 lines = loadStrings("wordfrequency.txt");
 num_words = lines.length;
 background(255);
 fill();
}

void draw(){  
}

void fill() {
 values = lines[0].split(": ");
 largest_frequency = Integer.parseInt(values[1]);


 for(int k = 0; k < num_words; k++) {
   values = lines[k].split(": ");
   float width = Integer.parseInt(values[1]);
   width = width / (largest_frequency / 690);
   fill(colors[(k % 4)]);
   rect(350 - (width/2), 600 - ((k+1) * (600 / num_words)), width, (600 / num_words));
 }
}
