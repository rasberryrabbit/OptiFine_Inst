; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{7E80BB62-9B38-4633-88DD-AAA0F2D03D0A}
AppName=OptiFine 1.13.2_HD_U_E7 Installer
AppVersion=0.1
;AppVerName=OptiFine Installer 1.13.2_HD_U_E7
AppPublisher=anon
OutputBaseFilename=OptiFine_1.13.2_HD_U_E7_Inst
Compression=lzma
SolidCompression=yes
Uninstallable=no
VersionInfoTextVersion=1.13.2_HD_U_E7
DisableWelcomePage=False
CreateAppDir=False

[ThirdParty]
UseRelativePaths=True

[Code]
const
  MCDir='{commonpf32}\Minecraft\runtime\jre-x64\bin\';
  OptiFineCmd='java -jar ';
  MCPFDir='{userappdata}\.minecraft\';
  OptiDir='OptiFine';

var
  SMCDir: string;
  SJava: string;
  SMCPFDir: string;
  SOptiDir: string;


function MCDirCheck:string;
var
  SD: string;
begin
  SD:=ExpandConstant(MCDir);
  if DirExists(SD) then
    Result:=SD
    else
      Result:='';
end;

function MCJavaCheck:string;
var
  SD: string;
begin
  SD:=ExpandConstant(MCDir+'java.exe');
  if FileExists(SD) then
    Result:=SD
    else
      Result:='';
end;

function MCPFDirCheck:string;
var
  SD: string;
begin
  SD:=ExpandConstant(MCPFDir);
  if DirExists(SD) then
    Result:=SD
    else
      Result:='';
end;

function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo, MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
begin
  Result:='OptiFine_1.13.2_HD_U_E7 Installer'+#13#10;
  SMCDir:=MCDirCheck;
  Result:=Result+SMCDir;
  if SMCDir<>'' then
    Result:=Result+' - ok'
    else
      Result:=Result+' No Java Runtime';
  Result:=Result+#13#10;
  SJava:=MCJavaCheck;
  Result:=Result+SJava;
  if SJava<>'' then
    Result:=Result+' - ok'
    else
      Result:=Result+' No java.exe';
  Result:=Result+#13#10;
  SMCPFDir:=MCPFDirCheck;
  Result:=Result+SMCPFDir;
  if SMCPFDir<>'' then
    Result:=Result+' -ok'
    else
      Result:=Result+' No Minecraft user data';
  Result:=Result+#13#10;
  SOptiDir:=SMCPFDir+OptiDir;
  CreateDir(SOptiDir);
  if DirExists(SOptiDir) then
    Result:=Result+'Access OptiFine Folder - ok'
      else begin
        Result:=Result+'Cannot access OptiFine folder';
        SOptiDir:='';
      end;
  Result:=Result+#13#10;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID=wpReady then begin
    if (SMCDir='') or (SJava='') or (SMCPFDir='') or (SOptiDir='') then
      WizardForm.NextButton.Enabled:=False;
  end;
end;

function GetOutDir(dummy:string):string;
begin
  Result:=SOptiDir;
end;

function JavaExec(dummy: string):string;
begin
  Result:=SJava;
end;

function GetOptiFile(dummy:string):string;
begin
  Result:=' -jar '+SOptiDir+'\'+'OptiFine_1.13.2_HD_U_E7.jar';
end;

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: "OptiFine_1.13.2_HD_U_E7.jar"; DestDir: "{code:GetOutDir}"; Flags: ignoreversion

[Run]
Filename: "{code:JavaExec}"; Parameters: "{code:GetOptiFile}"; Flags: nowait;

