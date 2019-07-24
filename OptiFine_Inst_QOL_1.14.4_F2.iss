; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{7E80BB62-9B38-4633-88DD-AAA0F2D03D0A}
AppName=OptiFine 1.14.3_HD_U_F2(+QOL) Installer
AppVersion=0.2
;AppVerName=OptiFine Installer 1.14.3_HD_U_F2
AppPublisher=anon
OutputBaseFilename=OptiFine_1.14.3_HD_U_F2_QOL_Inst
Compression=lzma
SolidCompression=yes
Uninstallable=no
VersionInfoTextVersion=1.14.3_HD_U_F2(+QOL)
DefaultDirName={commonpf32}\Minecraft Launcher\runtime\jre-x64\bin
PrivilegesRequired=lowest
EnableDirDoesntExistWarning=False
DirExistsWarning=no

[ThirdParty]
UseRelativePaths=True

[Languages]
Name: "korean"; MessagesFile: "compiler:Languages\Korean.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"

[Code]
const
  OptiFineCmd='java -jar ';
  MCPFDir='{userappdata}\.minecraft\';
  OptiDir='OptiFine';
  NewMCDir='{commonpf32}\Minecraft Launcher\runtime\jre-x64\bin';

var
  SMCDir: string;
  SJava: string;
  SMCPFDir: string;
  SOptiDir: string;
  DirMsg: TLabel;

function MCDirCheck:string;
var
  SD: string;
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
    if (SMCDir='') or (SJava='') or (SMCPFDir='') or (SOptiDir='') then
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
    DirMsg.Caption:='java(c).exe가 포함된 폴더를 선택해야 합니다.'+#13#10+'Folder must contain java(c).exe';

    SMCDir:=MCDirCheck;
    if SMCDir='' then
      DirMsg.Font.Color:=clRed
      else
        DirMsg.Font.Color:=clGreen;
    SJava:=MCJavaCheck;
    if SJava<>'' then
      WizardForm.DirEdit.Text:=SMCDir;
  end;
end;

function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo, MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
begin
  Result:='OptiFine 1.14.3_HD_U_F2(+QOL) Installer'+#13#10;
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

function GetOutDir(dummy:string):string;
begin
  Result:=SOptiDir;
end;

function GetShaderDir(dummy:string):string;
begin
  Result:=SMCPFDir+'shaderpacks';
  CreateDir(Result);
end;

function JavaExec(dummy: string):string;
begin
  Result:=SJava;
end;

function GetOptiFile(dummy:string):string;
begin
  Result:=' -jar '+SOptiDir+'\'+'OptiFine_1.14.3_HD_U_F2.jar';
end;

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: "OptiFine_1.14.3_HD_U_F2.jar"; DestDir: "{code:GetOutDir}"; Flags: ignoreversion
Source: "BSL+v7.1.02.2.zip"; DestDir: "{code:GetShaderDir}"; Flags: ignoreversion
Source: "Builder's QOL Shaders V2.2.3.zip"; DestDir: "{code:GetShaderDir}"; Flags: ignoreversion
Source: "Builder's Modded Shaders V2.3.0.zip"; DestDir: "{code:GetShaderDir}"; Flags: ignoreversion

[Run]
Filename: "{code:JavaExec}"; Parameters: "{code:GetOptiFile}"; Flags: postinstall nowait

