Object myFlower1;  // the first instance of the Flower class
Object myFlower2;
Object myFlower3;
Object myRect;

int _pc=#FFA000; //Bladenes farve
int _petals=7; //Hvormange blade blomsten har.

int num = 20; //num er blomstens størrelse. Den er equal til _r2, som er 20.
float[] x = new float[num]; //myFlower4's x-værdi i arrayet.
float[] y = new float[num]; //myFlower4's y-værdi i arrayet.
Object[] myRectArray = new Object [num];

Object [] Blomst;
int BlomstTrail = 20;
float [] xBlomst = new float [BlomstTrail];
float [] yBlomst = new float [BlomstTrail];
int indexPos = 0;

void setup() {
  size(1000, 1000);
  background(#43AF76);

  int _r1= 60; //Blomsternes størrelse.
  int _r2=20; // Størrelsen på myFlower4
  float _x=width/2; //Start værdi for x.
  float _y=height/2; //Start værdi for y.

  myFlower1 = new Object(_r1, _petals, _x+200, _y, _pc); //myFlower1 bliver lavet til et object, når new bliver lavet. New er en command, der tildeler objektet hukommelse.
  myFlower2 = new Object(_r1, _petals, _x-200, _y, _pc);
  myFlower3 = new Object(_r1, _petals, _x, _y, _pc);
  myRect = new Object(_r2, 0, _x, _y, _pc);
  
  Blomst = new Object[BlomstTrail];
  
  for(int i = 0; i < BlomstTrail; i++) {
    Blomst[i] = new Object(_r1, _petals, _x+200, _y, _pc);
  }
}

void draw() {
  background(#43AF76);//Background for at fjerne trail.
  myFlower1.displayFlower(); //Tegner blomsten hvert frame.
  myFlower2.displayFlower();
  myFlower3.displayFlower();

  myFlower1.movement();//Bevæger blomsten.
  myFlower2.movement();
  myFlower3.movement();

  myFlower1.collition(myFlower2); //myFlower1 collition with 2 and 3
  myFlower1.collition(myFlower3);
  myFlower2.collition(myFlower1); //myFlower2 collition with 1 and 3
  myFlower2.collition(myFlower3);
  myFlower3.collition(myFlower2); //myFlower3 collition with 1 and 2
  myFlower3.collition(myFlower1);

  myRect.follow();

  for (int i = num-1; i > 0; i--) { //Laver et for loop hvor 'num' bliver mindre og mindre. Den går fra 20 og ned. 'i' skal altid være større end 0 for at det virker.

    x[i] = x[i-1]; //Refererer til positionen af x i et array. Tæller fra [20, 19, 18 ,17 osv.]
    y[i] = y[i-1]; // Refererer til positionen af y i et array. Tæller fra [20, 19, 18 ,17 osv.]
  }
  x[0] = myRect.x; // Sætter første positionen af arrayen til myFlower4's x. Arrayet starter altid i 0.
  y[0] = myRect.y; // Sætter første positionen af arrayen til myFlower4's y. Arrayet starter altid i 0.

  // Her bliver blomstens hale (trail) tegnet.
  for (int i = 0; i < num; i++) { // i = 0. num = 20. Det vil sige, at når 'i' bliver plusset med 1 hele tiden, vil den maks nå 20. 'i++' = plusser med 1.
    myRectArray[i] =  new Object(num-i, _petals, x[i], y[i], _pc); // Blomstens variabler. 
    
    myRectArray[i].displayRect(); // Her bliver blomsten med array tegnet.
  }
  
  xBlomst[indexPos] = myFlower1.x;
  yBlomst[indexPos] = myFlower1.y;
  indexPos = (indexPos +1) % BlomstTrail;
  for (int i = 0; i < BlomstTrail; i++) {
    int pos = (indexPos + i) % BlomstTrail;
    float radius = 5 * i/ 2.0;
    Blomst[pos].x = xBlomst[pos] ;
    Blomst[pos].y = xBlomst[pos] ;
    Blomst[pos].r = radius;
    Blomst[pos].displayFlower();
  }
  //(_r1, _petals, _x+200, _y, _pc);
}
