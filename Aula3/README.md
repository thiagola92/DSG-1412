# Aula 3
Foi ensinado a como desenhar coisas como

## Shapes básicos

Point:  
`point(x, y);`  

Line:  
`line(x1,y1,x2,y2);`  

Triangle:  
`triangle(x1,y1,x2,y2,x3,y3);`  

Quadrilateral:  
`quad(x1,y1,x2,y2,x3,y3,x4,y4);`  

Rectangle:  
`rect(x,y,width,height);`  

Ellipse:  
`ellipse(x,y,width,height);`  

Bezier:  
`bezier(x1,y1,cx1,cy1,cx2,cy2,x2,y2);`  

https://en.wikipedia.org/wiki/B%C3%A9zier_curve

## Cor

Background:  
`background(red, green, blue);`  
Cor de fundo.  

Fill:  
`fill(red, green, blue)`  
Próximas coisas(formas geometricas) que você desenhar vai ser preenchida com essa cor por dentro.  

Stroke:
stroke(red,green,blue);
Próximas linhas(ponto/reta/arestas de formas geometricas) que você desenhar vai ser dessa cor.  

Se você botar apenas um número, vai se repetir para as outras cores  
`background(125);` == `background(125, 125, 125);`  
`fill(125);` == `fill(125, 125, 125);`  
`stroke(125);` == `stroke(125, 125, 125);`  

## Stroke

Stroke weight:  
`strokeWeight(pixels);`  
Expessura do traço.  
