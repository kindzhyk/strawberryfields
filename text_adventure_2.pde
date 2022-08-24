//Ян Лунин, Катя Вишневская, Гоша Елаев. Байкальск, 2022 @Дело о клубнике

class Pair {
  String txt;
  int id;
  Pair(int iid, String itxt){
    id = iid;
    txt = itxt;
  }
}

class State {
  Pair here;
  ArrayList<Pair> links;
  State(int iid, String itxt){
    here = new Pair(iid, itxt);
    links = new ArrayList();
  }
  void add_link(int to_id, String option_txt){
    links.add( new Pair(to_id, option_txt) );
  }
  void draw(){
    text(here.txt,20,20,width-40,height/2-20);
    // Можно чтото пободрее придумать
    for(int i=0; i< links.size(); i++){
      text(links.get(i).txt, 20,height/2+20+(i*height/4),width-40,height/4);
    }
  }
  void mouse(){
    // Тоже выглядит скучновато
    if(mouseY>3*height/4){ if(links.size() > 1){ state = links.get(1).id;} return;}
    if(mouseY>height/2){ state = links.get(0).id; return;}
  }
}

State[] states = new State[11];
int state = 0;

PImage img;

void setup(){
  size(600, 400);
  img =loadImage("01.jpeg");

  states[0] = new State(  0, "Перед вами клубника.");
  states[0].add_link(  1, "Съесть клубнику. ->");
  states[0].add_link(  2, "Покинуть Байкальск. ->");

  states[1] = new State(  1, "Вы съели одну клубнику. Хотите съесть еще?");
  states[1].add_link(  0, "Остановиться. ->");
  states[1].add_link(  3, "Съесть еще ягодку. ->");

  states[2] = new State(  2, "Добро пожаловать в Байкальск.");
  states[2].add_link(  0, "Войти в город. ->");
  
  states[3] = new State( 3, "Вы съели вторую клубнику. Хотите съесть еще?");
  states[3].add_link(  0, "Остановиться. ->");
  states[3].add_link(  4, "Съесть еще ягодку. ->");
  
  states[4] = new State( 4, "Вы съели третью клубнику. Хотите съесть еще?");
  states[4].add_link(  0, "Остановиться. ->");
  states[4].add_link(  5, "Съесть еще ягодку. ->");
  
  states[5] = new State( 5, "Вы съели четвертую клубнику. Хотите съесть еще?");
  states[5].add_link(  0, "Остановиться. ->");
  states[5].add_link(  6, "Съесть еще ягодку. ->");
  
  states[6] = new State( 6, "Вы съели пятую клубнику. Хотите съесть еще?");
  states[6].add_link(  0, "Остановиться. ->");
  states[6].add_link(  7, "Съесть еще ягодку. ->");
  
  states[7] = new State( 7, "Вы съели шестую клубнику. Хотите съесть еще?");
  states[7].add_link(  0, "Остановиться. ->");
  states[7].add_link(  8, "Съесть еще ягодку. ->");
  
  states[8] = new State( 8, "Вы съели седьмую клубнику. Хотите съесть еще?");
  states[8].add_link(  0, "Остановиться. ->");
  states[8].add_link(  9, "Съесть еще ягодку. ->");
  
  states[9] = new State( 9, "Вы съели восьмую клубнику. Хотите съесть еще?");
  states[9].add_link(  0, "Остановиться. ->");
  states[9].add_link(  10, "Съесть еще ягодку. ->");
  
  states[10] = new State( 10, "Вы съели девятую клубнику. Клубника закончилась");
  states[10].add_link(  2, "Остановиться. ->");
  
}

void draw(){
  background(0);
  fill(255);
  image (img, 50, 50);
  states[state].draw();
}

void mousePressed(){
  states[state].mouse();
}
