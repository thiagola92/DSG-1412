public class Label extends Button {

  public Label(String label, float positionX, float positionY, float size) {
    super(label, positionX, positionY, size);
    
    this.changedColor = this.normalColor;
  }
}