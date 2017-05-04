/*
Keppy's Synthesizer stream init
*/


unsigned WINAPI notescatcher(LPVOID lpV) {
	try {
		PrintToConsole(FOREGROUND_RED, 1, "Initializing notes catcher thread...");
		while (stop_thread == 0) {
			bmsyn_play_some_data();
			if (oldbuffermode == 1)
				break;
		}
		PrintToConsole(FOREGROUND_RED, 1, "Closing notes catcher thread...");
		stop_thread = 0;
		_endthreadex(0);
		return 0;
	}
	catch (...) {
		crashmessage(L"NotesCatcher");
	}
}

unsigned WINAPI settingsload(LPVOID lpV) {
	try {
		PrintToConsole(FOREGROUND_RED, 1, "Initializing settings thread...");
		while (stop_thread == 0) {
			realtime_load_settings();
			Panic();
			keybindings();
			WatchdogCheck();
			mixervoid();
			RevbNChor();
			Sleep(100);
		}
		PrintToConsole(FOREGROUND_RED, 1, "Closing settings thread...");
		stop_thread = 0;
		_endthreadex(0);
		return 0;
	}
	catch (...) {
		crashmessage(L"NotesCatcher");
	}
}

void separatethreadfordata() {
	if (hThread4 == NULL) {
		PrintToConsole(FOREGROUND_RED, 1, "Creating thread for the note catcher...");
		hThread4 = (HANDLE)_beginthreadex(NULL, 0, notescatcher, 0, 0, &thrdaddr4);
		SetPriorityClass(hThread4, callprioval[driverprio]);
		SetThreadPriority(hThread4, prioval[driverprio]);
	}
}

unsigned WINAPI audioengine(LPVOID lpV) {
	PrintToConsole(FOREGROUND_RED, 1, "Initializing audio rendering thread...");
	while (stop_thread == 0) {
		try {
			if (reset_synth != 0) {
				reset_synth = 0;
				BASS_MIDI_StreamEvent(KSStream, 0, MIDI_EVENT_SYSTEM, MIDI_SYSTEM_DEFAULT);
				CheckUp(ERRORCODE, L"AudioEngine");
			}

			if (oldbuffermode == 1) {
				hThread4 = NULL;
				bmsyn_play_some_data();
			}
			else separatethreadfordata();

			if (xaudiodisabled == 0) {
				AudioRender();
			}
			else if (xaudiodisabled == 1) {
				BASS_ChannelUpdate(KSStream, 0);
				if (rco == 1) Sleep(1);
				CheckUp(ERRORCODE, L"ChannelUpdate");
			}
			else {
				_endthreadex(0);
				return 0;
			}
		}
		catch (...) {
			crashmessage(L"AudioEngine");
		}
	}
	PrintToConsole(FOREGROUND_RED, 1, "Closing audio rendering thread...");
	stop_thread = 0;
	_endthreadex(0);
	return 0;
}

DWORD CALLBACK ASIOPROC1(BOOL input, DWORD channel, void *buffer, DWORD length, void *user)
{
	DWORD data = BASS_ChannelGetData(KSStream, buffer, length);
	if (data < 0) return 0;
	else return data;
}

DWORD CALLBACK WASAPIPROC1(void *buffer, DWORD length, void *user)
{
	DWORD data = BASS_ChannelGetData(KSStream, buffer, length);
	if (data < 0) return 0;
	else return data;
}

void InitializeStreamForExternalEngine(INT32 mixfreq) {
	PrintToConsole(FOREGROUND_RED, 1, "Working...");
	KSStream = BASS_MIDI_StreamCreate(16, BASS_STREAM_DECODE | (sysresetignore ? BASS_MIDI_NOSYSRESET : 0) | (monorendering ? BASS_SAMPLE_MONO : 0) | AudioRenderingType(floatrendering) | (noteoff1 ? BASS_MIDI_NOTEOFF1 : 0) | (nofx ? BASS_MIDI_NOFX : 0) | (sinc ? BASS_MIDI_SINCINTER : 0), mixfreq);
	CheckUp(ERRORCODE, L"KSStreamCreateDEC");
	if (noaudiodevices != 1) {
		PrintToConsole(FOREGROUND_RED, 1, "External engine stream enabled.");
	}
	else {
		PrintToConsole(FOREGROUND_RED, 1, "Dummy stream enabled.");
	}
}

void InitializeAudioStream() {
	int check;
RETRY:
	if (xaudiodisabled == 1) {
		bassoutputfinal = (defaultoutput - 1);
		if (defaultoutput == 0) check = 1;
		else check = bassoutputfinal;

		BASS_DEVICEINFO dinfo;
		BASS_GetDeviceInfo(check, &dinfo);

		if (dinfo.name == NULL || defaultoutput == 1) {
			bassoutputfinal = 0;
			noaudiodevices = 1;
			PrintToConsole(FOREGROUND_RED, 1, "Can not open device. Switching to \"No sound\"...");
		}
		else {
			PrintToConsole(FOREGROUND_RED, bassoutputfinal, "<-- Default output device");
			PrintToConsole(FOREGROUND_RED, 1, "Opening stream...");
		}
	}
	else {
		if (xaudiodisabled == 0)
		{
			if (sound_driver == NULL) {
				PrintToConsole(FOREGROUND_RED, 1, "Opening XAudio stream...");
				sound_driver = BASSXA_CreateAudioStream();
				if (!BASSXA_InitializeAudioStream(sound_driver, frequency + 100, (monorendering ? BASSXA_MONO : BASSXA_STEREO), BASSXA_FLOAT, newsndbfvalue, frames)) {
					xaudiodisabled = 1;
					PrintToConsole(FOREGROUND_RED, 1, "DirectX 9.0c is not installed! Reverting to DirectSound...");
					CopyToClipboard("https://www.microsoft.com/en-us/download/details.aspx?id=8109 ");
					MessageBox(NULL, L"Can not initialize XAudio, DirectX 9.0c is not installed properly!\n\nPress OK to continue.\nThe driver will fallback to DirectSound.\n\nTo fix this, please install the \"DirectX End-User Runtimes (June 2010)\" from the following website:\nhttps://www.microsoft.com/en-us/download/details.aspx?id=8109\n\nThe website has been copied to the clipboard.", L"Keppy's Synthesizer - Error", MB_ICONERROR | MB_OK | MB_SYSTEMMODAL);
					goto RETRY;
				}
				PrintToConsole(FOREGROUND_RED, 1, "XAudio ready.");
			}
		}
		else return;
	}
}

bool InitializeBASS() {
	bool init = false;
	if (xaudiodisabled == 2 || xaudiodisabled == 3) monorendering = 0; // Mono isn't supported

	if (xaudiodisabled == 1) {
		InitializeAudioStream();
		init = BASS_Init(bassoutputfinal, frequency, BASS_DEVICE_LATENCY, 0, NULL);
		CheckUp(ERRORCODE, L"BASSInit");
		PrintToConsole(FOREGROUND_RED, 1, "BASS initialized.");
		BASS_SetConfig(BASS_CONFIG_UPDATEPERIOD, 0);
		BASS_SetConfig(BASS_CONFIG_UPDATETHREADS, 0);

		PrintToConsole(FOREGROUND_RED, 1, "Working...");
		BASS_GetInfo(&info);
		PrintToConsole(FOREGROUND_RED, 1, "Got info about the output device...");
		if (vmsemu == 1) {
			BASS_SetConfig(BASS_CONFIG_BUFFER, info.minbuf + frames); // default buffer size = 'minbuf' + additional buffer size
		}
		else {
			BASS_SetConfig(BASS_CONFIG_BUFFER, 10 + info.minbuf); // default buffer size
		}
		KSStream = BASS_MIDI_StreamCreate(16, (sysresetignore ? BASS_MIDI_NOSYSRESET : 0) | (monorendering ? BASS_SAMPLE_MONO : 0) | AudioRenderingType(floatrendering) | (noteoff1 ? BASS_MIDI_NOTEOFF1 : 0) | (nofx ? BASS_MIDI_NOFX : 0) | (sinc ? BASS_MIDI_SINCINTER : 0), frequency);
		CheckUp(ERRORCODE, L"KSStreamCreateDS");
		BASS_ChannelPlay(KSStream, false);
		CheckUp(ERRORCODE, L"ChannelPlayDS");
		PrintToConsole(FOREGROUND_RED, 1, "DirectSound stream enabled and running.");
		return init;
	}
	else if (xaudiodisabled == 0) {
		bassoutputfinal = 0;
		init = BASS_Init(0, frequency, 0, 0, NULL);
		CheckUp(ERRORCODE, L"BASSInit");
		InitializeAudioStream();
		InitializeStreamForExternalEngine(frequency);
		CheckUp(ERRORCODE, L"KSInitXA");
	}
	else if (xaudiodisabled == 2) {
		bassoutputfinal = 0;
		init = BASS_Init(0, frequency, 0, 0, NULL);
		CheckUp(ERRORCODE, L"BASSInit");
		InitializeStreamForExternalEngine(frequency);
		if (BASS_ASIO_Init(defaultAoutput, BASS_ASIO_THREAD | BASS_ASIO_JOINORDER)) {
			BASS_ASIO_SetRate(frequency);
			BASS_ASIO_ChannelEnable(FALSE, 0, ASIOPROC1, 0);
			BASS_ASIO_ChannelJoin(FALSE, 1, 0);
			BASS_ASIO_Start(frames, 0);
			CheckUpASIO(ERRORCODE, L"KSInitASIO");
		}
		else {
			CheckUpASIO(ERRORCODE, L"KSInitASIO");
			MessageBox(NULL, L"ASIO is unavailable with the current device.\n\nChange the device through the configurator, then try again.\n\nFalling back to XAudio...\nPress OK to continue.", L"Keppy's Synthesizer - BASS execution error", MB_OK | MB_ICONERROR);
			xaudiodisabled = 0;
			InitializeAudioStream();
		}
	}
	else if (xaudiodisabled == 3) {
		BASS_WASAPI_DEVICEINFO infoW;

		BASS_WASAPI_GetDeviceInfo(defaultWoutput, &infoW);
		PrintToConsole(FOREGROUND_RED, defaultWoutput, "WASAPI driver number");
		PrintToConsole(FOREGROUND_RED, infoW.mixfreq, "WASAPI driver frequency");

		// Init the device first
		init = BASS_Init(0, frequency, 0, 0, NULL);
		CheckUp(ERRORCODE, L"BASSInit");

		InitializeStreamForExternalEngine(infoW.mixfreq);

		if (BASS_WASAPI_Init(defaultWoutput, 0, 0, BASS_WASAPI_BUFFER | (wasapiex ? BASS_WASAPI_EXCLUSIVE : BASS_WASAPI_EVENT), 0, 0, WASAPIPROC1, NULL)) {
			BASS_WASAPI_Start();
			CheckUp(ERRORCODE, L"KSInitWASAPI");
		}
		else {
			MessageBox(NULL, L"WASAPI is unavailable with the current device.\n\nChange the device through the configurator, then try again.\nTo change it, please open the configurator, and go to \"More settings > Advanced audio settings > Change default audio output\", then, after you're done, restart the MIDI application.\n\nFalling back to XAudio...\nPress OK to continue.", L"Keppy's Synthesizer - BASS execution error", MB_OK | MB_ICONERROR);
			xaudiodisabled = 0;
			InitializeAudioStream();
			InitializeStreamForExternalEngine(frequency);
			CheckUp(ERRORCODE, L"KSInitXA");
		}
	}
	if (!KSStream) {
		BASS_ASIO_Free();
		BASS_WASAPI_Free();
		BASS_StreamFree(KSStream);
		CheckUp(ERRORCODE, L"StreamFree");
		KSStream = 0;
		PrintToConsole(FOREGROUND_RED, 1, "Failed to open BASS stream.");
		return false;
	}
	else {
		BASS_ChannelSetAttribute(KSStream, BASS_ATTRIB_MIDI_VOICES, midivoices);
		BASS_ChannelSetAttribute(KSStream, BASS_ATTRIB_MIDI_CPU, maxcpu);
		BASS_ChannelSetAttribute(KSStream, BASS_ATTRIB_MIDI_KILL, fadeoutdisable);
		CheckUp(ERRORCODE, L"Attributes");
	}
	return init;
}

void InitializeBASSVST() {
	USES_CONVERSION;
	TCHAR loudmaxdll[MAX_PATH];
	TCHAR loudmaxdll64[MAX_PATH];
	SHGetFolderPath(NULL, CSIDL_PROFILE, NULL, 0, loudmaxdll);
	SHGetFolderPath(NULL, CSIDL_PROFILE, NULL, 0, loudmaxdll64);
	PathAppend(loudmaxdll, _T("\\Keppy's Synthesizer\\LoudMax.dll"));
	PathAppend(loudmaxdll64, _T("\\Keppy's Synthesizer\\LoudMax64.dll"));
	const char *LMDLL = T2A(loudmaxdll);
	const char *LMDLL64 = T2A(loudmaxdll64);
#if defined(_WIN64)
	if (PathFileExists(loudmaxdll64)) {
		if (isbassvstloaded == 1) {
			BASS_VST_ChannelSetDSP(KSStream, LMDLL64, 0, 1);
		}
	}
#elif defined(_WIN32)
	if (PathFileExists(loudmaxdll)) {
		if (isbassvstloaded == 1) {
			BASS_VST_ChannelSetDSP(KSStream, LMDLL, 0, 1);
		}
	}
#endif

}

void InitializeBASSEnc() {
	PrintToConsole(FOREGROUND_RED, 1, "Opening BASSenc stream...");
	typedef std::basic_string<TCHAR> tstring;
	TCHAR encpath[MAX_PATH];
	TCHAR poop[MAX_PATH];
	TCHAR buffer[MAX_PATH] = { 0 };
	TCHAR * out;
	DWORD bufSize = sizeof(buffer) / sizeof(*buffer);
	if (GetModuleFileName(NULL, buffer, bufSize) == bufSize) {}
	out = PathFindFileName(buffer);
	std::wstring stemp = tstring(out) + L" - Keppy's Synthesizer Output File.wav";
	LPCWSTR result2 = stemp.c_str();
	HKEY hKey = 0;
	DWORD cbValueLength = sizeof(poop);
	DWORD dwType = REG_SZ;
	RegOpenKeyEx(HKEY_CURRENT_USER, L"Software\\Keppy's Synthesizer\\Settings", 0, KEY_ALL_ACCESS, &hKey);
	if (RegQueryValueEx(hKey, L"lastexportfolder", NULL, &dwType, reinterpret_cast<LPBYTE>(&poop), &cbValueLength) == ERROR_FILE_NOT_FOUND) {
		if (SUCCEEDED(SHGetFolderPath(NULL, CSIDL_DESKTOP, NULL, 0, encpath)))
		{
			PathAppend(encpath, result2);
		}
	}
	else {
		PathAppend(encpath, CString(poop));
		PathAppend(encpath, result2);
	}
	RegCloseKey(hKey);
	_bstr_t b(encpath);
	const char* c = b;
	const int result = MessageBox(NULL, L"You've enabled the \"Output to WAV\" mode.\n\nPress YES to confirm, or press NO to open the configurator\nand disable it.", L"Keppy's Synthesizer", MB_ICONINFORMATION | MB_YESNO | MB_SYSTEMMODAL);
	switch (result)
	{
	case IDYES:
		BASS_Encode_Start(KSStream, c, BASS_ENCODE_PCM | BASS_ENCODE_LIMIT, NULL, 0);
		// Error handling
		CheckUp(ERRORCODE, L"EncoderStart");
		break;
	case IDNO:
		TCHAR configuratorapp[MAX_PATH];
		if (SUCCEEDED(SHGetFolderPath(NULL, CSIDL_SYSTEMX86, NULL, 0, configuratorapp)))
		{
			PathAppend(configuratorapp, _T("\\keppydrv\\KeppyDriverConfigurator.exe"));
			ShellExecute(NULL, L"open", configuratorapp, L"/AT", NULL, SW_SHOWNORMAL);
			exit(0);
			break;
		}
	}
	PrintToConsole(FOREGROUND_RED, 1, "BASSenc ready.");
}

int CreateThreads() {
	PrintToConsole(FOREGROUND_RED, 1, "Creating threads...");
	SetEvent(load_sfevent);
	reset_synth = 0;
	hThread2 = (HANDLE)_beginthreadex(NULL, 0, audioengine, 0, 0, &thrdaddr2);
	SetPriorityClass(hThread2, callprioval[driverprio]);
	SetThreadPriority(hThread2, prioval[driverprio]);
	hThread3 = (HANDLE)_beginthreadex(NULL, 0, settingsload, 0, 0, &thrdaddr3);
	SetPriorityClass(hThread3, callprioval[driverprio]);
	SetThreadPriority(hThread3, prioval[driverprio]);
	PrintToConsole(FOREGROUND_RED, 1, "Threads are now active.");
	return 1;
}

void LoadSoundFontsToStream() {
	PrintToConsole(FOREGROUND_RED, 1, "Loading soundfonts...");
	if (LoadSoundfontStartup() == TRUE) {
		PrintToConsole(FOREGROUND_RED, 1, "Default list for app loaded.");
	}
	else {
		LoadSoundfont(defaultsflist);
		PrintToConsole(FOREGROUND_RED, 1, "Default global list loaded.");
	}
}

void SetUpStream() {
	PrintToConsole(FOREGROUND_RED, 1, "Preparing stream...");
	BASS_ChannelSetAttribute(KSStream, BASS_ATTRIB_MIDI_CHANS, 16);
	BASS_MIDI_StreamEvent(KSStream, 0, MIDI_EVENT_SYSTEM, MIDI_SYSTEM_DEFAULT);
	BASS_MIDI_StreamEvent(KSStream, 9, MIDI_EVENT_DRUMS, 1);
}