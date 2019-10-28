class Flower {

  // Variables

  float r;       // radius of the flower petal
  int n_petals;  // number of petals 
  float x;       // x-position of the center of the flower
  float y;       // y-position of the center of the flower
  int petalColor;//hexadecimal number for the color of petals
  float xSpeed; // Variable der bruges til at lave movement på mine blomster.
  float ySpeed; // Variable der bruges til at lave movement på mine blomster.


  Flower(float temp_r, int temp_n_petals, float temp_x, float temp_y, int temp_petalColor) {
    r=temp_r;
    n_petals = temp_n_petals;
    x=temp_x;
    y=temp_y;
    petalColor=temp_petalColor;
    xSpeed = random(15);
    ySpeed = random(10);
  }

  void display () { // Her bliver blomsten med blade tegnet

    float ballX;
    float ballY;

    fill(petalColor);
    for (float i=0; i<PI*2; i+=2*PI/n_petals) {
      ballX=x + r*cos(i);
      ballY=y + r*sin(i);
      ellipse(ballX, ballY, r, r);
    }
    fill(255, 255, 0);
    ellipse(x, y, r*1.2, r*1.2);
  }
  void movement() { //Bævegelse for blomstens x og y.
    x += xSpeed;
    y += ySpeed;
    this.bounce();
  }

  void bounce() { // Blomsten bevæger sig tilbage, når den rammer kanten.
    if (x - r < 0 || x + r > width) {
      xSpeed *=(-1); //Hver gang blomsten rammer kanten ændrer xSpeed sig for + til - eller omvendt. * = (-1) ændrer om det givet tal er plus eller minus.
    }
    if (y - r < 0 || y + r > height) {
      ySpeed *=(-1);//Hver gang blomsten rammer kanten ændrer ySpeed sig for + til - eller omvendt. * = (-1) ændrer om det givet tal er plus eller minus.
    }
  }

  void collition(Flower other) {
    float d = dist(x, y, other.x, other.y); // d er distancen mellem x, y og en anden flowers x, y.
    if (d < r + other.r) {
      ySpeed *=(-1);
      xSpeed *=(-1);
      petalColor = int (random(#000000, #FFFFFF));
    }
  } 

  void follow() { // Objektet følger musen henover skærmen. Mellem hvert frame udregner processing forskellen mellem positionen af objektet og cursoren.
    float easing = 0.005; // Hvis forskellen mellem objekt og cursor er større end 1 pixel, så vil objektet flytte sig 0.005 fra sin nuværende position og hen mod cursoren.
    float targetX = mouseX;
    float dx = targetX - x;
    x += dx * easing;

    float targetY = mouseY;
    float dy = targetY - y;
    y += dy * easing;

    this.display();
  }
}
