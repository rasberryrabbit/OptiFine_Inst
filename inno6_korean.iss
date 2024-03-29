; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!
#include <C:\Program Files (x86)\Inno Download Plugin\idp.iss>

#define MyAppName "Inno setup 6 Unofficial Korean Language Installer"
#define MyAppVersion "1.1"
#define default_path_dll "{autopf32}\Inno Setup 6"
#define default_path "{autopf32}\Inno Setup 6\Languages"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{CCF01412-937C-42C9-BF38-2D47C3B16D5F}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
CreateAppDir=no
OutputBaseFilename=Innosetup6 Korean
Compression=lzma
SolidCompression=yes
Uninstallable=False

[Code]
var
  DownloadPage: TDownloadWizardPage;

function OnDownloadProgress(const Url, FileName: String; const Progress, ProgressMax: Int64): Boolean;
begin
  if Progress = ProgressMax then
    Log(Format('Successfully downloaded file to {tmp}: %s', [FileName]));
  Result := True;
end;

procedure InitializeWizard;
begin
  DownloadPage := CreateDownloadPage(SetupMessage(msgWizardPreparing), SetupMessage(msgPreparingDesc), @OnDownloadProgress);
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  if CurPageID = wpReady then begin
    if WizardIsComponentSelected('github') then
    begin
      DownloadPage.Clear;
      DownloadPage.Add('https://raw.githubusercontent.com/jrsoftware/issrc/main/Files/Languages/Korean.isl', 'Korean.isl','');
      DownloadPage.Show;
      try
        try
          DownloadPage.Download;
          Result:=True;
        except
          //SuppressibleMsgBox(AddPeriod(GetExceptionMessage), mbCriticalError, MB_OK, IDOK);
          Result:=False;
        end;
      finally
        DownloadPage.Hide;
      end;
    end else
      Result:=True;
  end else
    Result:=True;
end;

function GetFilePath(s:string):string;
begin
  Result:=ExpandConstant('{tmp}\Korean.isl');
  if (not FileExists(ExpandConstant('{tmp}\Korean.isl'))) or
     (not WizardIsComponentSelected('github')) then
     Result:=ExpandConstant('{tmp}\local\Korean.isl');
end;

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Components]
Name: "github"; Description: "From Github"; Types: full;
Name: "ISCrypt"; Description: "Encryption"; Types: full;

[Files]
Source: "Korean.isl"; DestDir: "{tmp}\local"; Flags: ignoreversion;
Source: "{code:GetFilePath}"; DestDir: "{#default_path}"; Flags: ignoreversion external;
Source: "ISCrypt.dll"; DestDir: "{#default_path_dll}"; Flags: ignoreversion;
