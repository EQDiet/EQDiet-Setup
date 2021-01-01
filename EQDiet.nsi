!define PRODUCT_NAME "EQDiet Beta"
!define PRODUCT_VERSION "0.9"
!define PRODUCT_PUBLISHER "EQDiet"
!define PRODUCT_WEB_SITE "https://eqdiet.weebly.com"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\Launcher.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKCU"
!define PRODUCT_STARTMENU_REGVAL "NSIS:StartMenuDir"

SetCompressor /SOLID lzma
Unicode true
RequestExecutionLevel user

; Installer properties
VIProductVersion ${PRODUCT_VERSION}.0.0
VIAddVersionKey ProductName "${PRODUCT_NAME} ${PRODUCT_VERSION}"
VIAddVersionKey CompanyName EQDiet
VIAddVersionKey Comments "Installs ${PRODUCT_NAME} ${PRODUCT_VERSION} into your computer"
VIAddVersionKey FileDescription "${PRODUCT_NAME} ${PRODUCT_VERSION} setup wizard"
VIAddVersionKey LegalCopyright "� 2021, EQDiet"
VIAddVersionKey FileVersion ${PRODUCT_VERSION}.0.0
VIAddVersionKey ProductVersion ${PRODUCT_VERSION}.0.0

; MUI 2.1 compatible ------
!include "MUI2.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "Resources\EQDiet.ico"
!define MUI_UNICON "Resources\EQDiet.ico"
!define MUI_WELCOMEFINISHPAGE_BITMAP "Resources\Sidebar.bmp"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!define MUI_LICENSEPAGE_CHECKBOX
!insertmacro MUI_PAGE_LICENSE "Resources\LICENSE.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Start menu page
var ICONS_GROUP
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "EQDiet"
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${PRODUCT_STARTMENU_REGVAL}"
!insertmacro MUI_PAGE_STARTMENU Application $ICONS_GROUP
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\Launcher.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "EQDiet-Setup.exe"
InstallDir "$APPDATA\EQDiet"
InstallDirRegKey HKCU "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show
BrandingText "EQDiet"

Section "EQDiet + Java" SEC01
  SetOutPath "$INSTDIR\Data"
  SetOverwrite try
  File "src\Data\Version.txt"
  File "src\Data\VersionNumber.txt"
  SetOutPath "$INSTDIR"
  File "src\EQDietBeta0.9.jar"
  SetOutPath "$INSTDIR\Java\bin"
  File "src\Java\bin\api-ms-win-core-console-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-core-console-l1-2-0.dll"
  File "src\Java\bin\api-ms-win-core-datetime-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-core-debug-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-core-errorhandling-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-core-file-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-core-file-l1-2-0.dll"
  File "src\Java\bin\api-ms-win-core-file-l2-1-0.dll"
  File "src\Java\bin\api-ms-win-core-handle-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-core-heap-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-core-interlocked-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-core-libraryloader-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-core-localization-l1-2-0.dll"
  File "src\Java\bin\api-ms-win-core-memory-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-core-namedpipe-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-core-processenvironment-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-core-processthreads-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-core-processthreads-l1-1-1.dll"
  File "src\Java\bin\api-ms-win-core-profile-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-core-rtlsupport-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-core-string-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-core-synch-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-core-synch-l1-2-0.dll"
  File "src\Java\bin\api-ms-win-core-sysinfo-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-core-timezone-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-core-util-l1-1-0.dll"
  File "src\Java\bin\API-MS-Win-core-xstate-l2-1-0.dll"
  File "src\Java\bin\api-ms-win-crt-conio-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-crt-convert-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-crt-environment-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-crt-filesystem-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-crt-heap-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-crt-locale-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-crt-math-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-crt-multibyte-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-crt-private-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-crt-process-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-crt-runtime-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-crt-stdio-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-crt-string-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-crt-time-l1-1-0.dll"
  File "src\Java\bin\api-ms-win-crt-utility-l1-1-0.dll"
  File "src\Java\bin\attach.dll"
  File "src\Java\bin\awt.dll"
  File "src\Java\bin\bci.dll"
  SetOutPath "$INSTDIR\Java\bin\client"
  File "src\Java\bin\client\classes.jsa"
  File "src\Java\bin\client\jvm.dll"
  File "src\Java\bin\client\Xusage.txt"
  SetOutPath "$INSTDIR\Java\bin"
  File "src\Java\bin\dcpr.dll"
  File "src\Java\bin\decora_sse.dll"
  File "src\Java\bin\deploy.dll"
  SetOutPath "$INSTDIR\Java\bin\dtplugin"
  File "src\Java\bin\dtplugin\deployJava1.dll"
  File "src\Java\bin\dtplugin\npdeployJava1.dll"
  SetOutPath "$INSTDIR\Java\bin"
  File "src\Java\bin\dt_shmem.dll"
  File "src\Java\bin\dt_socket.dll"
  File "src\Java\bin\eula.dll"
  File "src\Java\bin\fontmanager.dll"
  File "src\Java\bin\fxplugins.dll"
  File "src\Java\bin\glass.dll"
  File "src\Java\bin\glib-lite.dll"
  File "src\Java\bin\gstreamer-lite.dll"
  File "src\Java\bin\hprof.dll"
  File "src\Java\bin\instrument.dll"
  File "src\Java\bin\j2pcsc.dll"
  File "src\Java\bin\j2pkcs11.dll"
  File "src\Java\bin\jaas_nt.dll"
  File "src\Java\bin\jabswitch.exe"
  File "src\Java\bin\java-rmi.exe"
  File "src\Java\bin\java.dll"
  File "src\Java\bin\java.exe"
  File "src\Java\bin\JavaAccessBridge-32.dll"
  File "src\Java\bin\javacpl.cpl"
  File "src\Java\bin\javacpl.exe"
  File "src\Java\bin\javafx_font.dll"
  File "src\Java\bin\javafx_iio.dll"
  File "src\Java\bin\javaw.exe"
  File "src\Java\bin\javaws.exe"
  File "src\Java\bin\java_crw_demo.dll"
  File "src\Java\bin\jawt.dll"
  File "src\Java\bin\JAWTAccessBridge-32.dll"
  File "src\Java\bin\jdwp.dll"
  File "src\Java\bin\jfr.dll"
  File "src\Java\bin\jfxmedia.dll"
  File "src\Java\bin\jfxwebkit.dll"
  File "src\Java\bin\jjs.exe"
  File "src\Java\bin\jli.dll"
  File "src\Java\bin\jp2iexp.dll"
  File "src\Java\bin\jp2launcher.exe"
  File "src\Java\bin\jp2native.dll"
  File "src\Java\bin\jp2ssv.dll"
  File "src\Java\bin\jpeg.dll"
  File "src\Java\bin\jsdt.dll"
  File "src\Java\bin\jsound.dll"
  File "src\Java\bin\jsoundds.dll"
  File "src\Java\bin\keytool.exe"
  File "src\Java\bin\kinit.exe"
  File "src\Java\bin\klist.exe"
  File "src\Java\bin\ktab.exe"
  File "src\Java\bin\lcms.dll"
  File "src\Java\bin\management.dll"
  File "src\Java\bin\mlib_image.dll"
  File "src\Java\bin\msvcp140.dll"
  File "src\Java\bin\net.dll"
  File "src\Java\bin\nio.dll"
  File "src\Java\bin\npt.dll"
  File "src\Java\bin\orbd.exe"
  File "src\Java\bin\pack200.exe"
  SetOutPath "$INSTDIR\Java\bin\plugin2"
  File "src\Java\bin\plugin2\msvcp140.dll"
  File "src\Java\bin\plugin2\npjp2.dll"
  File "src\Java\bin\plugin2\vcruntime140.dll"
  SetOutPath "$INSTDIR\Java\bin"
  File "src\Java\bin\policytool.exe"
  File "src\Java\bin\prism_common.dll"
  File "src\Java\bin\prism_d3d.dll"
  File "src\Java\bin\prism_sw.dll"
  File "src\Java\bin\resource.dll"
  File "src\Java\bin\rmid.exe"
  File "src\Java\bin\rmiregistry.exe"
  File "src\Java\bin\sawindbg.dll"
  SetOutPath "$INSTDIR\Java\bin\server"
  File "src\Java\bin\server\jvm.dll"
  File "src\Java\bin\server\Xusage.txt"
  SetOutPath "$INSTDIR\Java\bin"
  File "src\Java\bin\servertool.exe"
  File "src\Java\bin\splashscreen.dll"
  File "src\Java\bin\ssv.dll"
  File "src\Java\bin\ssvagent.exe"
  File "src\Java\bin\sunec.dll"
  File "src\Java\bin\sunmscapi.dll"
  File "src\Java\bin\t2k.dll"
  File "src\Java\bin\tnameserv.exe"
  File "src\Java\bin\ucrtbase.dll"
  File "src\Java\bin\unpack.dll"
  File "src\Java\bin\unpack200.exe"
  File "src\Java\bin\vcruntime140.dll"
  File "src\Java\bin\verify.dll"
  File "src\Java\bin\w2k_lsa_auth.dll"
  File "src\Java\bin\WindowsAccessBridge-32.dll"
  File "src\Java\bin\wsdetect.dll"
  File "src\Java\bin\zip.dll"
  SetOutPath "$INSTDIR\Java"
  File "src\Java\COPYRIGHT"
  SetOutPath "$INSTDIR\Java\legal\javafx"
  File "src\Java\legal\javafx\directshow.md"
  File "src\Java\legal\javafx\glib.md"
  File "src\Java\legal\javafx\gstreamer.md"
  File "src\Java\legal\javafx\icu_web.md"
  File "src\Java\legal\javafx\jpeg_fx.md"
  File "src\Java\legal\javafx\libffi.md"
  File "src\Java\legal\javafx\libxml2.md"
  File "src\Java\legal\javafx\libxslt.md"
  File "src\Java\legal\javafx\mesa3d.md"
  File "src\Java\legal\javafx\webkit.md"
  SetOutPath "$INSTDIR\Java\legal\jdk"
  File "src\Java\legal\jdk\asm.md"
  File "src\Java\legal\jdk\bcel.md"
  File "src\Java\legal\jdk\cldr.md"
  File "src\Java\legal\jdk\colorimaging.md"
  File "src\Java\legal\jdk\cryptix.md"
  File "src\Java\legal\jdk\dom.md"
  File "src\Java\legal\jdk\dynalink.md"
  File "src\Java\legal\jdk\ecc.md"
  File "src\Java\legal\jdk\freebxml.md"
  File "src\Java\legal\jdk\giflib.md"
  File "src\Java\legal\jdk\icu.md"
  File "src\Java\legal\jdk\jcup.md"
  File "src\Java\legal\jdk\joni.md"
  File "src\Java\legal\jdk\jopt-simple.md"
  File "src\Java\legal\jdk\jpeg.md"
  File "src\Java\legal\jdk\lcms.md"
  File "src\Java\legal\jdk\libpng.md"
  File "src\Java\legal\jdk\mesa3d.md"
  File "src\Java\legal\jdk\pkcs11cryptotoken.md"
  File "src\Java\legal\jdk\pkcs11wrapper.md"
  File "src\Java\legal\jdk\relaxngcc.md"
  File "src\Java\legal\jdk\relaxngdatatype.md"
  File "src\Java\legal\jdk\relaxngom.md"
  File "src\Java\legal\jdk\santuario.md"
  File "src\Java\legal\jdk\thaidict.md"
  File "src\Java\legal\jdk\unicode.md"
  File "src\Java\legal\jdk\xalan.md"
  File "src\Java\legal\jdk\xerces.md"
  File "src\Java\legal\jdk\xmlresolver.md"
  File "src\Java\legal\jdk\zlib.md"
  SetOutPath "$INSTDIR\Java\lib"
  File "src\Java\lib\accessibility.properties"
  File "src\Java\lib\calendars.properties"
  File "src\Java\lib\charsets.jar"
  File "src\Java\lib\classlist"
  SetOutPath "$INSTDIR\Java\lib\cmm"
  File "src\Java\lib\cmm\CIEXYZ.pf"
  File "src\Java\lib\cmm\GRAY.pf"
  File "src\Java\lib\cmm\LINEAR_RGB.pf"
  File "src\Java\lib\cmm\PYCC.pf"
  File "src\Java\lib\cmm\sRGB.pf"
  SetOutPath "$INSTDIR\Java\lib"
  File "src\Java\lib\content-types.properties"
  File "src\Java\lib\currency.data"
  SetOutPath "$INSTDIR\Java\lib\deploy"
  File "src\Java\lib\deploy\ffjcext.zip"
  File "src\Java\lib\deploy\messages.properties"
  File "src\Java\lib\deploy\messages_de.properties"
  File "src\Java\lib\deploy\messages_es.properties"
  File "src\Java\lib\deploy\messages_fr.properties"
  File "src\Java\lib\deploy\messages_it.properties"
  File "src\Java\lib\deploy\messages_ja.properties"
  File "src\Java\lib\deploy\messages_ko.properties"
  File "src\Java\lib\deploy\messages_pt_BR.properties"
  File "src\Java\lib\deploy\messages_sv.properties"
  File "src\Java\lib\deploy\messages_zh_CN.properties"
  File "src\Java\lib\deploy\messages_zh_HK.properties"
  File "src\Java\lib\deploy\messages_zh_TW.properties"
  File "src\Java\lib\deploy\splash.gif"
  File "src\Java\lib\deploy\splash@2x.gif"
  File "src\Java\lib\deploy\splash_11-lic.gif"
  File "src\Java\lib\deploy\splash_11@2x-lic.gif"
  SetOutPath "$INSTDIR\Java\lib"
  File "src\Java\lib\deploy.jar"
  SetOutPath "$INSTDIR\Java\lib\ext"
  File "src\Java\lib\ext\access-bridge-32.jar"
  File "src\Java\lib\ext\cldrdata.jar"
  File "src\Java\lib\ext\dnsns.jar"
  File "src\Java\lib\ext\jaccess.jar"
  File "src\Java\lib\ext\jfxrt.jar"
  File "src\Java\lib\ext\localedata.jar"
  File "src\Java\lib\ext\meta-index"
  File "src\Java\lib\ext\nashorn.jar"
  File "src\Java\lib\ext\sunec.jar"
  File "src\Java\lib\ext\sunjce_provider.jar"
  File "src\Java\lib\ext\sunmscapi.jar"
  File "src\Java\lib\ext\sunpkcs11.jar"
  File "src\Java\lib\ext\zipfs.jar"
  SetOutPath "$INSTDIR\Java\lib"
  File "src\Java\lib\flavormap.properties"
  File "src\Java\lib\fontconfig.bfc"
  File "src\Java\lib\fontconfig.properties.src"
  SetOutPath "$INSTDIR\Java\lib\fonts"
  File "src\Java\lib\fonts\LucidaBrightDemiBold.ttf"
  File "src\Java\lib\fonts\LucidaBrightDemiItalic.ttf"
  File "src\Java\lib\fonts\LucidaBrightItalic.ttf"
  File "src\Java\lib\fonts\LucidaBrightRegular.ttf"
  File "src\Java\lib\fonts\LucidaSansDemiBold.ttf"
  File "src\Java\lib\fonts\LucidaSansRegular.ttf"
  File "src\Java\lib\fonts\LucidaTypewriterBold.ttf"
  File "src\Java\lib\fonts\LucidaTypewriterRegular.ttf"
  SetOutPath "$INSTDIR\Java\lib"
  File "src\Java\lib\hijrah-config-umalqura.properties"
  SetOutPath "$INSTDIR\Java\lib\i386"
  File "src\Java\lib\i386\jvm.cfg"
  SetOutPath "$INSTDIR\Java\lib\images\cursors"
  File "src\Java\lib\images\cursors\cursors.properties"
  File "src\Java\lib\images\cursors\invalid32x32.gif"
  File "src\Java\lib\images\cursors\win32_CopyDrop32x32.gif"
  File "src\Java\lib\images\cursors\win32_CopyNoDrop32x32.gif"
  File "src\Java\lib\images\cursors\win32_LinkDrop32x32.gif"
  File "src\Java\lib\images\cursors\win32_LinkNoDrop32x32.gif"
  File "src\Java\lib\images\cursors\win32_MoveDrop32x32.gif"
  File "src\Java\lib\images\cursors\win32_MoveNoDrop32x32.gif"
  SetOutPath "$INSTDIR\Java\lib"
  File "src\Java\lib\javafx.properties"
  File "src\Java\lib\javaws.jar"
  File "src\Java\lib\jce.jar"
  SetOutPath "$INSTDIR\Java\lib\jfr"
  File "src\Java\lib\jfr\default.jfc"
  File "src\Java\lib\jfr\profile.jfc"
  SetOutPath "$INSTDIR\Java\lib"
  File "src\Java\lib\jfr.jar"
  File "src\Java\lib\jfxswt.jar"
  File "src\Java\lib\jsse.jar"
  File "src\Java\lib\jvm.hprof.txt"
  File "src\Java\lib\logging.properties"
  SetOutPath "$INSTDIR\Java\lib\management"
  File "src\Java\lib\management\jmxremote.access"
  File "src\Java\lib\management\jmxremote.password.template"
  File "src\Java\lib\management\management.properties"
  File "src\Java\lib\management\snmp.acl.template"
  SetOutPath "$INSTDIR\Java\lib"
  File "src\Java\lib\management-agent.jar"
  File "src\Java\lib\meta-index"
  File "src\Java\lib\net.properties"
  File "src\Java\lib\plugin.jar"
  File "src\Java\lib\psfont.properties.ja"
  File "src\Java\lib\psfontj2d.properties"
  File "src\Java\lib\resources.jar"
  File "src\Java\lib\rt.jar"
  SetOutPath "$INSTDIR\Java\lib\security"
  File "src\Java\lib\security\blacklist"
  File "src\Java\lib\security\blacklisted.certs"
  File "src\Java\lib\security\cacerts"
  File "src\Java\lib\security\java.policy"
  File "src\Java\lib\security\java.security"
  File "src\Java\lib\security\javaws.policy"
  SetOutPath "$INSTDIR\Java\lib\security\policy\limited"
  File "src\Java\lib\security\policy\limited\local_policy.jar"
  File "src\Java\lib\security\policy\limited\US_export_policy.jar"
  SetOutPath "$INSTDIR\Java\lib\security\policy\unlimited"
  File "src\Java\lib\security\policy\unlimited\local_policy.jar"
  File "src\Java\lib\security\policy\unlimited\US_export_policy.jar"
  SetOutPath "$INSTDIR\Java\lib\security"
  File "src\Java\lib\security\trusted.libraries"
  SetOutPath "$INSTDIR\Java\lib"
  File "src\Java\lib\sound.properties"
  File "src\Java\lib\tzdb.dat"
  File "src\Java\lib\tzmappings"
  SetOutPath "$INSTDIR\Java"
  File "src\Java\LICENSE"
  File "src\Java\README.txt"
  File "src\Java\THIRDPARTYLICENSEREADME-JAVAFX.txt"
  File "src\Java\THIRDPARTYLICENSEREADME.txt"
  File "src\Java\Welcome.html"
  SetOutPath "$INSTDIR"
  File "src\Launcher.exe"
  File "src\Launcher.jar"

; Shortcuts
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateDirectory "$SMPROGRAMS\$ICONS_GROUP"
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\EQDiet.lnk" "$INSTDIR\Launcher.exe"
  CreateShortCut "$DESKTOP\EQDiet.lnk" "$INSTDIR\Launcher.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -AdditionalIcons
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
  CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk" "$INSTDIR\unins000.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\unins000.exe"
  WriteRegStr HKCU "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\Launcher.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\unins000.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\Launcher.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  !insertmacro MUI_STARTMENU_GETFOLDER "Application" $ICONS_GROUP
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\Launcher.jar"
  Delete "$INSTDIR\Launcher.exe"
  Delete "$INSTDIR\Java\Welcome.html"
  Delete "$INSTDIR\Java\THIRDPARTYLICENSEREADME.txt"
  Delete "$INSTDIR\Java\THIRDPARTYLICENSEREADME-JAVAFX.txt"
  Delete "$INSTDIR\Java\README.txt"
  Delete "$INSTDIR\Java\LICENSE"
  Delete "$INSTDIR\Java\lib\tzmappings"
  Delete "$INSTDIR\Java\lib\tzdb.dat"
  Delete "$INSTDIR\Java\lib\sound.properties"
  Delete "$INSTDIR\Java\lib\security\trusted.libraries"
  Delete "$INSTDIR\Java\lib\security\policy\unlimited\US_export_policy.jar"
  Delete "$INSTDIR\Java\lib\security\policy\unlimited\local_policy.jar"
  RMDir  "$INSTDIR\Java\lib\security\policy\unlimited"
  Delete "$INSTDIR\Java\lib\security\policy\limited\US_export_policy.jar"
  Delete "$INSTDIR\Java\lib\security\policy\limited\local_policy.jar"
  RMDir  "$INSTDIR\Java\lib\security\policy\limited"
  Delete "$INSTDIR\Java\lib\security\javaws.policy"
  Delete "$INSTDIR\Java\lib\security\java.security"
  Delete "$INSTDIR\Java\lib\security\java.policy"
  Delete "$INSTDIR\Java\lib\security\cacerts"
  Delete "$INSTDIR\Java\lib\security\blacklisted.certs"
  Delete "$INSTDIR\Java\lib\security\blacklist"
  RMDir  "$INSTDIR\Java\lib\security"
  Delete "$INSTDIR\Java\lib\rt.jar"
  Delete "$INSTDIR\Java\lib\resources.jar"
  Delete "$INSTDIR\Java\lib\psfontj2d.properties"
  Delete "$INSTDIR\Java\lib\psfont.properties.ja"
  Delete "$INSTDIR\Java\lib\plugin.jar"
  Delete "$INSTDIR\Java\lib\net.properties"
  Delete "$INSTDIR\Java\lib\meta-index"
  Delete "$INSTDIR\Java\lib\management-agent.jar"
  Delete "$INSTDIR\Java\lib\management\snmp.acl.template"
  Delete "$INSTDIR\Java\lib\management\management.properties"
  Delete "$INSTDIR\Java\lib\management\jmxremote.password.template"
  Delete "$INSTDIR\Java\lib\management\jmxremote.access"
  RMDir  "$INSTDIR\Java\lib\management"
  Delete "$INSTDIR\Java\lib\logging.properties"
  Delete "$INSTDIR\Java\lib\jvm.hprof.txt"
  Delete "$INSTDIR\Java\lib\jsse.jar"
  Delete "$INSTDIR\Java\lib\jfxswt.jar"
  Delete "$INSTDIR\Java\lib\jfr.jar"
  Delete "$INSTDIR\Java\lib\jfr\profile.jfc"
  Delete "$INSTDIR\Java\lib\jfr\default.jfc"
  RMDir  "$INSTDIR\Java\lib\jfr"
  Delete "$INSTDIR\Java\lib\jce.jar"
  Delete "$INSTDIR\Java\lib\javaws.jar"
  Delete "$INSTDIR\Java\lib\javafx.properties"
  Delete "$INSTDIR\Java\lib\images\cursors\win32_MoveNoDrop32x32.gif"
  Delete "$INSTDIR\Java\lib\images\cursors\win32_MoveDrop32x32.gif"
  Delete "$INSTDIR\Java\lib\images\cursors\win32_LinkNoDrop32x32.gif"
  Delete "$INSTDIR\Java\lib\images\cursors\win32_LinkDrop32x32.gif"
  Delete "$INSTDIR\Java\lib\images\cursors\win32_CopyNoDrop32x32.gif"
  Delete "$INSTDIR\Java\lib\images\cursors\win32_CopyDrop32x32.gif"
  Delete "$INSTDIR\Java\lib\images\cursors\invalid32x32.gif"
  Delete "$INSTDIR\Java\lib\images\cursors\cursors.properties"
  RMDir  "$INSTDIR\Java\lib\images\cursors"
  Delete "$INSTDIR\Java\lib\i386\jvm.cfg"
  RMDir  "$INSTDIR\Java\lib\i386"
  Delete "$INSTDIR\Java\lib\hijrah-config-umalqura.properties"
  Delete "$INSTDIR\Java\lib\fonts\LucidaTypewriterRegular.ttf"
  Delete "$INSTDIR\Java\lib\fonts\LucidaTypewriterBold.ttf"
  Delete "$INSTDIR\Java\lib\fonts\LucidaSansRegular.ttf"
  Delete "$INSTDIR\Java\lib\fonts\LucidaSansDemiBold.ttf"
  Delete "$INSTDIR\Java\lib\fonts\LucidaBrightRegular.ttf"
  Delete "$INSTDIR\Java\lib\fonts\LucidaBrightItalic.ttf"
  Delete "$INSTDIR\Java\lib\fonts\LucidaBrightDemiItalic.ttf"
  Delete "$INSTDIR\Java\lib\fonts\LucidaBrightDemiBold.ttf"
  RMDir  "$INSTDIR\Java\lib\fonts"
  Delete "$INSTDIR\Java\lib\fontconfig.properties.src"
  Delete "$INSTDIR\Java\lib\fontconfig.bfc"
  Delete "$INSTDIR\Java\lib\flavormap.properties"
  Delete "$INSTDIR\Java\lib\ext\zipfs.jar"
  Delete "$INSTDIR\Java\lib\ext\sunpkcs11.jar"
  Delete "$INSTDIR\Java\lib\ext\sunmscapi.jar"
  Delete "$INSTDIR\Java\lib\ext\sunjce_provider.jar"
  Delete "$INSTDIR\Java\lib\ext\sunec.jar"
  Delete "$INSTDIR\Java\lib\ext\nashorn.jar"
  Delete "$INSTDIR\Java\lib\ext\meta-index"
  Delete "$INSTDIR\Java\lib\ext\localedata.jar"
  Delete "$INSTDIR\Java\lib\ext\jfxrt.jar"
  Delete "$INSTDIR\Java\lib\ext\jaccess.jar"
  Delete "$INSTDIR\Java\lib\ext\dnsns.jar"
  Delete "$INSTDIR\Java\lib\ext\cldrdata.jar"
  Delete "$INSTDIR\Java\lib\ext\access-bridge-32.jar"
  RMDir  "$INSTDIR\Java\lib\ext"
  Delete "$INSTDIR\Java\lib\deploy.jar"
  Delete "$INSTDIR\Java\lib\deploy\splash_11@2x-lic.gif"
  Delete "$INSTDIR\Java\lib\deploy\splash_11-lic.gif"
  Delete "$INSTDIR\Java\lib\deploy\splash@2x.gif"
  Delete "$INSTDIR\Java\lib\deploy\splash.gif"
  Delete "$INSTDIR\Java\lib\deploy\messages_zh_TW.properties"
  Delete "$INSTDIR\Java\lib\deploy\messages_zh_HK.properties"
  Delete "$INSTDIR\Java\lib\deploy\messages_zh_CN.properties"
  Delete "$INSTDIR\Java\lib\deploy\messages_sv.properties"
  Delete "$INSTDIR\Java\lib\deploy\messages_pt_BR.properties"
  Delete "$INSTDIR\Java\lib\deploy\messages_ko.properties"
  Delete "$INSTDIR\Java\lib\deploy\messages_ja.properties"
  Delete "$INSTDIR\Java\lib\deploy\messages_it.properties"
  Delete "$INSTDIR\Java\lib\deploy\messages_fr.properties"
  Delete "$INSTDIR\Java\lib\deploy\messages_es.properties"
  Delete "$INSTDIR\Java\lib\deploy\messages_de.properties"
  Delete "$INSTDIR\Java\lib\deploy\messages.properties"
  Delete "$INSTDIR\Java\lib\deploy\ffjcext.zip"
  RMDir  "$INSTDIR\Java\lib\deploy"
  Delete "$INSTDIR\Java\lib\currency.data"
  Delete "$INSTDIR\Java\lib\content-types.properties"
  Delete "$INSTDIR\Java\lib\cmm\sRGB.pf"
  Delete "$INSTDIR\Java\lib\cmm\PYCC.pf"
  Delete "$INSTDIR\Java\lib\cmm\LINEAR_RGB.pf"
  Delete "$INSTDIR\Java\lib\cmm\GRAY.pf"
  Delete "$INSTDIR\Java\lib\cmm\CIEXYZ.pf"
  RMDir  "$INSTDIR\Java\lib\cmm"
  Delete "$INSTDIR\Java\lib\classlist"
  Delete "$INSTDIR\Java\lib\charsets.jar"
  Delete "$INSTDIR\Java\lib\calendars.properties"
  Delete "$INSTDIR\Java\lib\accessibility.properties"
  RMDir  "$INSTDIR\Java\lib"
  Delete "$INSTDIR\Java\legal\jdk\zlib.md"
  Delete "$INSTDIR\Java\legal\jdk\xmlresolver.md"
  Delete "$INSTDIR\Java\legal\jdk\xerces.md"
  Delete "$INSTDIR\Java\legal\jdk\xalan.md"
  Delete "$INSTDIR\Java\legal\jdk\unicode.md"
  Delete "$INSTDIR\Java\legal\jdk\thaidict.md"
  Delete "$INSTDIR\Java\legal\jdk\santuario.md"
  Delete "$INSTDIR\Java\legal\jdk\relaxngom.md"
  Delete "$INSTDIR\Java\legal\jdk\relaxngdatatype.md"
  Delete "$INSTDIR\Java\legal\jdk\relaxngcc.md"
  Delete "$INSTDIR\Java\legal\jdk\pkcs11wrapper.md"
  Delete "$INSTDIR\Java\legal\jdk\pkcs11cryptotoken.md"
  Delete "$INSTDIR\Java\legal\jdk\mesa3d.md"
  Delete "$INSTDIR\Java\legal\jdk\libpng.md"
  Delete "$INSTDIR\Java\legal\jdk\lcms.md"
  Delete "$INSTDIR\Java\legal\jdk\jpeg.md"
  Delete "$INSTDIR\Java\legal\jdk\jopt-simple.md"
  Delete "$INSTDIR\Java\legal\jdk\joni.md"
  Delete "$INSTDIR\Java\legal\jdk\jcup.md"
  Delete "$INSTDIR\Java\legal\jdk\icu.md"
  Delete "$INSTDIR\Java\legal\jdk\giflib.md"
  Delete "$INSTDIR\Java\legal\jdk\freebxml.md"
  Delete "$INSTDIR\Java\legal\jdk\ecc.md"
  Delete "$INSTDIR\Java\legal\jdk\dynalink.md"
  Delete "$INSTDIR\Java\legal\jdk\dom.md"
  Delete "$INSTDIR\Java\legal\jdk\cryptix.md"
  Delete "$INSTDIR\Java\legal\jdk\colorimaging.md"
  Delete "$INSTDIR\Java\legal\jdk\cldr.md"
  Delete "$INSTDIR\Java\legal\jdk\bcel.md"
  Delete "$INSTDIR\Java\legal\jdk\asm.md"
  RMDir  "$INSTDIR\Java\legal\jdk"
  Delete "$INSTDIR\Java\legal\javafx\webkit.md"
  Delete "$INSTDIR\Java\legal\javafx\mesa3d.md"
  Delete "$INSTDIR\Java\legal\javafx\libxslt.md"
  Delete "$INSTDIR\Java\legal\javafx\libxml2.md"
  Delete "$INSTDIR\Java\legal\javafx\libffi.md"
  Delete "$INSTDIR\Java\legal\javafx\jpeg_fx.md"
  Delete "$INSTDIR\Java\legal\javafx\icu_web.md"
  Delete "$INSTDIR\Java\legal\javafx\gstreamer.md"
  Delete "$INSTDIR\Java\legal\javafx\glib.md"
  Delete "$INSTDIR\Java\legal\javafx\directshow.md"
  RMDir  "$INSTDIR\Java\legal\javafx"
  Delete "$INSTDIR\Java\COPYRIGHT"
  Delete "$INSTDIR\Java\bin\zip.dll"
  Delete "$INSTDIR\Java\bin\wsdetect.dll"
  Delete "$INSTDIR\Java\bin\WindowsAccessBridge-32.dll"
  Delete "$INSTDIR\Java\bin\w2k_lsa_auth.dll"
  Delete "$INSTDIR\Java\bin\verify.dll"
  Delete "$INSTDIR\Java\bin\vcruntime140.dll"
  Delete "$INSTDIR\Java\bin\unpack200.exe"
  Delete "$INSTDIR\Java\bin\unpack.dll"
  Delete "$INSTDIR\Java\bin\ucrtbase.dll"
  Delete "$INSTDIR\Java\bin\tnameserv.exe"
  Delete "$INSTDIR\Java\bin\t2k.dll"
  Delete "$INSTDIR\Java\bin\sunmscapi.dll"
  Delete "$INSTDIR\Java\bin\sunec.dll"
  Delete "$INSTDIR\Java\bin\ssvagent.exe"
  Delete "$INSTDIR\Java\bin\ssv.dll"
  Delete "$INSTDIR\Java\bin\splashscreen.dll"
  Delete "$INSTDIR\Java\bin\servertool.exe"
  Delete "$INSTDIR\Java\bin\server\Xusage.txt"
  Delete "$INSTDIR\Java\bin\server\jvm.dll"
  RMDir  "$INSTDIR\Java\bin\server"
  Delete "$INSTDIR\Java\bin\sawindbg.dll"
  Delete "$INSTDIR\Java\bin\rmiregistry.exe"
  Delete "$INSTDIR\Java\bin\rmid.exe"
  Delete "$INSTDIR\Java\bin\resource.dll"
  Delete "$INSTDIR\Java\bin\prism_sw.dll"
  Delete "$INSTDIR\Java\bin\prism_d3d.dll"
  Delete "$INSTDIR\Java\bin\prism_common.dll"
  Delete "$INSTDIR\Java\bin\policytool.exe"
  Delete "$INSTDIR\Java\bin\plugin2\vcruntime140.dll"
  Delete "$INSTDIR\Java\bin\plugin2\npjp2.dll"
  Delete "$INSTDIR\Java\bin\plugin2\msvcp140.dll"
  RMDir  "$INSTDIR\Java\bin\plugin2"
  Delete "$INSTDIR\Java\bin\pack200.exe"
  Delete "$INSTDIR\Java\bin\orbd.exe"
  Delete "$INSTDIR\Java\bin\npt.dll"
  Delete "$INSTDIR\Java\bin\nio.dll"
  Delete "$INSTDIR\Java\bin\net.dll"
  Delete "$INSTDIR\Java\bin\msvcp140.dll"
  Delete "$INSTDIR\Java\bin\mlib_image.dll"
  Delete "$INSTDIR\Java\bin\management.dll"
  Delete "$INSTDIR\Java\bin\lcms.dll"
  Delete "$INSTDIR\Java\bin\ktab.exe"
  Delete "$INSTDIR\Java\bin\klist.exe"
  Delete "$INSTDIR\Java\bin\kinit.exe"
  Delete "$INSTDIR\Java\bin\keytool.exe"
  Delete "$INSTDIR\Java\bin\jsoundds.dll"
  Delete "$INSTDIR\Java\bin\jsound.dll"
  Delete "$INSTDIR\Java\bin\jsdt.dll"
  Delete "$INSTDIR\Java\bin\jpeg.dll"
  Delete "$INSTDIR\Java\bin\jp2ssv.dll"
  Delete "$INSTDIR\Java\bin\jp2native.dll"
  Delete "$INSTDIR\Java\bin\jp2launcher.exe"
  Delete "$INSTDIR\Java\bin\jp2iexp.dll"
  Delete "$INSTDIR\Java\bin\jli.dll"
  Delete "$INSTDIR\Java\bin\jjs.exe"
  Delete "$INSTDIR\Java\bin\jfxwebkit.dll"
  Delete "$INSTDIR\Java\bin\jfxmedia.dll"
  Delete "$INSTDIR\Java\bin\jfr.dll"
  Delete "$INSTDIR\Java\bin\jdwp.dll"
  Delete "$INSTDIR\Java\bin\JAWTAccessBridge-32.dll"
  Delete "$INSTDIR\Java\bin\jawt.dll"
  Delete "$INSTDIR\Java\bin\java_crw_demo.dll"
  Delete "$INSTDIR\Java\bin\javaws.exe"
  Delete "$INSTDIR\Java\bin\javaw.exe"
  Delete "$INSTDIR\Java\bin\javafx_iio.dll"
  Delete "$INSTDIR\Java\bin\javafx_font.dll"
  Delete "$INSTDIR\Java\bin\javacpl.exe"
  Delete "$INSTDIR\Java\bin\javacpl.cpl"
  Delete "$INSTDIR\Java\bin\JavaAccessBridge-32.dll"
  Delete "$INSTDIR\Java\bin\java.exe"
  Delete "$INSTDIR\Java\bin\java.dll"
  Delete "$INSTDIR\Java\bin\java-rmi.exe"
  Delete "$INSTDIR\Java\bin\jabswitch.exe"
  Delete "$INSTDIR\Java\bin\jaas_nt.dll"
  Delete "$INSTDIR\Java\bin\j2pkcs11.dll"
  Delete "$INSTDIR\Java\bin\j2pcsc.dll"
  Delete "$INSTDIR\Java\bin\instrument.dll"
  Delete "$INSTDIR\Java\bin\hprof.dll"
  Delete "$INSTDIR\Java\bin\gstreamer-lite.dll"
  Delete "$INSTDIR\Java\bin\glib-lite.dll"
  Delete "$INSTDIR\Java\bin\glass.dll"
  Delete "$INSTDIR\Java\bin\fxplugins.dll"
  Delete "$INSTDIR\Java\bin\fontmanager.dll"
  Delete "$INSTDIR\Java\bin\eula.dll"
  Delete "$INSTDIR\Java\bin\dt_socket.dll"
  Delete "$INSTDIR\Java\bin\dt_shmem.dll"
  Delete "$INSTDIR\Java\bin\dtplugin\npdeployJava1.dll"
  Delete "$INSTDIR\Java\bin\dtplugin\deployJava1.dll"
  RMDir  "$INSTDIR\Java\bin\dtplugin"
  Delete "$INSTDIR\Java\bin\deploy.dll"
  Delete "$INSTDIR\Java\bin\decora_sse.dll"
  Delete "$INSTDIR\Java\bin\dcpr.dll"
  Delete "$INSTDIR\Java\bin\client\Xusage.txt"
  Delete "$INSTDIR\Java\bin\client\jvm.dll"
  Delete "$INSTDIR\Java\bin\client\classes.jsa"
  RMDir  "$INSTDIR\Java\bin\client"
  Delete "$INSTDIR\Java\bin\bci.dll"
  Delete "$INSTDIR\Java\bin\awt.dll"
  Delete "$INSTDIR\Java\bin\attach.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-crt-utility-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-crt-time-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-crt-string-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-crt-stdio-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-crt-runtime-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-crt-process-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-crt-private-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-crt-multibyte-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-crt-math-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-crt-locale-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-crt-heap-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-crt-filesystem-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-crt-environment-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-crt-convert-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-crt-conio-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\API-MS-Win-core-xstate-l2-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-util-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-timezone-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-sysinfo-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-synch-l1-2-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-synch-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-string-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-rtlsupport-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-profile-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-processthreads-l1-1-1.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-processthreads-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-processenvironment-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-namedpipe-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-memory-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-localization-l1-2-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-libraryloader-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-interlocked-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-heap-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-handle-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-file-l2-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-file-l1-2-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-file-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-errorhandling-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-debug-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-datetime-l1-1-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-console-l1-2-0.dll"
  Delete "$INSTDIR\Java\bin\api-ms-win-core-console-l1-1-0.dll"
  RMDir  "$INSTDIR\Java\bin"
  Delete "$INSTDIR\EQDiet*.jar" ; Useful if EQDiet is updated via EQDiet Updater
  Delete "$INSTDIR\Data\VersionNumber.txt"
  Delete "$INSTDIR\Data\Version.txt"

  Delete "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Website.lnk"
  Delete "$DESKTOP\EQDiet.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\EQDiet.lnk"

  RMDir "$SMPROGRAMS\$ICONS_GROUP"
  RMDir /r "$INSTDIR\Java"
  RMDir /r "$INSTDIR\Data"
  RMDir /r "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKCU "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd