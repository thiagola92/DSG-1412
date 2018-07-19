ArrayList<BaseComponnent> componnent_list = new ArrayList<BaseComponnent>();

void setup() {
  size(300, 500);
  
  componnent_list.add(new Background());
  componnent_list.add(new Toolbar());
  componnent_list.add(new MiniToolbar());
  componnent_list.add(new Navigation());
  componnent_list.add(new NavigationDrawer());
}

void draw() {
  for(int i = 0; i < componnent_list.size(); i++) {
    BaseComponnent componnent = componnent_list.get(i);
    
    componnent.draw();
  }
}

void mouseClicked() {
  int x = mouseX;
  int y = mouseY;
  
  for(int i = componnent_list.size() - 1; i >= 0; i--) {
    BaseComponnent componnent = componnent_list.get(i);
    
    if(componnent.onClick(x, y))
      break;
  }
}
