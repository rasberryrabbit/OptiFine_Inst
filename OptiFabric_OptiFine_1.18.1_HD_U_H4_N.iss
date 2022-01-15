; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define CurrDate GetDateTimeString('ddddd', '', '')

#define JarName1 'fabric-installer-0.10.2'
#define JarName2 'OptiFine_1.18.1_HD_U_H4'
#define JarName3 'optifabric-1.12.10'
#define JarName4 'fabric-api-0.46.0+1.18'
#define JarName5 'Xaeros_Minimap_21.23.0_Fabric_1.18'
#define JarName6 'voicechat-fabric-1.18.1-2.1.28'
#define JarName7 'CocoaInput-1.18-fabric-4.0.4'
#define JarName8 'WindowedFullscreen-1.18-fabric-1.0.1'
#define JarName9 'sodium-fabric-mc1.18-0.4.0-alpha5+build.9'
#define JarName10 'canvas-fabric-mc118-1.0.2281'

#define DefaultRuntime '{pf32}\Minecraft Launcher\runtime'
#define JavaBeta '\java-runtime-beta\windows-x64\java-runtime-beta\bin'

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{949CFF8B-F22F-4811-BE42-2A10D81862D0}
AppName={#JarName1} {#JarName4} Installer {#CurrDate}
AppVersion=0.88
;AppVerName=OptiFine Installer {#JarName2}
AppPublisher=anon
OutputBaseFilename=Fabric_{#JarName2}_QOL_NV_{#CurrDate}
Compression=lzma2/max
SolidCompression=yes
Uninstallable=no
VersionInfoTextVersion={#JarName1} {#JarName4}
DefaultDirName={#DefaultRuntime}\jre-x64\bin
PrivilegesRequired=lowest
EnableDirDoesntExistWarning=False
DirExistsWarning=no

[ThirdParty]
UseRelativePaths=True

[Languages]
Name: "korean"; MessagesFile: "compiler:Languages\Korean.isl"

[CustomMessages]
needjava=Folder must contain java.exe(set automatically)
korean.needjava=java.exe가 포함된 폴더를 선택해야 합니다(자동으로 선택됨)
OptiDesc=OptiFabric(OptiFine)
korean.OptiDesc=옵티패브릭(옵티파인)
MiniDesc=Xaero's Minimap
korean.MiniDesc=Xaero의 미니맵
VoiceDesc=Simple Voice Chat
korean.VoiceDesc=간단 보이스 챗(음성 채팅)
CocoaInput=CocoaInput
korean.CocoaInput=한글 입력
WindowedFull=Windowed Fullscreen
korean.WindowedFull=전체창 보기
Sodium=Sodium
korean.Sodium=Sodium
Canvasmod=Canvas
korean.Canvasmod=Canvas
Render=Renderer
korean.Render=렌더러
standard=standard
korean.standard=기본
custom=custom
korean.custom=사용자선택

[Types]
Name: "standard"; Description: "{cm:standard}"
Name: "custom"; Description: "{cm:custom}"; Flags: iscustom

[Components]
Name: "Renderer"; Description: "{cm:Render}"; Types: standard custom;
Name: "Renderer\OptiFine"; Description: "{cm:OptiDesc} {#JarName2}"; Types: standard custom; Flags: exclusive
Name: "Renderer\Sodium"; Description: "{cm:Sodium} {#JarName9}"; Types: custom; Flags: exclusive
Name: "Renderer\Canvas"; Description: "{cm:Canvasmod} {#JarName10}"; Types: custom; Flags: exclusive
Name: "VoiceChat"; Description: "{cm:VoiceDesc} {#JarName6}"; Types: custom
Name: "Minimap"; Description: "{cm:MiniDesc} {#JarName5}"; Types: custom
Name: "CocoaInput"; Description: "{cm:CocoaInput} {#JarName7}"; Types: standard custom
Name: "WindowedFull"; Description: "{cm:WindowedFull} {#JarName8}"; Types: custom

[Code]
const
  OptiFineCmd='java -jar ';
  MCPFDir='{userappdata}\.minecraft\';
  ModsDir='Mods';
  NewMCDir='{#SetupSetting("DefaultDirName")}';

var
  SMCDir: string;
  SJava: string;
  SMCPFDir: string;
  SModsDir: string;
  DirMsg: TLabel;

function MCDirCheck:string;
var
  SD, ST: string;
  SL: TStringList;
  i, j:Integer;
begin
  SD:=WizardForm.DirEdit.Text;
  if DirExists(SD) then
    Result:=SD
    else
    begin
      // scan log file
      SD:=ExpandConstant(MCPFDir)+'nativelog.txt';
      if FileExists(SD) then 
      begin
        SL:=TStringList.Create;
        try
          SL.LoadFromFile(SD);
          if SL.Count>0 then
            for i:=0 to SL.Count-1 do
            begin
              // new beta version java
              j:=Pos('command line string:',SL[i]);
              if j>0 then
              begin
                ST:=Trim(Copy(SL[i],j+20,1024));
                j:=Pos('.exe',ST);
                if j>0 then
                begin
                  ST:=Copy(ST,1,j+4);
                  ST:=ExtractFilePath(ST);
                end else
                  ST:='';
              end;
              // old version java runtime
              j:=Pos('Java dir:',SL[i]);
              if j>0 then
              begin
                SD:=Trim(Copy(SL[i],j+9,1024))+'\bin';
                break;
              end;
            end;
        finally
          SL.Free;
        end;
        if DirExists(SD) then
          Result:=SD
          else
            Result:='';
      end else
        Result:='';

      // use installed JRE path
      if Result='' then
      begin
        SD:=GetEnv('JAVA_HOME');
        if (SD<>'') and DirExists(SD) then
          Result:=SD+'\bin'
          else
            // scan registry
            if Result='' then
            begin
              if RegQueryStringValue(HKEY_LOCAL_MACHINE,'SOFTWARE\WOW6432Node\Mojang\Minecraft','InstallDirNew',SD) then
                Result:=SD+'runtime\jre-x64\bin'
                else 
                if RegQueryStringValue(HKEY_LOCAL_MACHINE,'SOFTWARE\Mojang\Minecraft','InstallDirNew',SD) then
                  Result:=SD+'runtime\jre\bin'
                  else
                    Result:='';
              if not DirExists(Result) then
                Result:='';
            end;
      end;
      // new launcher has java beta version
      if Result='' then
      begin
        // use launcher folder
        if ST<>'' then
        begin
          Result:=ST+'runtime'+'{#JavaBeta}';
          if not DirExists(Result) then
          begin
            Result:=ST+'runtime'+'\jre-x64\bin';
            if not DirExists(Result) then
              Result:='';
          end;
        end;
        // no java runtime found
        Result:=ExpandConstant('{#DefaultRuntime}{#JavaBeta}');
      end;
    end;
end;

function MCJavaCheck:string;
var
  SD: string;
begin
  SD:=SMCDir+'\java.exe';
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

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID=wpReady then begin
    if (SMCDir='') or (SJava='') or (SMCPFDir='') or (SModsDir='') then
      WizardForm.NextButton.Enabled:=False;
  end else
  // check and fill folder
  if CurPageID=wpSelectDir then begin
    // add label
    WizardForm.DirEdit.Text:=ExpandConstant(NewMCDir);
    if DirMsg=nil then begin
      DirMsg:=TLabel.Create(WizardForm);
      DirMsg.Parent:=WizardForm.SelectDirPage;
    end;
    DirMsg.Top:=ScaleY(110);
    DirMsg.Caption:=CustomMessage('needjava');

    SMCDir:=MCDirCheck;
    if SMCDir='' then
      DirMsg.Font.Color:=clRed
      else
        DirMsg.Font.Color:=clGreen;
    SJava:=MCJavaCheck;
    if SJava<>'' then
      WizardForm.DirEdit.Text:=SMCDir;
  end else
  if CurPageID=wpInstalling then
  begin
    // optifine
    if FileExists(SModsDir+'\'+'{#JarName2}.jar') then
      DeleteFile(SModsDir+'\'+'{#JarName2}.jar');
    if FileExists(SModsDir+'\'+'{#JarName3}.jar') then
      DeleteFile(SModsDir+'\'+'{#JarName3}.jar');
    // sodium
    if FileExists(SModsDir+'\'+'{#JarName9}.jar') then
      DeleteFile(SModsDir+'\'+'{#JarName9}.jar');
    // Canvas
    if FileExists(SModsDir+'\'+'{#JarName10}.jar') then
      DeleteFile(SModsDir+'\'+'{#JarName10}.jar');
  end;
end;

function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo, MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
begin
  Result:='{#JarName1} {#JarName4} Installer {#CurrDate}'+#13#10;
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
    Result:=Result+' - ok'
    else
      Result:=Result+' No Minecraft user data';
  Result:=Result+#13#10;
  SModsDir:=SMCPFDir+ModsDir;
  CreateDir(SModsDir);
  if DirExists(SModsDir) then
    Result:=Result+'Access Mods Folder - ok'
      else begin
        Result:=Result+'Cannot access Mods folder';
        SModsDir:='';
      end;
  Result:=Result+#13#10;
end;

function GetOutDir(dummy:string):string;
begin
  Result:=SModsDir;
end;

function JavaExec(dummy: string):string;
begin
  Result:=SJava;
end;

function GetFabricFile(dummy:string):string;
begin
  Result:=' -jar '+ExpandConstant('{tmp}')+'\'+'{#JarName1}.jar';
end;

function GetShaderDir(dummy:string):string;
begin
  Result:=SMCPFDir+'shaderpacks';
  CreateDir(Result);
end;

[Files]
; Install Fabric
Source: "{#JarName1}.jar"; DestDir: "{tmp}"; Flags: ignoreversion
; Mod OptiFabric
Source: "{#JarName3}.jar"; DestDir: "{code:GetOutDir}"; Components: Renderer\OptiFine; Flags: ignoreversion
; Mod OptiFine
Source: "{#JarName2}.jar"; DestDir: "{code:GetOutDir}"; Components: Renderer\OptiFine; Flags: ignoreversion
; Mod Fabric API
Source: "{#JarName4}.jar"; DestDir: "{code:GetOutDir}"; Flags: ignoreversion
; Mod minimap
Source: "{#JarName5}.jar"; DestDir: "{code:GetOutDir}"; Components: Minimap; Flags: ignoreversion
; Simple Voice chat
Source: "{#JarName6}.jar"; DestDir: "{code:GetOutDir}"; Components: VoiceChat; Flags: ignoreversion
; CocoaInput
Source: "{#JarName7}.jar"; DestDir: "{code:GetOutDir}"; Components: CocoaInput; Flags: ignoreversion
; Windowed FullScreen
Source: "{#JarName8}.jar"; DestDir: "{code:GetOutDir}"; Components: WindowedFull; Flags: ignoreversion
; Sodium
Source: "{#JarName9}.jar"; DestDir: "{code:GetOutDir}"; Components: Renderer\Sodium; Flags: ignoreversion
; Canvas
Source: "{#JarName10}.jar"; DestDir: "{code:GetOutDir}"; Components: Renderer\Canvas; Flags: ignoreversion
; Shaders
Source: "Builders_QOL_Shaders_V2.8.2.zip"; DestDir: "{code:GetShaderDir}"; Components: Renderer\OptiFine; Flags: ignoreversion
Source: "Builders_Modded_Shaders_V2.8.2.zip"; DestDir: "{code:GetShaderDir}"; Components: Renderer\OptiFine; Flags: ignoreversion
Source: "SEUS-Renewed-v1.0.1.zip"; DestDir: "{code:GetShaderDir}"; Components: Renderer\OptiFine; Flags: ignoreversion
Source: "VanillaPlus_v3.0a.zip"; DestDir: "{code:GetShaderDir}"; Components: Renderer\OptiFine; Flags: ignoreversion
Source: "Nostalgia_v3.1.zip"; DestDir: "{code:GetShaderDir}"; Components: Renderer\OptiFine; Flags: ignoreversion

[Run]
Filename: "{code:JavaExec}"; Parameters: "{code:GetFabricFile}";

