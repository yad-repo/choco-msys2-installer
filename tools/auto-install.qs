// Based on https://github.com/msys2/msys2-installer/blob/master/auto-install.js

function Controller() {
  installer.setDefaultPageVisible(QInstaller.Introduction, installer.isInstaller());
  installer.setDefaultPageVisible(QInstaller.TargetDirectory, installer.isInstaller());
  installer.setDefaultPageVisible(QInstaller.ComponentSelection, false);
  installer.setDefaultPageVisible(QInstaller.LicenseCheck, false);
  installer.setDefaultPageVisible(QInstaller.StartMenuSelection, false);
  installer.setDefaultPageVisible(QInstaller.ReadyForInstallation, false);
  installer.setDefaultPageVisible(QInstaller.PerformInstallation, true);
  installer.setDefaultPageVisible(QInstaller.InstallationFinished, true);
  installer.setDefaultPageVisible(QInstaller.End, false);

  installer.setValue("RemoveTargetDir", false);
  installer.autoRejectMessageBoxes();
  installer.setMessageBoxAutomaticAnswer("cancelInstallation", QMessageBox.Yes);
  installer.setMessageBoxAutomaticAnswer("OverwriteTargetDirectory", QMessageBox.Yes);
  installer.setMessageBoxAutomaticAnswer("stopProcessesForUpdates", QMessageBox.Ignore);
  installer.setMessageBoxAutomaticAnswer("Corrupt_Installation_Error", QMessageBox.Ok);
}

Controller.prototype.IntroductionPageCallback = function() {
  gui.clickButton(buttons.NextButton);
}

Controller.prototype.TargetDirectoryPageCallback = function() {
  // Force target directory if needed
  var target_dir = installer.value("InstallDir");
  if (installer.environmentVariable('MSYS2_HOME') != '') {
    target_dir = installer.environmentVariable('MSYS2_HOME');
  }
  if (target_dir != '') {
    var widget = gui.currentPageWidget();
    widget.TargetDirectoryLineEdit.setText(target_dir);
  }
  gui.clickButton(buttons.NextButton);
}

Controller.prototype.StartMenuDirectoryPageCallback = function() {
  gui.clickButton(buttons.NextButton);
}

Controller.prototype.ReadyForInstallationPageCallback = function() {
  gui.clickButton(buttons.NextButton);
}

Controller.prototype.PerformInstallationPageCallback = function() {
  installer.setAutomatedPageSwitchEnabled(true);
  gui.clickButton(buttons.NextButton);
}

Controller.prototype.FinishedPageCallback = function() {
  var widget = gui.currentPageWidget();
  widget.RunItCheckBox.checked = false;
  gui.clickButton(buttons.FinishButton);
}
