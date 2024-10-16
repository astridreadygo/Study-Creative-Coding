int canvasLeftCornerX = 40;
int canvasLeftCornerY = 60;



void UI() {
  bar = new ControlP5(this, createFont("微软雅黑", 14));

  int barSize = 200;
  int barHeight = 20;
  int barInterval = barHeight + 10;

  bar.addSlider("sectionSideNum", 3, 16, 5, canvasLeftCornerX, canvasLeftCornerY, barSize, barHeight).setLabel("断面边数");
  bar.addSlider("sideDivision", 1, 100, 40, canvasLeftCornerX, canvasLeftCornerY+barInterval, barSize, barHeight).setLabel("断面边细分段数");
  //bar.addSlider("cylinderHeightSection", 3, 500, 200, canvasLeftCornerX, canvasLeftCornerY+barInterval*2, barSize, barHeight).setLabel("柱体高度分段数");
  bar.addSlider("cylinderSectionHeight", 0, 100, 10, canvasLeftCornerX, canvasLeftCornerY+barInterval*2, barSize, barHeight).setLabel("柱体分段高度");
  bar.addSlider("sectionRadiusPhase", 0, PI*8, TWO_PI, canvasLeftCornerX, canvasLeftCornerY+barInterval*3, barSize, barHeight).setLabel("柱体半径相变");
  bar.addSlider("twistPhase", -TWO_PI, TWO_PI, PI*2/3, canvasLeftCornerX, canvasLeftCornerY+barInterval*4, barSize, barHeight).setLabel("柱体扭曲相变");
  bar.addSlider("twistPhaseStart", -TWO_PI, TWO_PI, TWO_PI, canvasLeftCornerX, canvasLeftCornerY+barInterval*5, barSize, barHeight).setLabel("柱体扭曲相变起始值");
  
 // bar.addButton("colorModel", 150,  canvasLeftCornerX, canvasLeftCornerY+barInterval*7, 80, 20).setLabel("切换颜色");
  bar.addSlider("myColorBackgroundR", 0, 255, 150, canvasLeftCornerX, canvasLeftCornerY+barInterval*8, barSize, barHeight).setLabel("背景颜色R值");
  bar.addSlider("myColorBackgroundG", 0, 255, 150, canvasLeftCornerX, canvasLeftCornerY+barInterval*9, barSize, barHeight).setLabel("背景颜色G值");
  bar.addSlider("myColorBackgroundB", 0, 255, 150, canvasLeftCornerX, canvasLeftCornerY+barInterval*10, barSize, barHeight).setLabel("背景颜色B值");
  
  bar.setAutoDraw(false);
}

void lightSettings() {
  lightSpecular(255, 255, 255);
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  specular(200, 200, 200);
  shininess(15);
}

void UIShow() {
  cam.beginHUD();  
  lights();
  bar.draw();
  cam.endHUD();//不受PEASY CAM的方式，不然在坐标下BAR会跑走

  if (mouseX<400 && mouseY< height) {
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }
}
