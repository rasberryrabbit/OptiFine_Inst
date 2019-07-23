; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{A4E87F40-940A-4E29-85F4-16DD68B67AC1}
AppName=OptiFine preview_OptiFine_1.14.4_HD_U_F2_pre1 Installer
AppVersion=0.5
;AppVerName=OptiFine Installer preview_OptiFine_1.14.4_HD_U_F2_pre1
AppPublisher=anon
OutputBaseFilename=OptiFine_preview_OptiFine_1.14.4_HD_U_F2_pre1_Inst
Compression=lzma
SolidCompression=yes
Uninstallable=no
VersionInfoTextVersion=preview_OptiFine_1.14.4_HD_U_F2_pre1
DefaultDirName={commonpf32}\Minecraft Launcher\runtime\jre-x64\bin
PrivilegesRequired=lowest
EnableDirDoesntExistWarning=False
DirExistsWarning=no

[ThirdParty]
UseRelativePaths=True

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
  Result:='OptiFine preview_OptiFine_1.14.4_HD_U_F2_pre1 Installer'+#13#10;
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

function JavaExec(dummy: string):string;
begin
  Result:=SJava;
end;

function GetOptiFile(dummy:string):string;
begin
  Result:=' -jar '+SOptiDir+'\'+'preview_OptiFine_1.14.4_HD_U_F2_pre1.jar';
end;

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: "preview_OptiFine_1.14.4_HD_U_F2_pre1.jar"; DestDir: "{code:GetOutDir}"; Flags: ignoreversion

[Run]
Filename: "{code:JavaExec}"; Parameters: "{code:GetOptiFile}"; Flags: nowait;

