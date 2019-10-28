Flower myFlower1;  // the first instance of the Flower class
Flower myFlower2;
Flower myFlower3;
Flower myFlower4;

void setup() {
  size(1000, 1000);
  background(#43AF76);

  int _r1= 60; //Blomsternes størrelse.
  int _r2=20; // Størrelsen på myFlower4
  int _petals=7; //Hvormange blade blomsten har.
  float _x=width/2; //Start værdi for x.
  float _y=height/2; //Start værdi for y.
  int _pc=#FFA000; //Bladenes farve

  myFlower1 = new Flower(_r1, _petals, _x+200, _y, _pc); //myFlower1 bliver lavet til et object, når new bliver lavet. New er en command, der tildeler objektet hukommelse.
  myFlower2 = new Flower(_r1, _petals, _x-200, _y, _pc);
  myFlower3 = new Flower(_r1, _petals, _x, _y, _pc);
  myFlower4 = new Flower(_r2, _petals, _x, _y, _pc);
}

void draw() {
  background(#43AF76);//Background for at fjerne trail.
  myFlower1.display(); //Tegner blomsten hvert frame.
  myFlower2.display();
  myFlower3.display();

  myFlower1.movement();//Bevæger blomsten.
  myFlower2.movement();
  myFlower3.movement();

  myFlower1.collition(myFlower2); //myFlower1 collition with 2 and 3
  myFlower1.collition(myFlower3);
  myFlower2.collition(myFlower1); //myFlower2 collition with 1 and 3
  myFlower2.collition(myFlower3);
  myFlower3.collition(myFlower2); //myFlower3 collition with 1 and 2
  myFlower3.collition(myFlower1);
  
  myFlower4.follow();
  
}
