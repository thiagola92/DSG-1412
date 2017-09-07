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
```Java
if(1+1 == 2) {
}
```

Se tudo dentro do parenteses for verdade, o código dentro das chaves vai rodar.  
```Java
if(10*2 > 19) {
  // run this if 10*2 is greater than 19
}
```

Else é usado depois de if, para que se a condição if não acontece o else aconteca  
```Java
if(10*2 > 21) {
  // run this if 10*2 is greater than 21
} else {
  // run this if 10*2 is not greater than 21
}
```

