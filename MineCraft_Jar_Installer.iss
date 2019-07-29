; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define JarName "MineCraft Jar Install"
#define NewMCFolder "{commonpf32}\Minecraft Launcher\runtime\jre-x64\bin"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{E3B4E41E-697A-4C07-BB22-3A38C4392D77}
AppName={#JarName}
AppVersion=0.8
;AppVerName=OptiFine Installer {#JarName}
AppPublisher=anon
OutputBaseFilename={#JarName}
Compression=lzma
SolidCompression=yes
Uninstallable=no
VersionInfoTextVersion={#JarName}
PrivilegesRequired=lowest
CreateAppDir=False
ShowLanguageDialog=auto

[ThirdParty]
UseRelativePaths=True

[Languages]
Name: "korean"; MessagesFile: "compiler:Languages\Korean.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"

[CustomMessages]
FilePage1=Minecraft jar file to install
korean.FilePage1=설치할 Minecraft jar 파일
FilePage2=Select Minecraft jar File to install?
korean.FilePage2=설치할 Minecraft jar 파일이 어떤건가요?
FilePage3=Select Minecraft jar file, then press Next.
korean.FilePage3=Minecraft jar 파일이 있는 곳을 선택하고, 다음 버튼을 누르세요.
FilePage4=&Jar File Path: 
korean.FilePage4=&Jar 파일 경로: 
DirPage1=Java Runtime Folder
korean.DirPage1=자바 런타임 폴더
DirPage2=Where is Java Runtime Folder?
korean.DirPage2=자바 런타임이 있는 폴더가 어딘가요?
DirPage3=Using Java.exe for installing Minecraft jar file.\n\n
korean.DirPage3=Java.exe를 Minecraft jar 파일을 설치하는데 사용합니다.\n\n
DirPage4=Press Next to continue. Press Browse for selecting another folder.\n
korean.DirPage4=계속 하려면 다음을 누르세요. 다른 폴더를 선택하려면 찾아보기를 누르세요.\n
DirPage5=(It automatically set by using nativelog.txt in Minecraft user folder.)\n
korean.DirPage5=(기본적으로 마인크래프트 사용자 폴더의 nativelog.txt를 사용하여 위치를 찾습니다.)\n
DirPage6=Select folder contains java.exe.\n
korean.DirPage6=java.exe가 포함된 폴더를 선택해야 합니다.\n
ReadyMemo1= - No Jar File\n
korean.ReadyMemo1= - Jar File 없음\n
ReadyMemo2= No Java Runtime
korean.ReadyMemo2= 자바 런타임 없음
ReadyMemo3= No java.exe
korean.ReadyMemo3= jave.exe 없음
ReadyMemo4= No Minecraft user data
korean.ReadyMemo4= 마인크래프트 사용자 데이터 없음

[Code]
const
  MCPFDir='{userappdata}\.minecraft\';
  NewMCDir='{#NewMCFolder}';

var
  SMCDir: string;
  SJava: string;
  SMCPFDir: string;
  FilePage: TInputFileWizardPage;
  DirPage: TInputDirWizardPage;
  SJarFile: string;

function CustomMessageN(const id:string):string;
begin
  Result:=CustomMessage(id);
  StringChangeEx(Result,'\n',#13#10,True);
end;

function MCDirCheck:string;
var
  SD: string;
  SL: TStringList;
  i, j:Integer;
begin
  SD:=DirPage.Values[0];
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

function CheckJarFile:string;
begin
  if FileExists(FilePage.Values[0]) then
    Result:=FilePage.Values[0]
    else
      Result:='';
end;

procedure InitializeWizard();
begin
  FilePage:=CreateInputFilePage(wpWelcome,
  CustomMessageN('FilePage1'),CustomMessageN('FilePage2'),
  CustomMessageN('FilePage3'));
  FilePage.Add(CustomMessageN('FilePage4'),
  'Jar File|*.jar|All files|*.*',
  '.jar');

  DirPage:=CreateInputDirPage(wpWelcome,
  CustomMessageN('DirPage1'),CustomMessageN('DirPage2') ,
  CustomMessageN('DirPage3')+
  CustomMessageN('DirPage4')+
  CustomMessageN('DirPage5'),
  False, '');
  DirPage.Add(CustomMessageN('DirPage6'));
  DirPage.Values[0]:=ExpandConstant(NewMCDir);

  SMCDir:=MCDirCheck;
  SJava:=MCJavaCheck;
  if SJava<>'' then
    DirPage.Values[0]:=SMCDir;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID=wpReady then begin
    if (SMCDir='') or (SJava='') or (SMCPFDir='') or (SJarFile='') then
      WizardForm.NextButton.Enabled:=False;
  end;
end;

function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo, MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
begin
  SJarFile:=CheckJarFile;
  Result:='Jar File : '+ExtractFileName(SJarFile);
  if SJarFile<>'' then
    Result:=Result+' - ok'#13#10
    else
      Result:=Result+CustomMessageN('ReadyMemo1');
  SMCDir:=MCDirCheck;
  Result:=Result+SMCDir;
  if SMCDir<>'' then
    Result:=Result+' - ok'
    else
      Result:=Result+CustomMessageN('ReadyMemo2');
  Result:=Result+#13#10;
  SJava:=MCJavaCheck;
  Result:=Result+SJava;
  if SJava<>'' then
    Result:=Result+' - ok'
    else
      Result:=Result+CustomMessageN('ReadyMemo3');
  Result:=Result+#13#10;
  SMCPFDir:=MCPFDirCheck;
  Result:=Result+SMCPFDir;
  if SMCPFDir<>'' then
    Result:=Result+' -ok'
    else
      Result:=Result+CustomMessageN('ReadyMemo4');
  Result:=Result+#13#10;
end;

function JavaExec(dummy: string):string;
begin
  Result:=SJava;
end;

function GetJarFile(dummy:string):string;
begin
  Result:=' -jar "'+SJarFile+'"';
end;

[Run]
Filename: "{code:JavaExec}"; Parameters: "{code:GetJarFile}"; Flags: postinstall nowait

