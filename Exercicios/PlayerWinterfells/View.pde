public class View {
 
  String StrPlayer = "Você é o jogador ";
  
  
  void draw () {
    textSize(40);
    if (playerId > -1)
      text(StrPlayer + playerId, width/2, height/2);    
      
      
    text(accY + "", 0, 0, width, height);
  }
  
}