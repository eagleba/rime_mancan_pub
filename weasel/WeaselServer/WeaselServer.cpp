// WeaselServer.cpp : main source file for WeaselServer.exe
//
//	WTL MessageLoop 封装了消息循环. 实现了 getmessage/dispatchmessage....

#include "stdafx.h"
#include "resource.h"
#include "WeaselService.h"
#include <WeaselIPC.h>
#include <WeaselUI.h>
#include <RimeWithWeasel.h>
#include <WeaselUtility.h>
#include <winsparkle.h>
#include <functional>
#include <ShellScalingApi.h>
#include <WinUser.h>
#include <memory>
#include <atlstr.h>
#pragma comment(lib, "Shcore.lib")

// 调试宏
#define DEBUG_LOG(msg) do { \
  FILE* f = fopen("weasel_debug.log", "a"); \
  if (f) { fprintf(f, msg); fflush(f); fclose(f); } \
  OutputDebugStringA(msg); \
} while(0)

CAppModule _Module;

int WINAPI _tWinMain(HINSTANCE hInstance,
                     HINSTANCE /*hPrevInstance*/,
                     LPTSTR lpstrCmdLine,
                     int nCmdShow) {
  DEBUG_LOG("WeaselServer: Starting...\n");
  
  LANGID langId = get_language_id();
  SetThreadUILanguage(langId);
  SetThreadLocale(langId);
  
  DEBUG_LOG("WeaselServer: Language set\n");

  if (!IsWindowsBlueOrLaterEx()) {
    DEBUG_LOG("WeaselServer: Windows version too old, exiting\n");
    CString info, cap;
    info.LoadStringW(IDS_STR_SYSTEM_VERSION_WARNING);
    cap.LoadStringW(IDS_STR_SYSTEM_VERSION_WARNING_CAPTION);
    MessageBoxExW(NULL, info, cap, MB_ICONERROR, langId);
    return 0;
  }
  DEBUG_LOG("WeaselServer: Windows version check passed\n");
  SetProcessDpiAwareness(PROCESS_PER_MONITOR_DPI_AWARE);

  // 防止服务进程开启输入法
  ImmDisableIME(-1);

  WCHAR user_name[20] = {0};
  DWORD size = _countof(user_name);
  GetUserName(user_name, &size);
  DEBUG_LOG("WeaselServer: Running as user check\n");
  if (!_wcsicmp(user_name, L"SYSTEM")) {
    DEBUG_LOG("WeaselServer: Running as SYSTEM, exiting\n");
    return 1;
  }

  HRESULT hRes = ::CoInitialize(NULL);
  // If you are running on NT 4.0 or higher you can use the following call
  // instead to make the EXE free threaded. This means that calls come in on a
  // random RPC thread.
  // HRESULT hRes = ::CoInitializeEx(NULL, COINIT_MULTITHREADED);
  ATLASSERT(SUCCEEDED(hRes));
  DEBUG_LOG("WeaselServer: CoInitialize completed\n");

  // this resolves ATL window thunking problem when Microsoft Layer for Unicode
  // (MSLU) is used
  ::DefWindowProc(NULL, 0, 0, 0L);

  AtlInitCommonControls(
      ICC_BAR_CLASSES);  // add flags to support other controls

  hRes = _Module.Init(NULL, hInstance);
  if (FAILED(hRes)) {
    DEBUG_LOG("WeaselServer: _Module.Init failed\n");
    return -1;
  }
  DEBUG_LOG("WeaselServer: _Module.Init succeeded\n");

  if (!wcscmp(L"/userdir", lpstrCmdLine)) {
    CreateDirectory(WeaselUserDataPath().c_str(), NULL);
    WeaselServerApp::explore(WeaselUserDataPath());
    return 0;
  }
  if (!wcscmp(L"/weaseldir", lpstrCmdLine)) {
    WeaselServerApp::explore(WeaselServerApp::install_dir());
    return 0;
  }
  if (!wcscmp(L"/ascii", lpstrCmdLine) || !wcscmp(L"/nascii", lpstrCmdLine)) {
    weasel::Client client;
    bool ascii = !wcscmp(L"/ascii", lpstrCmdLine);
    if (client.Connect())  // try to connect to running server
    {
      if (ascii)
        client.TrayCommand(ID_WEASELTRAY_ENABLE_ASCII);
      else
        client.TrayCommand(ID_WEASELTRAY_DISABLE_ASCII);
    }
    return 0;
  }

  // command line option /q stops the running server
  bool quit = !wcscmp(L"/q", lpstrCmdLine) || !wcscmp(L"/quit", lpstrCmdLine);
  // restart if already running
  {
    weasel::Client client;
    if (client.Connect())  // try to connect to running server
    {
      client.ShutdownServer();
      if (quit)
        return 0;
      int retry = 0;
      while (client.Connect() && retry < 10) {
        client.ShutdownServer();
        retry++;
        Sleep(50);
      }
      if (retry >= 10)
        return 0;
    } else if (quit)
      return 0;
  }

  bool check_updates = !wcscmp(L"/update", lpstrCmdLine);
  if (check_updates) {
    WeaselServerApp::check_update();
  }

  CreateDirectory(WeaselUserDataPath().c_str(), NULL);

  int nRet = 0;
  try {
    DEBUG_LOG("WeaselServer: Creating WeaselServerApp\n");
    WeaselServerApp app;
    DEBUG_LOG("WeaselServer: WeaselServerApp created successfully\n");
    RegisterApplicationRestart(NULL, 0);
    DEBUG_LOG("WeaselServer: Starting app.Run()\n");
    nRet = app.Run();
    DEBUG_LOG("WeaselServer: app.Run() completed\n");
  } catch (...) {
    DEBUG_LOG("WeaselServer: Exception caught in main try block\n");
    // bad luck...
    nRet = -1;
  }

  _Module.Term();
  ::CoUninitialize();

  return nRet;
}
