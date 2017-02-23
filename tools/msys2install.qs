function Controller() {
  installer.setDefaultPageVisible(QInstaller.Introduction, true);
  installer.setDefaultPageVisible(QInstaller.TargetDirectory, true);
  installer.setDefaultPageVisible(QInstaller.ComponentSelection, false);
  installer.setDefaultPageVisible(QInstaller.StartMenuSelection, true);
  installer.setDefaultPageVisible(QInstaller.ReadyForInstallation, false);
  installer.setDefaultPageVisible(QInstaller.PerformInstallation, true);
  installer.setDefaultPageVisible(QInstaller.InstallationFinished, true);

  installer.setValue("RemoveTargetDir", false);
  installer.autoRejectMessageBoxes();
  installer.setMessageBoxAutomaticAnswer("cancelInstallation", QMessageBox.Yes);
}
Controller.prototype.IntroductionPageCallback = function() {
  gui.clickButton(buttons.NextButton);
}
Controller.prototype.TargetDirectoryPageCallback = function() {    
  // Force target directory
  if (installer.environmentVariable('MSYS2_HOME') != '') {
    var widget = gui.currentPageWidget();    
    widget.TargetDirectoryLineEdit.setText(installer.environmentVariable('MSYS2_HOME'));
  }    
  gui.clickButton(buttons.NextButton);
}
Controller.prototype.StartMenuDirectoryPageCallback = function() {
  gui.clickButton(buttons.NextButton);
}
Controller.prototype.PerformInstallationPageCallback = function() {
  gui.clickButton(buttons.CommitButton);
}
Controller.prototype.FinishedPageCallback = function() {
  var widget = gui.currentPageWidget();
  widget.RunItCheckBox.checked = false;  
  gui.clickButton(buttons.FinishButton);    
}
