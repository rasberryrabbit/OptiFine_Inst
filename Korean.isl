; *** Inno Setup version 6.1.0+ Korean messages ***
;
; Translated by EuiChul Shin <enfshin@naver.com>
; Translation date: OCT 11, 2021

[LangOptions]
; The following three entries are very important. Be sure to read and 
; understand the '[LangOptions] section' topic in the help file.
LanguageName=Korean
LanguageID=$0412
LanguageCodePage=949
; If the language you are translating to requires special font faces or
; sizes, uncomment any of the following entries and change them accordingly.
;DialogFontName=
;DialogFontSize=8
;WelcomeFontName=Verdana
;WelcomeFontSize=12
;TitleFontName=Arial
;TitleFontSize=29
;CopyrightFontName=Arial
;CopyrightFontSize=8

[Messages]

; *** Application titles
SetupAppTitle=설치
SetupWindowTitle=설치 - %1
UninstallAppTitle=삭제
UninstallAppFullTitle=%1 삭제

; *** Misc. common
InformationTitle=안내
ConfirmTitle=확인
ErrorTitle=에러

; *** SetupLdr messages
SetupLdrStartupMessage=확인을 누르시면 %1 가 설치됩니다. 계속하시겠습니까?
LdrCannotCreateTemp=임시 파일을 만드는데 실패하였습니다. 설치가 종료됩니다.
LdrCannotExecTemp=임시 폴더 안의 파일을 실행하는데 실패하였습니다. 설치가 종료됩니다.

; *** Startup error messages
LastErrorMessage=%1.%n%n오류 %2: %3
SetupFileMissing=설치 폴더에서 파일의 %1 가 없습니다. 문제를 해결하거나 프로그램의 새 사본을 얻으십시오
SetupFileCorrupt=설치 파일이 손상되었습니다. 프로그램의 새 사본을 구하십시오.
SetupFileCorruptOrWrongVer=설치 파일이 손상되었거나 이 설치 버전과 호환되지 않습니다. 문제를 해결하거나 프로그램의 새 사본을 얻으십시오.
InvalidParameter=%n%n%1 명령줄에 잘못된 매게변수가 전달되었습니다.
SetupAlreadyRunning=설치가 이미 실행 중입니다.
WindowsVersionNotSupported=이 프로그램은 컴퓨터에서 실행 중인 Windows 버전을 지원하지 않습니다.
WindowsServicePackRequired=이 프로그램에는 %1 Service Pack %2 이상이 필요합니다.
NotOnThisPlatform=이 프로그램은 %1에서 실행되지 않습니다.
OnlyOnThisPlatform=%1에서 이 프로그램을 실행해야 합니다.
OnlyOnTheseArchitectures=이 프로그램은 다음 프로세서 아키텍처용으로 설계된 Windows 버전에만 설치할 수 있습니다 : %n%n%1.
WinVersionTooLowError=이 프로그램은 %1 version %2 혹은 그 이상의 버전이 필요합니다.
WinVersionTooHighError=이 프로그램은 %1 version %2 혹은 그 이상의 버전에 설치될 수 없습니다.
AdminPrivilegesRequired=이 프로그램을 설치하려면 관리자로 로그인해야 합니다.
PowerUserPrivilegesRequired=이 프로그램을 설치할 때는 관리자 또는 Power Users 그룹의 구성원으로 로그인해야 합니다.
SetupAppRunningError=설치 중 %1이(가) 현재 실행 중임을 감지했습니다.%n%n지금 모든 인스턴스를 닫은 다음 계속하려면 [확인]을 클릭하고 끝내려면 [취소]를 클릭하십시오.
UninstallAppRunningError=삭제 중 %1이(가) 현재 실행 중임을 발견했습니다.%n%n지금 모든 인스턴스를 닫은 다음 계속하려면 [확인]을 클릭하고 끝내려면 [취소]를 클릭하십시오.

; *** Startup questions
PrivilegesRequiredOverrideTitle=설치 모드 선택
PrivilegesRequiredOverrideInstruction=설치 모드 선택
PrivilegesRequiredOverrideText1=%1은(는) 모든 사용자(관리 권한 필요) 사용 또는 본인만 사용으로 설치할 수 있습니다.
PrivilegesRequiredOverrideText2=%1은(는) 본인만 사용 또는 모든 사용자(관리 권한 필요) 사용으로 설치할 수 있습니다.
PrivilegesRequiredOverrideAllUsers=모든 사용자용 설치(&A)
PrivilegesRequiredOverrideAllUsersRecommended=모든 사용자용 설치(&A) (필수)
PrivilegesRequiredOverrideCurrentUser=본인용 설치(&M)
PrivilegesRequiredOverrideCurrentUserRecommended=본인용 설치(&M) (필수)

; *** Misc. errors
ErrorCreatingDir="%1"이(가) 폴더를 생성하는데 실패하였습니다.
ErrorTooManyFilesInDir="%1"이(가) 너무 많은 파일을 갖고 있어 폴더에 파일을 생성하는데 실패하였습니다.

; *** Setup common messages
ExitSetupTitle=설피 종료
ExitSetupMessage=설치가 완료되지 않았습니다. 만약 설치를 종료하면, 프로그램이 설치 되지 않습니다. %n%n설치를 완료하기 위해선 다음에 다시 설치를 진행해주시기 바랍니다.%n%n 설치를 종료하시겠습니까?
AboutSetupMenuItem=설정에 관하여(&A)...
AboutSetupTitle=설정 정보
AboutSetupMessage=%1 버전 %2%n%3%n%n%1 홈페이지:%n%4
AboutSetupNote=
TranslatorNote=

; *** Buttons
ButtonBack=< 뒤로가기(&B)
ButtonNext=다음(&N) >
ButtonInstall=설치(&I)
ButtonOK=확인
ButtonCancel=취소
ButtonYes=예(&Y)
ButtonYesToAll=모두 예(&A)
ButtonNo=아니오(&N)
ButtonNoToAll=모두 아니오(&O)
ButtonFinish=완료(&F)
ButtonBrowse=찾아보기(&B)...
ButtonWizardBrowse=찾아보기...(&R)
ButtonNewFolder=새 폴더 만들기(&M)

; *** "Select Language" dialog messages
SelectLanguageTitle=언어 선택
SelectLanguageLabel=설치를 위한 언어 선택

; *** Common wizard text
ClickNext=계속하려면 다음을 눌러주세요. 설치를 종료하려면 취소를 눌러주세요.
BeveledLabel=
BrowseDialogTitle=폴더 찾아보기
BrowseDialogLabel=아래의 목록 중 폴더를 선택하고 확인을 눌러주세요.
NewFolderName=새 폴더

; *** "Welcome" wizard page
WelcomeLabel1=[name] 설치 마법사에 오신걸 환영합니다.
WelcomeLabel2=컴퓨터에 [name/ver]이 설치됩니다..%n%n계속하기 이전에 켜져 있는 다른 프로그램들을 닫을 것을 권장합니다.

; *** "Password" wizard page
WizardPassword=비밀번호
PasswordLabel1=이 설치는 비밀번호로 보호되고 있습니다.
PasswordLabel3=암호를 입력하고 다음을 클릭하여 계속하십시오. 암호는 대소 문자를 구분합니다.
PasswordEditLabel=&비밀번호:
IncorrectPassword=입력한 비밀번호가 올바르지 않습니다. 다시 시도해 주세요.

; *** "License Agreement" wizard page
WizardLicense=라이선스 계약
LicenseLabel=계속하기 전에 다음 중요 정보를 읽으십시오.
LicenseLabel3=다음 라이센스 계약을 읽으십시오. 설치를 계속하기 전에 이 계약의 조건에 동의해야 합니다.
LicenseAccepted=동의합니다(&A)
LicenseNotAccepted=동의하지 않습니다(&D)

; *** "Information" wizard pages
WizardInfoBefore=정보
InfoBeforeLabel=계속하기 전에 다음 중요 정보를 읽으십시오.
InfoBeforeClickLabel=설치를 계속할 준비가 되면 다음을 클릭합니다.
WizardInfoAfter=정보
InfoAfterLabel=계속하기 전에 아래의 중요 정보를 읽으십시오.
InfoAfterClickLabel=설치를 계속할 준비가 되면 다음을 클릭합니다.

; *** "User Information" wizard page
WizardUserInfo=사용자 정보
UserInfoDesc=정보를 입력하세요.
UserInfoName=&사용자 이름:
UserInfoOrg=&조직:
UserInfoSerial=일련 번호(&S):
UserInfoNameRequired=이름을 입력해야 합니다.

; *** "Select Destination Location" wizard page
WizardSelectDir=설치 위치 선택
SelectDirDesc=[name]은(는) 어디에 설치해야 하나요?
SelectDirLabel3=[name]은(는) 아래의 폴더 안에 설치 됩니다.
SelectDirBrowseLabel=계속하려면 다음을 클릭하십시오. 다른 폴더를 선택하려면 찾아보기를 클릭합니다.
DiskSpaceGBLabel=최소 [gb]GB의 여유 디스크 공간이 필요합니다.
DiskSpaceMBLabel=최소 [mb]MB의 여유 디스크 공간이 필요합니다.
CannotInstallToNetworkDrive=설치 프로그램을 네트워크 드라이브에 설치할 수 없습니다.
CannotInstallToUNCPath=UNC 경로에 설치할 수 없습니다
InvalidPath=드라이브 문자가 포함된 전체 경로를 입력해야 합니다. 예:%n%nC:\APP%n%또는 UNC 경로:%n%n\\server\share
InvalidDrive=선택한 드라이브 또는 UNC 공유가 존재하지 않거나 액세스할 수 없습니다. 다른 것을 선택하십시오.
DiskSpaceWarningTitle=디스크 공간이 충분하지 않습니다
DiskSpaceWarning=설치하려면 최소 %1KB의 여유 공간이 필요하지만 선택한 드라이브에는 %2KB만 사용할 수 있습니다.%n%n그래도 계속하시겠습니까?
DirNameTooLong=폴더 이름 또는 경로가 너무 깁니다.
InvalidDirName=폴더 이름이 올바르지 않습니다.
BadDirName32=폴더 이름에는 다음 문자를 사용할 수 없습니다 : %n%n%1
DirExistsTitle=폴더가 이미 존재합니다
DirExists=폴더:%n%n%1%n%n이(가) 이미 존재합니다. 그래도 해당 폴더에 설치하시겠습니까?
DirDoesntExistTitle=폴더가 존재하지 않습니다
DirDoesntExist=폴더:%n%n%1%n%n이(가) 존재하지 않습니다. 폴더를 생성하시겠습니까?

; *** "Select Components" wizard page
WizardSelectComponents=구성 요소 선택
SelectComponentsDesc=어떤 구성 요소를 설치하시겠습니까?
SelectComponentsLabel2=설치할 구성 요소를 선택하십시오. 설치하지 않으려는 구성 요소를 지웁니다. 계속할 준비가 되면 다음을 클릭합니다.
FullInstallation=전체 설치
; if possible don't translate 'Compact' as 'Minimal' (I mean 'Minimal' in your language)
CompactInstallation=기본 설정 설치
CustomInstallation=사용자 설정 설치
NoUninstallWarningTitle=구성 요소 존재
NoUninstallWarning=컴퓨터에 다음 구성 요소가 이미 설치되어 있습니다.%n%n%1%n%n이 구성 요소를 선택 취소해도 제거되지 않습니다.%n%n계속하시겠습니까?
ComponentSize1=%1 KB
ComponentSize2=%1 MB
ComponentsDiskSpaceGBLabel=현재 선택에는 [gb]GB 이상의 디스크 공간이 필요합니다.
ComponentsDiskSpaceMBLabel=현재 선택에는 최소 [mb]MB의 디스크 공간이 필요합니다.

; *** "Select Additional Tasks" wizard page
WizardSelectTasks=추가 작업 선택
SelectTasksDesc=어떤 추가 작업을 수행해야 합니까?
SelectTasksLabel2=[name]을(를) 설치하는 동안 설치 프로그램에서 수행할 추가 작업을 선택하고 다음을 클릭합니다

; *** "Select Start Menu Folder" wizard page
WizardSelectProgramGroup=시작 메뉴 폴더 선택
SelectStartMenuFolderDesc=프로그램의 바로 가기를 어디에 배치하길 원하십니까?
SelectStartMenuFolderLabel3=다음 시작 메뉴 폴더에 프로그램의 바로 가기를 만듭니다.
SelectStartMenuFolderBrowseLabel=계속하려면 다음을 클릭하십시오. 다른 폴더를 선택하려면 찾아보기를 클릭합니다.
MustEnterGroupName=폴더 이름을 입력해야 합니다.
GroupNameTooLong=폴더 이름 또는 경로가 너무 깁니다.
InvalidGroupName=폴더 이름이 올바르지 않습니다.
BadGroupName=폴더 이름은 다음 문자를 포함할 수 없습니다 : %n%n%1
NoProgramGroupCheck2=시작 메뉴 폴더를 만들지 않음(&D)

; *** "Ready to Install" wizard page
WizardReady=설치 준비 완료
ReadyLabel1=이제 컴퓨터에 [name] 설치를 시작할 준비가 되었습니다.
ReadyLabel2a=설치를 계속하려면 설치를 클릭하고 설정을 검토하거나 변경하려면 뒤로를 클릭하십시오.
ReadyLabel2b=설치를 클릭하여 설치를 계속하십시오.
ReadyMemoUserInfo=사용자 정보:
ReadyMemoDir=설치 위치:
ReadyMemoType=설치 유형:
ReadyMemoComponents=선택된 구성 요소:
ReadyMemoGroup=시작 메뉴 폴더:
ReadyMemoTasks=추가 작업:

; *** TDownloadWizardPage wizard page and DownloadTemporaryFile
DownloadingLabel=추가 파일 다운로드 중...
ButtonStopDownload=다운로드 중지(&S)
StopDownload=다운로드를 중지하시겠습니까?
ErrorDownloadAborted=다운로드 중단
ErrorDownloadFailed=다운로드 실패: %1 %2
ErrorDownloadSizeFailed=가져오기 실패: %1 %2
ErrorFileHash1=파일 해시 실패: %1
ErrorFileHash2=잘못된 파일 해시: %1이(가) 필요하지만 %2을(를) 찾았습니다.
ErrorProgress=잘못된 진행: %1 / %2
ErrorFileSize=잘못된 파일 크기: %1이(가) 필요하지만 %2을(를) 찾았습니다.

; *** "Preparing to Install" wizard page
WizardPreparing=설치 준비
PreparingDesc=설치 프로그램이 컴퓨터에 [name]을(를) 설치할 준비를 하고 있습니다.
PreviousInstallNotCompleted=이전 프로그램의 설치/제거가 완료되지 않았습니다. 설치를 완료하려면 컴퓨터를 다시 시작해야 합니다.%n%n컴퓨터를 다시 시작한 후 설치 프로그램을 다시 실행하여 [name] 설치를 완료하십시오.
CannotContinue=설치를 계속할 수 없습니다. 종료하려면 취소를 클릭하십시오.
ApplicationsFound=다음 응용 프로그램은 설치 프로그램에서 업데이트해야 하는 파일을 사용하고 있습니다. 설치 프로그램에서 이러한 응용 프로그램을 자동으로 닫을 수 있도록 하는 것이 좋습니다.
ApplicationsFound2=다음 응용 프로그램은 설치 프로그램에서 업데이트해야 하는 파일을 사용하고 있습니다. 설치 프로그램에서 이러한 응용 프로그램을 자동으로 닫을 수 있도록 하는 것이 좋습니다. 설치가 완료된 후 설치 프로그램은 응용 프로그램을 다시 시작하려고 시도할 것입니다.
CloseApplications=응용 프로그램 자동 닫기(&A)
DontCloseApplications=응용 프로그램을 닫지 않음(&D
ErrorCloseApplications=모든 응용 프로그램을 자동으로 닫을 수 없습니다. 계속하기 전에 설치 프로그램에서 업데이트해야 하는 파일을 사용하는 모든 응용 프로그램을 닫는 것을 권장합니다.
PrepareToInstallNeedsRestart=설치 프로그램은 컴퓨터를 다시 시작해야 합니다. 컴퓨터를 다시 시작한 후 설치 프로그램을 다시 실행하여 [name]의 설치를 완료하십시오.%n%n지금 다시 시작하시겠습니까?

; *** "Installing" wizard page
WizardInstalling=설치 중
InstallingLabel=설치 프로그램이 컴퓨터에 [name]을(를) 설치하는 동안 잠시 기다려 주십시오.

; *** "Setup Completed" wizard page
FinishedHeadingLabel=[name] 설치 마법사 완료
FinishedLabelNoIcons=컴퓨터에 [name] 설치가 완료되었습니다
FinishedLabel=컴퓨터에 [name] 설치가 완료되었습니다. 설치된 아이콘을 선택하여 응용 프로그램을 시작할 수 있습니다.
ClickFinish=종료를 클릭하여 설치를 종료합니다.
FinishedRestartLabel=[name] 설치를 완료하려면 컴퓨터를 다시 시작해야 합니다. 지금 다시 시작하시겠습니까?
FinishedRestartMessage=[name] 설치를 완료하려면 컴퓨터를 다시 시작해야 합니다.%n%n지금 다시 시작하시겠습니까?
ShowReadmeCheck=예, README 파일을 보고 싶습니다.
YesRadio=예, 지금 컴퓨터를 다시 시작합니다(&A).
NoRadio=아니오, 나중에 컴퓨터를 다시 시작하겠습니다(&N).
; used for example as 'Run MyProg.exe'
RunEntryExec=%1 실행
; used for example as 'View Readme.txt'
RunEntryShellExec=%1 확인

; *** "Setup Needs the Next Disk" stuff
ChangeDiskTitle=설치에 디스크가 필요합니다.
SelectDiskLabel2=디스크 %1을(를) 삽입하고 확인을 클릭하십시오.%n%n이 디스크의 파일이 아래 표시된 폴더가 아닌 다른 폴더에 있으면 올바른 경로를 입력하거나 찾아보기를 클릭하십시오.
PathLabel=&경로:
FileNotInDir2="%1" 파일은 "%2"에 위치할 수 없습니다. 올바른 디스크를 삽입하거나 다른 폴더를 선택하십시오.
SelectDirectoryLabel=디스크의 위치를 ​​지정하십시오.

; *** Installation phase messages
SetupAborted=설치가 완료되지 않았습니다.%n%n문제를 해결하고 설치를 다시 실행하십시오.
AbortRetryIgnoreSelectAction=작업 선택
AbortRetryIgnoreRetry=&다시 시도
AbortRetryIgnoreIgnore=오류를 무시하고 계속(&I)
AbortRetryIgnoreCancel=설치 취소

; *** Installation status messages
StatusClosingApplications=프로그램을 닫는 중...
StatusCreateDirs=디렉토리 생성 중...
StatusExtractFiles=파일을 추출 중...
StatusCreateIcons=바로가기 생성 중...
StatusCreateIniEntries=INI 항목 생성 중...
StatusCreateRegistryEntries=레지스트리 항목 생성 중...
StatusRegisterFiles=파일 등록 중...
StatusSavingUninstall=제거 정보 저장 중...
StatusRunProgram=설치를 완료하는 중...
StatusRestartingApplications=프로그램 다시 시작 중...
StatusRollback=변경사항 취소 중...

; *** Misc. errors
ErrorInternal2=내부 오류: %1
ErrorFunctionFailedNoCode=%1 실패
ErrorFunctionFailed=%1 실패 코드 %2
ErrorFunctionFailedWithMessage=%1 실패했습니다; 코드 %2.%n%3
ErrorExecutingProgram=파일을 실행할 수 없음:%n%1

; *** Registry errors
ErrorRegOpenKey=레지스트리 키를 여는 동안 오류 발생:%n%1\%2
ErrorRegCreateKey=레지스트리 키 생성 오류:%n%1\%2
ErrorRegWriteKey=레지스트리 키에 쓰는 동안 오류 발생:%n%1\%2

; *** INI errors
ErrorIniEntry=파일 "%1"에서 INI 항목을 만드는 동안 오류가 발생했습니다.

; *** File copying errors
FileAbortRetryIgnoreSkipNotRecommended=이 파일 건너뛰기(&S)(권장하지 않음)
FileAbortRetryIgnoreIgnoreNotRecommended=오류를 무시하고 계속합니다(&A)(권장하지 않음)
SourceIsCorrupted=소스 파일이 손상되었습니다
SourceDoesntExist=소스 파일 "%1"이(가) 존재하지 않습니다
ExistingFileReadOnly2=기존 파일은 읽기 전용으로 표시되어 있으므로 바꿀 수 없습니다.
ExistingFileReadOnlyRetry=읽기 전용 속성을 제거하고 다시 시도하십시오(&R)
ExistingFileReadOnlyKeepExisting=기존 파일 유지(&K)
ErrorReadingExistingDest=기존 파일을 읽는 동안 오류가 발생했습니다:
FileExistsSelectAction=작업 선택
FileExists2=파일이 이미 있습니다.
FileExistsOverwriteExisting=기존 파일 덮어쓰기(&O)
FileExistsKeepExisting=기존 파일 유지(&K)
FileExistsOverwriteOrKeepAll=다음 충돌에 대해 수행(&D)
ExistingFileNewerSelectAction=작업 선택
ExistingFileNewer2=기존 파일이 설치 프로그램이 설치하려는 파일보다 최신입니다.
ExistingFileNewerOverwriteExisting=기존 파일 덮어쓰기(&O)
ExistingFileNewerKeepExisting=기존 파일 유지(&K)(권장)
ExistingFileNewerOverwriteOrKeepAll=다음 충돌에 대해 수행(&D)
ErrorChangingAttr=기존 파일의 속성을 변경하는 동안 오류가 발생했습니다:
ErrorCreatingTemp=대상 디렉터리에 파일을 만드는 동안 오류가 발생했습니다:
ErrorReadingSource=소스 파일을 읽는 동안 오류가 발생했습니다:
ErrorCopying=파일을 복사하는 동안 오류가 발생했습니다:
ErrorReplacingExistingFile=기존 파일을 교체하는 동안 오류가 발생했습니다:
ErrorRestartReplace=다시 시작 대체 실패:
ErrorRenamingTemp=대상 디렉토리에 있는 파일의 이름을 바꾸는 동안 오류가 발생했습니다:
ErrorRegisterServer=DLL/OCX를 등록할 수 없음: %1
ErrorRegSvr32Failed=RegSvr32가 종료 코드 %1과(와) 함께 실패했습니다.
ErrorRegisterTypeLib=형식 라이브러리를 등록할 수 없음: %1

; *** Uninstall display name markings
; used for example as 'My Program (32-bit)'
UninstallDisplayNameMark=%1 (%2)
; used for example as 'My Program (32-bit, All users)'
UninstallDisplayNameMarks=%1 (%2, %3)
UninstallDisplayNameMark32Bit=32-bit
UninstallDisplayNameMark64Bit=64-bit
UninstallDisplayNameMarkAllUsers=모든 사용자
UninstallDisplayNameMarkCurrentUser=현재 사용자

; *** Post-installation errors
ErrorOpeningReadme=README 파일을 열려고 하는 동안 오류가 발생했습니다.
ErrorRestartingComputer=컴퓨터를 다시 시작할 수 없습니다. 수동으로 수행하십시오.

; *** Uninstaller messages
UninstallNotFound=파일 "%1"이(가) 존재하지 않습니다. 제거할 수 없습니다.
UninstallOpenError=파일 "%1"을(를) 열 수 없습니다. 제거할 수 없습니다
UninstallUnsupportedVer=제거 로그 파일 "%1"은(는) 이 버전의 제거 프로그램에서 인식할 수 없는 형식입니다. 제거할 수 없습니다
UninstallUnknownEntry=제거 로그에 알 수 없는 항목(%1)이 있습니다
ConfirmUninstall=%1 및 모든 구성 요소를 완전히 제거하시겠습니까?
UninstallOnlyOnWin64=이 설치는 64비트 Windows에서만 제거할 수 있습니다.
OnlyAdminCanUninstall=이 설치는 관리자 권한이 있는 사용자만 제거할 수 있습니다.
UninstallStatusLabel=%1이(가) 컴퓨터에서 제거되는 동안 잠시 기다려 주십시오.
UninstalledAll=%1이(가) 컴퓨터에서 성공적으로 제거되었습니다.
UninstalledMost=%1 제거가 완료되었습니다.%n%n하지만 일부 요소는 제거할 수 없었습니다. 수동으로 제거하시기 바랍니다.
UninstalledAndNeedsRestart=%1 제거를 완료하려면 컴퓨터를 다시 시작해야 합니다.%n%n지금 다시 시작하시겠습니까?
UninstallDataCorrupted="%1" 파일이 손상되었습니다. 제거할 수 없습니다

; *** Uninstallation phase messages
ConfirmDeleteSharedFileTitle=공유 파일을 제거하시겠습니까?
ConfirmDeleteSharedFile2=시스템에서 다음 공유 파일을 더 이상 사용하지 않는 것으로 표시됩니다. 이 공유 파일을 제거하시겠습니까?%n%n만약 다른 프로그램이 이 파일을 계속 사용하고 있는데 제거된다면 해당 프로그램이 제대로 작동하지 않을 수 있습니다. 확실하지 않은 경우 아니오를 선택하십시오. 파일을 시스템에 그대로 두어도 아무런 문제가 발생하지 않습니다.
SharedFileNameLabel=파일 이름:
SharedFileLocationLabel=위치:
WizardUninstalling=제거 상태
StatusUninstalling=%1 제거 중...

; *** Shutdown block reasons
ShutdownBlockReasonInstallingApp=%1을(를) 설치 중입니다.
ShutdownBlockReasonUninstallingApp=%1을(를) 제거하는 중입니다.

; The custom messages below aren't used by Setup itself, but if you make
; use of them in your scripts, you'll want to translate them.

[CustomMessages]

NameAndVersion=%1 버전 %2
AdditionalIcons=추가 아이콘:
CreateDesktopIcon=바탕 화면 아이콘 만들기(&D)
CreateQuickLaunchIcon=바로가기 아이콘 생성
ProgramOnTheWeb=웹에서 %1
UninstallProgram=%1 삭제
LaunchProgram=%1 실행
AssocFileExtension=%1을(를) %2 파일 확장자와 연결(&A)
AssocingFileExtension=%1을(를) %2 파일 확장자와 연결하는 중...
AutoStartProgramGroupDescription=시작:
AutoStartProgram=%1 자동 시작
AddonHostProgramNotFound=선택한 폴더에서 %1을(를) 찾을 수 없습니다.%n%n그래도 계속하시겠습니까?