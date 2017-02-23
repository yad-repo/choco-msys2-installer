function Controller() {
  installer.autoRejectMessageBoxes();
  installer.setMessageBoxAutomaticAnswer("cancelInstallation", QMessageBox.Yes);
  // Note: This message box seems to be created before this Controller so following 
  // so it can't be controlled with following statement:
  // installer.setMessageBoxAutomaticAnswer("Corrupt_Installation_Error", QMessageBox.Ok);  
}
Controller.prototype.IntroductionPageCallback = function() {
  gui.clickButton(buttons.NextButton);
}
Controller.prototype.ReadyForInstallationPageCallback = function() {
  gui.clickButton(buttons.NextButton);
}
Controller.prototype.FinishedPageCallback = function() {
  var widget = gui.currentPageWidget();
  widget.RunItCheckBox.checked = false;  
  gui.clickButton(buttons.FinishButton);    
}
