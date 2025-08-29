// Variables para la posición y tamaño de la forma
float x, y, tamano;

// Variables para controlar el estado y el color
boolean esCirculo = true;
color fondoColor;
color formaColor;

void setup() {
  size(600, 600);
  x = width / 2;
  y = height / 2;
  tamano = 100;

 // Colores iniciales pastel
  fondoColor = color(220, 255, 220); // Verde menta
  formaColor = color(255, 200, 220); // Rosa claro
}

void draw() {
  background(fondoColor);
  
  if (esCirculo) {
    fill(formaColor);
    noStroke();
    ellipse(x, y, tamano, tamano);
  } else {
    fill(formaColor);
    noStroke();
    dibujaEstrella(x, y, tamano / 2, tamano, 5);
  }
}
