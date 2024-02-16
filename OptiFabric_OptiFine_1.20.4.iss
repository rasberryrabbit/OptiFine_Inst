; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define CurrDate GetDateTimeString('yymmddhhnn', '', '')

#define JarName1 'fabric-installer-1.0.0'
; optifine
;#define JarName2 'OptiFine_1.19.2_HD_U_H9'
;#define JarName3 'optifabric-1.13.16'

#define JarName5 'Xaeros_Minimap_23.9.5_Fabric_1.20.4'
#define JarName12 'XaerosWorldMap_1.37.5_Fabric_1.20.4'

#define JarName11 'BetterF3-8.0.2-Fabric-1.20.2'
#define JarName18 'modmenu-9.0.0-pre.1'
#define JarName6 'voicechat-fabric-1.20.4-2.4.31'

#define JarName4 'fabric-api-0.93.1+1.20.4'
#define JarName7 'CocoaInput-1.20.2-fabric-4.4.0-EXPERIMENTAL'
; performance
;#define JarName13 'phosphor-fabric-mc1.19.x-0.8.1'
#define JarName15 'starlight-1.1.3+fabric.f5dcd1a'
; memory leak fix
#define JarName10 'memoryleakfix-fabric-1.17+-1.1.5'
; iris shader
#define JarName9 'sodium-fabric-0.5.8+mc1.20.4'
;#define JarName16 'sodium-fabric-mc1.19.4-0.4.11+build.26-api'
#define JarName14 'iris-mc1.20.4-1.6.17'
;#define JarName22 'iris-mc1.20.4-1.6.15-beta.1-c127a123-dirty'

;#define JarName20 'effortless-fabric-1.20.2-2.0.0-alpha.1'
#define JarName21 'lithium-fabric-mc1.20.4-0.12.1'

#define MCVersion '1.20.4'

#define ZipName1 'SEUS-Renewed-v1.0.1'
#define ZipName2 'Builder''s Modded Shaders V2.10.0'
#define ZipName3 'Sildur''s+Vibrant+Shaders+v1.50+Lite'
#define ZipName4 'MakeUp-UltraFast-8.6g'
#define ZipName5 'BSL_v8.2.01'

#define DefaultRuntime '{commonpf32}\Minecraft Launcher'

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{55E52D9A-F129-498C-BFD2-D7BD042CBD79}
AppName={#MCVersion}|{#JarName14}|{#JarName9}|{#CurrDate}
AppVersion=0.99a
;AppVerName=OptiFine Installer {#JarName2}
AppPublisher=anon
OutputBaseFilename=Fabric_{#MCVersion}_{#JarName14}_{#CurrDate}
Compression=lzma2/max
SolidCompression=yes
Uninstallable=no
VersionInfoTextVersion={#MCVersion}|{#JarName14}|{#JarName9}
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
MiniDesc=Minimap
korean.MiniDesc=미니맵
VoiceDesc=Simple Voice Chat(Need Sever support)
korean.VoiceDesc=간단 보이스챗(서버 지원 필요)
CocoaInput=CocoaInput
korean.CocoaInput=한글 입력
Sodium=Sodium
korean.Sodium=소듐
Sodium2=Sodium
korean.Sodium2=소듐
Iris=Iris
korean.Iris=아이리스
Iris2=Iris
korean.Iris2=아이리스
IrisTest=Iris
korean.IrisTest=아이리스
Render=Renderer
korean.Render=렌더러
standard=standard
korean.standard=기본
custom=custom
korean.custom=사용자선택
Shader=Shader
korean.Shader=세이더
Debug=Debug
korean.Debug=디버그
MapMod=Map
korean.MapMod=지도
WorldDesc=World Map
korean.WorldDesc=월드맵
PerfMod=Performance
korean.PerfMod=성능
DeleteMods=Delete previous Mods
korean.DeleteMods=이전 모드 지우기
ModMenu=ModMenu
korean.ModMenu=모드 메뉴
MemoryFix=Memory leak Fix
korean.MemoryFix=메모리 누수 방지
Building=Building
korean.Building=건설
Effortless=Effortless
korean.Effortless=Effortless

[Types]
Name: "standard"; Description: "{cm:standard}"
Name: "custom"; Description: "{cm:custom}"; Flags: iscustom

[Components]
Name: "DeleteOldMod"; Description: "{cm:DeleteMods}"; Types: standard custom

Name: "CocoaInput"; Description: "{cm:CocoaInput} {#JarName7}"; Types: standard custom

Name: "Renderer"; Description: "{cm:Render}"; Types: standard custom;
;Name: "Renderer\OptiFine"; Description: "{cm:OptiDesc} {#JarName2}"; Types: custom; Flags: exclusive fixed
; sodium + iris 
Name: "Renderer\Sodium2"; Description: "{cm:Sodium2} {#JarName9}"; Types: standard custom; Flags: exclusive
;Name: "Renderer\Sodium2\API"; Description: "{cm:Sodium2} {#JarName16}"; Types: standard custom;
Name: "Renderer\Sodium2\Iris"; Description: "{cm:Iris2} {#JarName14}"; Types: standard custom; Flags: exclusive
;Name: "Renderer\Sodium2\Iris1"; Description: "{cm:Iris2} {#JarName22}"; Types: custom; Flags: exclusive

Name: "BetterF3"; Description: "{cm:Debug} {#JarName11}"; Types: custom

Name: "MapMod"; Description: "{cm:MapMod}"; Types: custom
Name: "MapMod\Worldmap"; Description: "{cm:WorldDesc} {#JarName12}"; Types: custom
Name: "MapMod\Minimap"; Description: "{cm:MiniDesc} {#JarName5}"; Types: custom

;Name: "Building"; Description: "{cm:Building}"; Types: custom
;Name: "Building\Effortless"; Description: "{cm:Effortless} {#JarName20}"; Types: custom

Name: "PerfMod"; Description: "{cm:PerfMod}"; Types: custom
;Name: "PerfMod\phosphor"; Description: "{#JarName13}"; Types: custom; Flags: exclusive
Name: "PerfMod\starlight"; Description: "{#JarName15}"; Types: standard custom
Name: "PerfMod\lithium"; Description: "{#JarName21}"; Types: custom

Name: "MemoryFix"; Description: "{cm:MemoryFix}"; Types: custom
Name: "MemoryFix\memoryleakfix"; Description: "{#JarName10}"; Types: standard custom

Name: "Shader"; Description: "{cm:Shader}"; Types: standard custom;
Name: "Shader\Zip1"; Description: "{#ZipName1}"; Types: standard custom;
Name: "Shader\Zip2"; Description: "{#ZipName2}"; Types: standard custom;
Name: "Shader\Zip3"; Description: "{#ZipName3}"; Types: standard custom;
Name: "Shader\Zip4"; Description: "{#ZipName4}"; Types: standard custom;
;Name: "Shader\Zip5"; Description: "{#ZipName7}"; Types: standard custom;

Name: "VoiceChat"; Description: "{cm:VoiceDesc} {#JarName6}"; Types: custom
Name: "FabricAPI"; Description: "{#JarName4}"; Types: standard custom; Flags: fixed
;Name: "ModMenu"; Description: "{cm:ModMenu} {#JarName18}"; Types: custom;

[Code]
const
  OptiFineCmd='java -jar ';
  MCPFDir='{userappdata}\.minecraft\';
  ModsDir='Mods';
  NewMCDir='{#SetupSetting("DefaultDirName")}';
  MaxFindDeep=16;
  MaxFindFolder=5000;

var
  SMCDir: string;
  SJava: string;
  SMCPFDir: string;
  SModsDir: string;
  DirMsg: TLabel;
  FindRec: array[0..MaxFindDeep] of TFindRec;
  FindDeep: Integer;

function FindFilePath(path, filename:string):string;
var
  bf: Boolean;
  cPath: string;
  i, j: Integer;
begin
  if path='' then
    exit;
  FindDeep:=0;
  j:=0;
  cPath:='';
  bf:=FindFirst(path+'\*.*',FindRec[FindDeep]);
  if bf then begin
    try
    while bf do begin
      // skip '.' and '..'
      if (FindRec[FindDeep].Name<>'.') and (FindRec[FindDeep].Name<>'..') then begin
        if FindRec[FindDeep].Attributes and FILE_ATTRIBUTE_DIRECTORY<>0 then begin
          // folder
          Inc(j);
          if j>MaxFindFolder then
            break;
          if FindDeep<MaxFindDeep then begin
            cPath:='';
            for i:=0 to FindDeep do
              cPath:=cPath+'\'+FindRec[i].Name;
            Inc(FindDeep);
            bf:=FindFirst(path+cpath+'\*.*',FindRec[FindDeep]);
            if bf then
              continue;
          end;
        end else begin
          // file
          if CompareText(FindRec[FindDeep].Name,filename)=0 then begin
            cPath:=path;
            if FindDeep>0 then
              for i:=0 to FindDeep-1 do
                cPath:=cPath+'\'+FindRec[i].Name;
            Result:=cPath;
            break;
          end;
        end;
      end;
      // Next Folder
      bf:=FindNext(FindRec[FindDeep]);
      while not bf do begin
        FindClose(FindRec[FindDeep]);
        if FindDeep=0 then
          break;
        Dec(FindDeep);
        bf:=FindNext(FindRec[FindDeep]);
      end;
    end;
    finally
      // Free FindRec
      if FindDeep>0 then
        for i:=FindDeep downto 0 do
          FindClose(FindRec[FindDeep]);
    end;
  end;
end;

function MCDirCheck:string;
var
  SD, ST: string;
  SL: TStringList;
  i, j, k: Integer;
begin
  SD:=WizardForm.DirEdit.Text;
  ST:=FindFilePath(SD,'java.exe');
  if ST<>'' then
    Result:=ST
    else
    begin
      // scan log file
      SD:=ExpandConstant(MCPFDir)+'launcher_log.txt';
      if FileExists(SD) then 
      begin
        SL:=TStringList.Create;
        try
          SL.LoadFromFile(SD);
          if SL.Count>0 then
            for i:=0 to SL.Count-1 do
            begin
              // new beta version java
              j:=Pos('string:',SL[i]);
              if j>0 then
              begin
                k:=Pos('"',SL[i]);
                if k>0 then
                  j:=k+1
                  else
                    j:=j+7;
                ST:=Trim(Copy(SL[i],j,1024));
                j:=Pos('.exe',ST);
                if j>0 then
                begin
                  ST:=Copy(ST,1,j+4);
                  ST:=ExtractFileDir(ST);
                end else
                  ST:='';
              end;
              // old version java runtime
              j:=Pos('Java dir:',SL[i]);
              if j>0 then
              begin
                SD:=Trim(Copy(SL[i],j+9,1024))+'\bin';
                if ST<>'' then
                  break;
              end;
            end;
        finally
          SL.Free;
        end;
        Result:=FindFilePath(SD,'java.exe');
      end else
        Result:='';
      // use installed JRE path
      if Result='' then
      begin
        SD:=GetEnv('JAVA_HOME');
        if (SD<>'')then
          Result:=FindFilePath(SD,'java.exe');
      end;
      // new launcher has java beta version
      if Result='' then
      begin
        // use launcher folder
        if ST<>'' then
          Result:=FindFilePath(ST,'java.exe');
        if Result='' then
          Result:=FindFilePath(ExpandConstant('{#DefaultRuntime}'),'java.exe');
        if Result='' then
          Result:=FindFilePath(ExpandConstant('{commonpf32}'),'java.exe');
        if Result='' then
          Result:=FindFilePath(ExpandConstant('{commonpf}'),'java.exe');
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

procedure DirEdit_Change(Sender: TObject);
begin
  SMCDir:=MCDirCheck;
  if SMCDir='' then
    DirMsg.Font.Color:=clRed
    else
      DirMsg.Font.Color:=clGreen;
  SJava:=MCJavaCheck;
  if SJava<>'' then
    WizardForm.DirEdit.Text:=SMCDir;
end;

procedure InitializeWizard;
begin
  WizardForm.DirEdit.OnChange:=@DirEdit_Change;
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

    DirEdit_Change(nil);
  end else
  if CurPageID=wpInstalling then
  begin
    if WizardIsComponentSelected('DeleteOldMod') then 
    begin
      DelTree(SModsDir+'\*.jar',False,True,False);
    end;
  end;
end;

function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo, MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
begin
  Result:='{#MCVersion} {#JarName14} {#JarName9} {#CurrDate}'+#13#10;
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
;Source: "{#JarName3}.jar"; DestDir: "{code:GetOutDir}"; Components: Renderer\OptiFine; Flags: ignoreversion
; Mod OptiFine
;Source: "{#JarName2}.jar"; DestDir: "{code:GetOutDir}"; Components: Renderer\OptiFine; Flags: ignoreversion
; Mod Fabric API
Source: "{#JarName4}.jar"; DestDir: "{code:GetOutDir}"; Components: FabricAPI; Flags: ignoreversion
; Mod minimap
Source: "{#JarName5}.jar"; DestDir: "{code:GetOutDir}"; Components: MapMod\Minimap; Flags: ignoreversion
; Mod worldmap
Source: "{#JarName12}.jar"; DestDir: "{code:GetOutDir}"; Components: MapMod\Worldmap; Flags: ignoreversion
; Simple Voice chat
Source: "{#JarName6}.jar"; DestDir: "{code:GetOutDir}"; Components: VoiceChat; Flags: ignoreversion
; CocoaInput
Source: "{#JarName7}.jar"; DestDir: "{code:GetOutDir}"; Components: CocoaInput; Flags: ignoreversion
; Sodium + iris
Source: "{#JarName9}.jar"; DestDir: "{code:GetOutDir}"; Components: Renderer\Sodium2; Flags: ignoreversion
;Source: "{#JarName16}.jar"; DestDir: "{code:GetOutDir}"; Components: Renderer\Sodium2\API; Flags: ignoreversion
Source: "{#JarName14}.jar"; DestDir: "{code:GetOutDir}"; Components: Renderer\Sodium2\Iris; Flags: ignoreversion
;Source: "{#JarName22}.jar"; DestDir: "{code:GetOutDir}"; Components: Renderer\Sodium2\Iris1; Flags: ignoreversion
; memory leak fix
Source: "{#JarName10}.jar"; DestDir: "{code:GetOutDir}"; Components: MemoryFix\memoryleakfix; Flags: ignoreversion
; Debug mod
Source: "{#JarName11}.jar"; DestDir: "{code:GetOutDir}"; Components: BetterF3; Flags: ignoreversion
; performance
;Source: "{#JarName13}.jar"; DestDir: "{code:GetOutDir}"; Components: PerfMod\phosphor; Flags: ignoreversion
Source: "{#JarName15}.jar"; DestDir: "{code:GetOutDir}"; Components: PerfMod\starlight; Flags: ignoreversion
; Mod Menu
;Source: "{#JarName18}.jar"; DestDir: "{code:GetOutDir}"; Components: ModMenu; Flags: ignoreversion
;Building
;Source: "{#JarName20}.jar"; DestDir: "{code:GetOutDir}"; Components: Building\Effortless; Flags: ignoreversion
; Shaders
Source: "{#ZipName1}.zip"; DestDir: "{code:GetShaderDir}"; Components: Shader\Zip1; Flags: ignoreversion
Source: "{#ZipName2}.zip"; DestDir: "{code:GetShaderDir}"; Components: Shader\Zip2; Flags: ignoreversion
Source: "{#ZipName3}.zip"; DestDir: "{code:GetShaderDir}"; Components: Shader\Zip3; Flags: ignoreversion
Source: "{#ZipName4}.zip"; DestDir: "{code:GetShaderDir}"; Components: Shader\Zip4; Flags: ignoreversion
;Source: "{#ZipName5}.zip"; DestDir: "{code:GetShaderDir}"; Components: Shader\Zip5; Flags: ignoreversion

[Run]
Filename: "{code:JavaExec}"; Parameters: "{code:GetFabricFile} client -mcversion {#MCVersion} ";

