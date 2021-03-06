; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Minecraft 1.13+ Shader Installer "
#define MyAppVersion "0.2"
#define MyAppExeName "MyProg.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{143AB183-A823-4CCD-A643-2EBEEFB8E314}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
CreateAppDir=no
OutputBaseFilename=Minecraft_Shader_Inst
Compression=lzma
SolidCompression=yes
PrivilegesRequired=lowest
Uninstallable=no

[code]
const
  MCPFDir='{userappdata}\.minecraft\';

var
  SMCPFDir: string;

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
  Result:='OptiFine 1.13+ Shader Installer'+#13#10;
  Result:=Result+'」r」lLexShino_」4」lShaders」r」l_Remade_」4」lV2.15」r」l.zip'+#13#10;
  Result:=Result+'BSL+v7.1.03.2.zip'+#13#10;
  Result:=Result+'Builder''s QOL Shaders V2.3.0.zip'+#13#10;
  Result:=Result+'Builder''s Modded Shaders V2.3.0.zip'+#13#10;
  Result:=Result+'Kappa_rc0.9.2.zip'+#13#10;
  Result:=Result+'Sildurs Vibrant Shaders v1.22 Lite.zip'+#13#10;
  Result:=Result+'Sildurs Vibrant Shaders v1.22 Medium.zip'+#13#10;
  Result:=Result+'Sildurs Vibrant Shaders v1.22 High.zip'+#13#10;
  Result:=Result+'VPlus_v1.4.2.zip'+#13#10;
  Result:=Result+''+#13#10;
  SMCPFDir:=MCPFDirCheck;
  Result:=Result+SMCPFDir;
  if SMCPFDir<>'' then
    Result:=Result+' -ok'
    else
      Result:=Result+' No Minecraft user data';
  Result:=Result+#13#10;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID=wpReady then begin
    if SMCPFDir='' then
      WizardForm.NextButton.Enabled:=False;
  end;
end;

function GetShaderDir(dummy:string):string;
begin
  Result:=SMCPFDir+'shaderpacks';
  CreateDir(Result);
end;

[Files]
Source: "」r」lLexShino_」4」lShaders」r」l_Remade_」4」lV2.15」r」l.zip"; DestDir: "{code:GetShaderDir}"
Source: "BSL+v7.1.03.2.zip"; DestDir: "{code:GetShaderDir}"
Source: "Builder's QOL Shaders V2.3.0.zip"; DestDir: "{code:GetShaderDir}"
Source: "Builder's Modded Shaders V2.3.0.zip"; DestDir: "{code:GetShaderDir}"
Source: "Kappa_rc0.9.2.zip"; DestDir: "{code:GetShaderDir}"
Source: "Sildurs Vibrant Shaders v1.22 Lite.zip"; DestDir: "{code:GetShaderDir}"
Source: "Sildurs Vibrant Shaders v1.22 Medium.zip"; DestDir: "{code:GetShaderDir}"
Source: "Sildurs Vibrant Shaders v1.22 High.zip"; DestDir: "{code:GetShaderDir}"
Source: "VPlus_v1.4.2.zip"; DestDir: "{code:GetShaderDir}"
