# TODO figure out why
# https://github.com/opentable/puppet-windowsfeature
# doesn't work for 2008 and 2012
#
# http://msdn.microsoft.com/en-us/library/ee662309.aspx		Add-WindowsFeature cmdlet has been replaced
# http://msdn.microsoft.com/en-us/library/ee662310.aspx		Remove-WindowsFeature cmdlet has been replaced in Windows Server 2012
# 



# Note - installs Web-Mgmt-Tools AND Web-Mgmt-Console 




# ***TESTING***

#class my_windows_features {
#  windowsfeature { 'Web-Asp-Net': }
#  windowsfeature { 'Web-Net-Ext': }
#  windowsfeature { 'Web-ISAPI-Ext': }
#  windowsfeature { 'Web-ISAPI-Filter': }
#  windowsfeature { 'Web-Mgmt-Tools': }
#  windowsfeature { 'Web-Mgmt-Console': }
#  windowsfeature { 'Telnet-Server': ensure => absent }
#}
#
#class my_other_windows_feature_implementation {
#  windowsfeature{'IIS':
#    feature_name => ['Web-Server',
#      'Web-WebServer',
#      'Web-Asp-Net45',
#      'Web-ISAPI-Ext',
#      'Web-ISAPI-Filter',
#      'NET-Framework-45-ASPNET',
#      'WAS-NET-Environment',
#      'Web-Http-Redirect',
#      'Web-Filtering',
#      'Web-Mgmt-Console',
#      'Web-Mgmt-Tools']
#    }
#  }
#


#
#




exec { 'WindowsFeatures--Web-Mgmt-Tools':
  command     => 'powershell.exe -Executionpolicy Unrestricted Install-WindowsFeature Web-Mgmt-Console',
  creates     => 'c:/Documents and Settings/All Users/Start Menu/Programs/Administrative Tools/IIS Manager.lnk', # NB : Using a Start Menu file is dodgy! But this is a Server setup, not a Desktop on, so lets trust it for the moment
  cwd         => 'c:/', # The directory from which to run the command.  If 
  path        => 'C:/Windows/System32/WindowsPowerShell/v1.0/', # The search path used for command execution...
}




# works
# Get-WindowsFeature Web-Mgmt-Console | Where-Object {$_.Installed -match “True”} | Select-Object -Property Name

#exec { 'WindowsFeatures--Web-Mgmt-Tools':
#  command     => 'test.bat',
#  creates     => 'c:\test2.txt', # A file to look for before running the command...
#  cwd         => 'c:\\', # The directory from which to run the command.  If 
#  path        => 'c:\\', # The search path used for command execution...
#}

  
#exec { 'resource title':
#  command     => # (namevar) The actual command to execute.  Must either be...
#  creates     => # A file to look for before running the command...
#  cwd         => # The directory from which to run the command.  If 
#  environment => # Any additional environment variables you want to 
#  group       => # The group to run the command as.  This seems to...
#  logoutput   => # Whether to log command output in addition to...
#  onlyif      => # If this parameter is set, then this `exec` will...
#  path        => # The search path used for command execution...
#  provider    => # The specific backend to use for this `exec...
#  refresh     => # How to refresh this command.  By default, the...
#  refreshonly => # The command should only be run as a refresh...
#  returns     => # The expected exit code(s).  An error will be...
#  timeout     => # The maximum time the command should take.  If...
#  tries       => # The number of times execution of the command...
#  try_sleep   => # The time to sleep in seconds between...
#  umask       => # Sets the umask to be used while executing this...
#  unless      => # If this parameter is set, then this `exec` will...
#  user        => # The user to run the command as.  Note that if...
#  # ...plus any applicable metaparameters.
#}


