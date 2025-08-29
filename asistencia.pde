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
void mousePressed() {
  // Solo cambia la forma y el color si haces clic dentro de ella
  float distancia = dist(x, y, mouseX, mouseY);
  if (distancia < tamano / 2) {
    esCirculo = !esCirculo;
    
    // Cambia los colores a tonalidades pastel aleatorias
    fondoColor = generarColorPastel();
    formaColor = generarColorPastel();
  }
}
// Función para generar un color pastel
color generarColorPastel() {
  int r = (int)random(180, 255);
  int g = (int)random(180, 255);
  int b = (int)random(180, 255);
  return color(r, g, b);
}

// Función para dibujar una estrella
void dibujaEstrella(float centroX, float centroY, float radioExterior, float radioInterior, int puntas) {
  float angulo = TWO_PI / puntas;
  float medioAngulo = angulo / 2.0;

  beginShape();
  for (float a = 0; a < TWO_PI; a += angulo) {
    float sx = centroX + cos(a) * radioExterior;
    float sy = centroY + sin(a) * radioExterior;
    vertex(sx, sy);
    sx = centroX + cos(a + medioAngulo) * radioInterior;
    sy = centroY + sin(a + medioAngulo) * radioInterior;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
