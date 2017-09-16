# Aula 5

## Variáveis
Falou sobre 6 tipos de variáveis que mais vão ser utilizadas durante as aulas.  

| Variável | Tamanho | exemplo              | comentário                                                                 |
| -------- | ------- | -------------------- | -------------------------------------------------------------------------- |
| boolean  | 1 bit   | boolean a = true;    | ocupa pouco espaço e consegue dar informação rápido de verdadeiro ou falso |
| char     | 8 bits  | char a = 'c';        | usado para armazenar letras, mas pode usar para armazenar número até 255   |
| int      | 32 bits | int a = 10;          | usado para armazenar números                                               |
| float    | 32 bits | float a = 3.5        | usado para armazenar números com virgulas                                  |
| color    | 32 bits | color a = color(55); | variável própria do processing, usado para armzenar color                  |
| String   |         | String a = "coe";    | uma classe de java para armzenar strings                                   |

## == != < > <= >=
Esses simbolos são comparadores. Eles comparam duas coisas e dizem se é verdade ou não.  
`2 == 1+1`  
Isso vai se tornar 'true'.  
`2 == 3`  
Isso vai se tornar 'false'.  

Os outros simbolos também funcionam assim, retornando verdadeiro ou falso.  
`==` retorna verdade se forem iguais  
`!=` retorna verdade se forem diferentes  
`<` retorna verdade se o primeiro valor for menor que o segundo  
`>` retorna verdade se o primeiro valor for maior que o segundo  
`<=` retorna verdade se o primeiro valor for menor ou igual que o segundo  
`>=` retorna verdade se o primeiro valor for maior ou igual que o segundo  

Você vai entender melhor essas comparações quando ver `if`.  

## If else && ||
If é um condicional, usado para decidir se os próximos comandos vão ser rodados.  
```Processing
if(1+1 == 2) {
}
```

Se tudo dentro do parenteses for verdade, o código dentro das chaves vai rodar.  
```Processing
if(10*2 > 19) {
  // run this if 10*2 is greater than 19
}
```

Else é usado depois de if, para que se a condição if não acontece o else aconteca  
```Processing
if(10*2 > 21) {
  // run this if 10*2 is greater than 21
} else {
  // run this if 10*2 is not greater than 21
}
```

Em vez de fazer varios if dentro de outros tipo  
```Processing
if(variavel > 10) {
  if(variavel < 50) {
    // codigo
  }
}
```

Você pode usar `&&` para representar **and**  
```Processing
if(variavel > 10 && variavel < 50) {
  // codigo
}
```
Esse condicional retorna true se ambas condições são verdadeiras.  

A mesma coisa serve para `||`, mas ele funciona como **or**  
```Processing
if(variavel > 10 || variavel < 50) {
  // codigo
}
```
Esse condicional retorna true se qualquer uma dessas condições é verdadeira.  

## Mouse
É possivel pegar a posição do mouse com as variáveis `mouseX` e `mouseY`.  
```Processing
int x=0;
int y=0;
void draw() {
    x=mouseX;
    y=mouseY;
    ellipse(x,y,30,30);
}
```

Você bote dectar clique do mouse de duas maneiras, por variável ou por função. Por variável você usa `mousePressed` que é fica true quando tem uma tecla sendo pressionada e false quando não tem.  
```Processing
if(mousePressed == true) {
  // code
}
```

Lado negativo de usar a variável é que você fica verificando o tempo todo o estado dela, nem sempre você quer verificar o tempo todo se a tecla foi apertada. As vezes você quer ser avisado que a tecla foi apertada, para isso a função `mousePressed()`.  
```Processing
void mousePressed() {
  // code
}
```

Você pode saber qual foi a ultima tecla apertada usando `mouseButton` e as variáveis `LEFT` e `RIGHT` para identificar o botão.   
```Processing
void mousePressed() {
  if(mouseButton == LEFT) {
    // code
  }
}
```

## Keyboard
Da mesma maneira que o mouse tem uma variável e função para informar se um botão ta sendo pressionado.   
```Processing
void keyPressed() {
  // code
}
```

```Processing
if(keyPressed == true) {
  // code
}
```

Para descobrir qual tecla foi apertada use a variável `key`, ela armazena o ultimo char a ser pressionado.   
```Processing
void keyPressed() {
  if(key == 't') {
    // code
  }
}
```

Se essa tecla foi "especial" (as setas, alt, ctrl....) você tem que usar o variável `keyCode` que armazena a ultima tecla.  
```Processing
void keyPressed() {
   if(keyCode == UP){

   }
}
```

## Loop For
Loop é uma maneira de repetir uma mesma ação n vezes.  
```Processing
for (int i=0; i<100; i+=2){
   line(i,0,i,50);
}
```
