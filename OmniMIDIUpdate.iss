#define Author "Keppy's Software"
#define Configurator "OmniMIDIConfigurator"
#define Copyright "Copyright (c) 2011 Keppy's Software. All rights reserved."
#define DebugWindow "OmniMIDIDebugWindow"
#define Description "OmniMIDI, User-Mode Windows MIDI Driver"
#define DevEnum "OmniMIDIDevEnum"
#define DriverRegister "OmniMIDIDriverRegister"
#define Email 'kaleidonkep99@outlook.com'
#define Icon "Branding\OMSetupICO.ico"
#define InstallDir "OmniMIDI"
#define Link 'https://github.com/KaleidonKep99/Keppy-s-Synthesizer'
#define MixerWindow "OmniMIDIMixerWindow"
#define OutputName "OmniMIDIUpdate"
#define ProductName "OmniMIDI"
#define Version '11.1.0.1'
                         
#define MIDIMapper 'OmniMapper'
#define lib32 'external_packages\lib'
#define lib64 'external_packages\lib64'
#define libARM64 'external_packages\libARM64'
#define outputdir32 'output'
#define outputdir64 'output\64'
#define outputdirARM64 'output\ARM64'

[Setup]
AllowCancelDuringInstall=False
AlwaysShowDirOnReadyPage=True
AlwaysShowGroupOnReadyPage=True
AppComments={#Description}     
AppContact={#Email}
AppCopyright={#Copyright}
AppId={{950DEC78-2D12-4917-BE69-CB04FE84B21F}
AppName={#ProductName}
AppPublisher={#Author}
AppPublisherURL={#Link}
AppSupportURL={#Link}/issues
AppUpdatesURL={#Link}/releases
AppVersion={#Version}
ArchitecturesAllowed=x86 x64 arm64
ArchitecturesInstallIn64BitMode=x64 arm64
CloseApplications=yes
Compression=lzma2/ultra64
CompressionThreads=2
CreateAppDir=False
DefaultGroupName={#ProductName}
DisableDirPage=auto
FlatComponentsList=False
InternalCompressLevel=ultra64
LanguageDetectionMethod=none
LicenseFile=license.txt
MinVersion=0,6.0.6001sp2
OutputBaseFilename={#OutputName}
PrivilegesRequired=lowest
SetupIconFile={#Icon}
ShowLanguageDialog=no
SolidCompression=yes
TimeStampsInUTC=True
UninstallDisplayIcon={syswow64}\{#InstallDir}\OmniMIDI.exe
UninstallDisplayName={#ProductName} (Uninstall only)
UninstallDisplaySize=8241947
Uninstallable=no
UpdateUninstallLogAppName=no
UsePreviousAppDir=yes
VersionInfoCompany={#Author}
VersionInfoCopyright={#Copyright}
VersionInfoDescription={#Description}
VersionInfoProductName={#ProductName}
VersionInfoTextVersion={#Description}
VersionInfoVersion={#Version}
WizardStyle=modern
WizardImageFile=scripts\image.bmp
WizardSmallImageFile=scripts\smallimage.bmp
DisableWelcomePage=False
DisableReadyPage=True
DisableReadyMemo=True

[Files]
; 64-bit OS
Source: "{#outputdir64}\{#DevEnum}.exe"; DestDir: "{sys}\{#InstallDir}"; DestName: "{#DevEnum}.exe"; Flags: replacesameversion ignoreversion restartreplace; Check: WindowsAMD64
Source: "{#outputdir64}\{#InstallDir}.dll"; DestDir: "{sys}\{#InstallDir}"; DestName: "{#InstallDir}.dll"; Flags: replacesameversion ignoreversion restartreplace; Check: WindowsAMD64
Source: "{#outputdir64}\{#MIDIMapper}.dll"; DestDir: "{sys}\{#InstallDir}"; DestName: "{#MIDIMapper}.dll"; Flags: replacesameversion ignoreversion restartreplace; Check: WindowsAMD64

; ARM64 OS
; Source: "{#outputdirARM64}\{#DevEnum}.exe"; DestDir: "{win}\Sysnative\{#InstallDir}"; DestName: "{#DevEnum}.exe"; Flags: replacesameversion ignoreversion restartreplace; Check: WindowsARM64
Source: "{#outputdirARM64}\{#InstallDir}.dll"; DestDir: "{win}\Sysnative\{#InstallDir}"; DestName: "{#InstallDir}.dll"; Flags: replacesameversion ignoreversion restartreplace; Check: WindowsARM64
Source: "{#outputdirARM64}\{#MIDIMapper}.dll"; DestDir: "{win}\Sysnative\{#InstallDir}"; DestName: "{#MIDIMapper}.dll"; Flags: replacesameversion ignoreversion restartreplace; Check: WindowsARM64

; 32-bit files for AMD64 and ARM64
Source: "{#outputdir32}\{#Configurator}.exe"; DestDir: "{syswow64}\{#InstallDir}"; DestName: "{#Configurator}.exe"; Flags: replacesameversion ignoreversion; Check: Windows64
Source: "{#outputdir32}\{#DebugWindow}.exe"; DestDir: "{syswow64}\{#InstallDir}"; DestName: "{#DebugWindow}.exe"; Flags: replacesameversion ignoreversion; Check: Windows64
Source: "{#outputdir32}\{#DevEnum}.exe"; DestDir: "{syswow64}\{#InstallDir}"; DestName: "{#DevEnum}.exe"; Flags: replacesameversion ignoreversion; Check: Windows64
Source: "{#outputdir32}\{#MixerWindow}.exe"; DestDir: "{syswow64}\{#InstallDir}"; DestName: "{#MixerWindow}.exe"; Flags: replacesameversion ignoreversion; Check: Windows64
Source: "{#outputdir32}\{#InstallDir}.dll"; DestDir: "{syswow64}\{#InstallDir}"; DestName: "{#InstallDir}.dll"; Flags: replacesameversion ignoreversion restartreplace; Check: Windows64
Source: "{#outputdir32}\{#MIDIMapper}.dll"; DestDir: "{syswow64}\{#InstallDir}"; DestName: "{#MIDIMapper}.dll"; Flags: replacesameversion ignoreversion restartreplace; Check: Windows64
Source: "{#outputdir32}\{#DriverRegister}.exe"; DestDir: "{syswow64}\{#InstallDir}"; DestName: "{#DriverRegister}.exe"; Flags: replacesameversion ignoreversion; Check: Windows64
Source: "{#outputdir32}\sfzguide.txt"; DestDir: "{syswow64}\{#InstallDir}"; DestName: "sfzguide.txt"; Flags: replacesameversion ignoreversion; Check: Windows64

; 32-bit files for IA32 OS
Source: "{#outputdir32}\{#Configurator}.exe"; DestDir: "{sys}\{#InstallDir}"; DestName: "{#Configurator}.exe"; Flags: replacesameversion ignoreversion; Check: not WindowsAMD64
Source: "{#outputdir32}\{#DebugWindow}.exe"; DestDir: "{sys}\{#InstallDir}"; DestName: "{#DebugWindow}.exe"; Flags: replacesameversion ignoreversion; Check: not WindowsAMD64
Source: "{#outputdir32}\{#DevEnum}.exe"; DestDir: "{sys}\{#InstallDir}"; DestName: "{#DevEnum}.exe"; Flags: replacesameversion ignoreversion; Check: not WindowsAMD64
Source: "{#outputdir32}\{#MixerWindow}.exe"; DestDir: "{sys}\{#InstallDir}"; DestName: "{#MixerWindow}.exe"; Flags: replacesameversion ignoreversion; Check: not WindowsAMD64
Source: "{#outputdir32}\{#InstallDir}.dll"; DestDir: "{sys}\{#InstallDir}"; DestName: "{#InstallDir}.dll"; Flags: replacesameversion ignoreversion restartreplace; Check: not WindowsAMD64
Source: "{#outputdir32}\{#MIDIMapper}.dll"; DestDir: "{sys}\{#InstallDir}"; DestName: "{#MIDIMapper}.dll"; Flags: replacesameversion ignoreversion restartreplace; Check: not WindowsAMD64
Source: "{#outputdir32}\{#DriverRegister}.exe"; DestDir: "{sys}\{#InstallDir}"; DestName: "{#DriverRegister}.exe"; Flags: replacesameversion ignoreversion; Check: not WindowsAMD64
Source: "{#outputdir32}\sfzguide.txt"; DestDir: "{sys}\{#InstallDir}"; DestName: "sfzguide.txt"; Flags: replacesameversion ignoreversion; Check: not WindowsAMD64

; 64-bit libs
Source: "{#lib64}\bass.dll"; DestDir: "{sys}\{#InstallDir}"; DestName: "bass.dll"; Flags: replacesameversion ignoreversion; Check: WindowsAMD64
Source: "{#lib64}\bassasio.dll"; DestDir: "{sys}\{#InstallDir}"; DestName: "bassasio.dll"; Flags: replacesameversion ignoreversion; Check: WindowsAMD64
Source: "{#lib64}\bassflac.dll"; DestDir: "{sys}\{#InstallDir}"; DestName: "bassflac.dll"; Flags: replacesameversion ignoreversion; Check: WindowsAMD64
Source: "{#lib64}\bassenc.dll"; DestDir: "{sys}\{#InstallDir}"; DestName: "bassenc.dll"; Flags: replacesameversion ignoreversion; Check: WindowsAMD64
Source: "{#lib64}\bassmidi.dll"; DestDir: "{sys}\{#InstallDir}"; DestName: "bassmidi.dll"; Flags: replacesameversion ignoreversion; Check: WindowsAMD64
Source: "{#lib64}\bass_vst.dll"; DestDir: "{sys}\{#InstallDir}"; DestName: "bass_vst.dll"; Flags: replacesameversion ignoreversion; Check: WindowsAMD64

; ARM64 libs
; Alternative MIDI Mapper isn't available for ARM64
Source: "{#libarm64}\bass.dll"; DestDir: "{sys}\{#InstallDir}"; DestName: "bass.dll"; Flags: replacesameversion ignoreversion; Check: WindowsARM64
; Source: "{#libarm64}\bassasio.dll"; DestDir: "{sys}\{#InstallDir}"; DestName: "bassasio.dll"; Flags: replacesameversion ignoreversion; Check: WindowsARM64
; Source: "{#libarm64}\bassflac.dll"; DestDir: "{sys}\{#InstallDir}"; DestName: "bassflac.dll"; Flags: replacesameversion ignoreversion; Check: WindowsARM64
; Source: "{#libarm64}\bassenc.dll"; DestDir: "{sys}\{#InstallDir}"; DestName: "bassenc.dll"; Flags: replacesameversion ignoreversion; Check: WindowsARM64
Source: "{#libarm64}\bassmidi.dll"; DestDir: "{sys}\{#InstallDir}"; DestName: "bassmidi.dll"; Flags: replacesameversion ignoreversion; Check: WindowsARM64
; LoudMax isn't available for ARM64

; 32-bit libs for AMD64 and ARM64
Source: "{#lib32}\bass.dll"; DestDir: "{syswow64}\{#InstallDir}"; DestName: "bass.dll"; Flags: replacesameversion ignoreversion; Check: Windows64
Source: "{#lib32}\bassasio.dll"; DestDir: "{syswow64}\{#InstallDir}"; DestName: "bassasio.dll"; Flags: replacesameversion ignoreversion; Check: Windows64
Source: "{#lib32}\bassflac.dll"; DestDir: "{syswow64}\{#InstallDir}"; DestName: "bassflac.dll"; Flags: replacesameversion ignoreversion; Check: Windows64
Source: "{#lib32}\bassenc.dll"; DestDir: "{syswow64}\{#InstallDir}"; DestName: "bassenc.dll"; Flags: replacesameversion ignoreversion; Check: Windows64
Source: "{#lib32}\bassmidi.dll"; DestDir: "{syswow64}\{#InstallDir}"; DestName: "bassmidi.dll"; Flags: replacesameversion ignoreversion; Check: Windows64
Source: "{#lib32}\bass_vst.dll"; DestDir: "{syswow64}\{#InstallDir}"; DestName: "bass_vst.dll"; Flags: replacesameversion ignoreversion; Check: Windows64
Source: "output\{#InstallDir}.dbl"; DestDir: "{syswow64}\{#InstallDir}"; Flags: replacesameversion ignoreversion; Check: Windows64

; 32-bit libs for IA32
Source: "{#lib32}\bass.dll"; DestDir: "{sys}\{#InstallDir}"; DestName: "bass.dll"; Flags: replacesameversion ignoreversion; Check: not WindowsAMD64
Source: "{#lib32}\bassasio.dll"; DestDir: "{sys}\{#InstallDir}"; DestName: "bassasio.dll"; Flags: replacesameversion ignoreversion; Check: not WindowsAMD64
Source: "{#lib32}\bassflac.dll"; DestDir: "{sys}\{#InstallDir}"; DestName: "bassflac.dll"; Flags: replacesameversion ignoreversion; Check: not WindowsAMD64
Source: "{#lib32}\bassenc.dll"; DestDir: "{sys}\{#InstallDir}"; DestName: "bassenc.dll"; Flags: replacesameversion ignoreversion; Check: not WindowsAMD64
Source: "{#lib32}\bassmidi.dll"; DestDir: "{sys}\{#InstallDir}"; DestName: "bassmidi.dll"; Flags: replacesameversion ignoreversion; Check: not WindowsAMD64
Source: "{#lib32}\bass_vst.dll"; DestDir: "{sys}\{#InstallDir}"; DestName: "bass_vst.dll"; Flags: replacesameversion ignoreversion; Check: not WindowsAMD64
Source: "output\{#InstallDir}.dbl"; DestDir: "{sys}\{#InstallDir}"; Flags: replacesameversion ignoreversion; Check: not WindowsAMD64

; Generic for all the OSes
Source: "LICENSE.TXT"; DestDir: "{%USERPROFILE}\{#ProductName}"; Flags: replacesameversion ignoreversion

[Icons]
; 64-bit OS
Name: "{group}\Configure {#ProductName}"; Filename: "{syswow64}\{#InstallDir}\{#Configurator}.exe"; WorkingDir: "{app}"; IconFilename: "{syswow64}\{#InstallDir}\{#Configurator}.exe"; Check: Windows64
Name: "{group}\Open the {#ProductName}'s mixer"; Filename: "{syswow64}\{#InstallDir}\{#MixerWindow}.exe"; WorkingDir: "{app}"; IconFilename: "{syswow64}\{#InstallDir}\{#MixerWindow}.exe"; Check: Windows64
Name: "{group}\Open the {#ProductName}'s debug window"; Filename: "{syswow64}\{#InstallDir}\{#DebugWindow}.exe"; WorkingDir: "{app}"; IconFilename: "{syswow64}\{#InstallDir}\{#DebugWindow}.exe"; Check: Windows64
Name: "{group}\Change advanced settings"; Filename: "{syswow64}\{#InstallDir}\{#Configurator}.exe"; WorkingDir: "{app}"; IconFilename: "{syswow64}\{#InstallDir}\{#Configurator}.exe"; Parameters: "/AST"; Check: Windows64

; 32-bit OS
Name: "{group}\Configure {#ProductName}"; Filename: "{sys}\{#InstallDir}\{#Configurator}.exe"; WorkingDir: "{app}"; IconFilename: "{sys}\{#InstallDir}\{#Configurator}.exe"; Check: WindowsIA32
Name: "{group}\Open the {#ProductName}'s mixer"; Filename: "{sys}\{#InstallDir}\{#MixerWindow}.exe"; WorkingDir: "{app}"; IconFilename: "{sys}\{#InstallDir}\{#MixerWindow}.exe"; Check: WindowsIA32
Name: "{group}\Open the {#ProductName}'s debug window"; Filename: "{sys}\{#InstallDir}\{#DebugWindow}.exe"; WorkingDir: "{app}"; IconFilename: "{sys}\{#InstallDir}\{#DebugWindow}.exe"; Check: WindowsIA32
Name: "{group}\Change advanced settings"; Filename: "{sys}\{#InstallDir}\{#Configurator}.exe"; WorkingDir: "{app}"; IconFilename: "{sys}\{#InstallDir}\{#Configurator}.exe"; Parameters: "/AST"; Check: WindowsIA32

[Languages]
Name: en; MessagesFile: "compiler:Default.isl"
Name: de; MessagesFile: "compiler:Default.isl"

[Registry]
; Normal settings
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "AlternativeCPU"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "AudioBitDepth"; ValueData: "1"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "AudioFrequency"; ValueData: "48000"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "AudioOutput"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "BufferLength"; ValueData: "30"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "CapFramerate"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "CurrentEngine"; ValueData: "3"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "DebugMode"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "DefaultSFList"; ValueData: "1"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "EnableSFX"; ValueData: "1"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "EvBufferMultRatio"; ValueData: "1"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "EvBufferSize"; ValueData: "4096"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "Extra8Lists"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "FastHotkeys"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "HyperPlayback"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "IgnoreNotesBetweenVel"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "IgnoreSysEx"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "IgnoreSysReset"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "KSDAPIEnabled"; ValueData: "1"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "MaxRenderingTime"; ValueData: "75"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "MaxVoices"; ValueData: "500"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "MonoRendering"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "NoteOff1"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "NotesCatcherWithAudio"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "OutputVolume"; ValueData: "10000"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "PID"; ValueData: "10"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "PreloadSoundFonts"; ValueData: "1"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "SincInter"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "SleepStates"; ValueData: "1"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "SynthType"; ValueData: "4"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "SynthType"; ValueData: "4"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "VID"; ValueData: "65535"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: dword; ValueName: "VolumeMonitor"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: string; ValueName: "ASIOOutput"; ValueData: "FL Studio ASIO"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Configuration"; ValueType: string; ValueName: "SynthName"; ValueData: "OmniMIDI"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Settings"; Flags: uninsdeletekey deletekey
       
;Mapper
Root: "HKCU"; Subkey: "Software\{#ProductName}\Mapper"; ValueType: string; ValueName: "TrgtSynth"; ValueData: "Microsoft GS Wavetable Synth"; Flags: createvalueifdoesntexist uninsdeletevalue

;Override instruments
Root: "HKCU"; Subkey: "Software\{#ProductName}\ChanOverride"; ValueType: dword; ValueName: "overrideinstruments"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey

;Channels volume
Root: "HKCU"; Subkey: "Software\{#ProductName}\Channels"; ValueType: dword; ValueName: "ch1"; ValueData: "100"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Channels"; ValueType: dword; ValueName: "ch2"; ValueData: "100"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Channels"; ValueType: dword; ValueName: "ch3"; ValueData: "100"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Channels"; ValueType: dword; ValueName: "ch4"; ValueData: "100"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Channels"; ValueType: dword; ValueName: "ch5"; ValueData: "100"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Channels"; ValueType: dword; ValueName: "ch6"; ValueData: "100"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Channels"; ValueType: dword; ValueName: "ch7"; ValueData: "100"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Channels"; ValueType: dword; ValueName: "ch8"; ValueData: "100"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Channels"; ValueType: dword; ValueName: "ch9"; ValueData: "100"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Channels"; ValueType: dword; ValueName: "ch10"; ValueData: "100"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Channels"; ValueType: dword; ValueName: "ch11"; ValueData: "100"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Channels"; ValueType: dword; ValueName: "ch12"; ValueData: "100"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Channels"; ValueType: dword; ValueName: "ch13"; ValueData: "100"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Channels"; ValueType: dword; ValueName: "ch14"; ValueData: "100"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Channels"; ValueType: dword; ValueName: "ch15"; ValueData: "100"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Channels"; ValueType: dword; ValueName: "ch16"; ValueData: "100"; Flags: createvalueifdoesntexist uninsdeletekey

;Watchdog
Root: "HKCU"; Subkey: "Software\{#ProductName}\Watchdog"; ValueType: string; ValueName: "bit"; Flags: dontcreatekey deletevalue uninsdeletevalue
Root: "HKCU"; Subkey: "Software\{#ProductName}\Watchdog"; ValueType: string; ValueName: "currentapp"; Flags: dontcreatekey deletevalue uninsdeletevalue
Root: "HKCU"; Subkey: "Software\{#ProductName}\Watchdog"; ValueType: dword; ValueName: "closewatchdog"; ValueData: "1"; Flags: dontcreatekey deletevalue uninsdeletevalue
Root: "HKCU"; Subkey: "Software\{#ProductName}\Watchdog"; ValueType: dword; ValueName: "rel1"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Watchdog"; ValueType: dword; ValueName: "rel2"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Watchdog"; ValueType: dword; ValueName: "rel3"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Watchdog"; ValueType: dword; ValueName: "rel4"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Watchdog"; ValueType: dword; ValueName: "rel5"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Watchdog"; ValueType: dword; ValueName: "rel6"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Watchdog"; ValueType: dword; ValueName: "rel7"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Watchdog"; ValueType: dword; ValueName: "rel8"; ValueData: "0"; Flags: createvalueifdoesntexist uninsdeletekey
Root: "HKCU"; Subkey: "Software\{#ProductName}\Watchdog"; ValueType: dword; ValueName: "runwd"; ValueData: "0"; Flags: dontcreatekey deletevalue uninsdeletevalue
Root: "HKCU"; Subkey: "Software\{#ProductName}\Watchdog"; ValueType: dword; ValueName: "watchdog"; ValueData: "1"; Flags: dontcreatekey deletevalue uninsdeletevalue
  
[InstallDelete]
Type: filesandordirs; Name: "{syswow64}\{#InstallDir}\amidimap.cpl"; Check: Is64BitInstallMode
Type: filesandordirs; Name: "{sys}\{#InstallDir}\amidimap.cpl"
Type: filesandordirs; Name: "{syswow64}\{#InstallDir}\"; Check: Is64BitInstallMode
Type: filesandordirs; Name: "{sys}\{#InstallDir}\"
Type: filesandordirs; Name: "{syswow64}\keppydrv\"; Check: Is64BitInstallMode
Type: filesandordirs; Name: "{sys}\keppydrv\"
Type: filesandordirs; Name: "{syswow64}\keppysynth\"; Check: Is64BitInstallMode
Type: filesandordirs; Name: "{sys}\keppysynth\"
Type: filesandordirs; Name: "{group}\"
Type: files; Name: "{syswow64}\{#InstallDir}\bass_fx.dll"; Check: Is64BitInstallMode
Type: files; Name: "{sys}\{#InstallDir}\bass_fx.dll"
Type: files; Name: "{tmp}\LoudMax.dll"
Type: files; Name: "{tmp}\LoudMax64.dll"

[UninstallDelete]
Type: filesandordirs; Name: "{syswow64}\{#InstallDir}\amidimap.cpl"; Check: Is64BitInstallMode
Type: filesandordirs; Name: "{sys}\{#InstallDir}\amidimap.cpl"
Type: filesandordirs; Name: "{syswow64}\{#InstallDir}\"; Check: Is64BitInstallMode
Type: filesandordirs; Name: "{sys}\{#InstallDir}\"
Type: filesandordirs; Name: "{syswow64}\keppydrv\"; Check: Is64BitInstallMode
Type: filesandordirs; Name: "{sys}\keppydrv\"
Type: filesandordirs; Name: "{syswow64}\keppysynth\"; Check: Is64BitInstallMode
Type: filesandordirs; Name: "{sys}\keppysynth\"
Type: filesandordirs; Name: "{group}\"
Type: files; Name: "{syswow64}\{#InstallDir}\bass_fx.dll"; Check: Is64BitInstallMode
Type: files; Name: "{sys}\{#InstallDir}\bass_fx.dll"
Type: files; Name: "{tmp}\LoudMax.dll"
Type: files; Name: "{tmp}\LoudMax64.dll"

[Run]
Filename: "{syswow64}\{#InstallDir}\{#Configurator}.exe"; Parameters: "/showchangelog"; Flags: runascurrentuser postinstall skipifnotsilent waituntilidle; Check: Windows64
Filename: "{sys}\{#InstallDir}\{#Configurator}.exe"; Parameters: "/showchangelog"; Flags: runascurrentuser postinstall skipifnotsilent waituntilidle; Check: WindowsIA32
Filename: "{syswow64}\{#InstallDir}\{#Configurator}.exe"; Flags: runascurrentuser postinstall unchecked waituntilidle; Description: "Run the configurator, to set up soundfonts"; Check: Windows64
Filename: "{sys}\{#InstallDir}\{#Configurator}.exe"; Flags: runascurrentuser postinstall unchecked waituntilidle; Description: "Run the configurator, to set up soundfonts"; Check: WindowsIA32

[Messages]
WindowsVersionNotSupported={#ProductName} support for Windows XP ended on October 29th, 2016.%n%nIf you want to get further updates, please update to Windows Vista or newer.
ExitSetupMessage={#ProductName} hasn't been updated yet.%n%nAre you sure you want to quit?
SetupWindowTitle={#ProductName} - User-mode MIDI driver for Windows ({#Version})
EntryAbortRetryIgnore=Click Retry to try again, Ignore to proceed anyway, or Abort to cancel installation.%n%nIf after retrying, the Setup is still unable to replace the file, please use the full installer.
FileAbortRetryIgnore2=Click Retry to try again, Ignore to proceed anyway (not recommended), or Abort to cancel installation.%n%nIf after retrying, the Setup is still unable to replace the file, please use the full installer.
FileAbortRetryIgnore=Click Retry to try again, Ignore to skip this file (not recommended), or Abort to cancel installation.%n%nIf after retrying, the Setup is still unable to replace the file, please use the full installer.
WelcomeLabel1=Welcome to the [name] Update Tool
WelcomeLabel2=This will install the latest update for [name] on your computer.%n%nIt is recommended that you close all other applications before continuing.
SetupAppTitle={#ProductName} Update Tool

[Code]
function Windows64(): Boolean;
begin
  Result := (IsARM64 or IsX64);
end;

function WindowsARM64(): Boolean;
begin
  Result := (IsARM64 and (not IsX64));
end;

function WindowsAMD64(): Boolean;
begin
  Result := ((not IsARM64) and IsX64);
end;

function WindowsIA32(): Boolean;
begin
  Result := ((not IsARM64) and (not IsX64) and IsX86);
end;