# Legiões do Eclipse — DREAM Build Kit

Este pacote usa a build `DREAM REFORGED FIX1` como código do jogo.

## Windows
A pasta `desktop/` empacota o jogo com Electron.
No Windows, execute:

```powershell
cd desktop
.\build-windows.ps1
```

Saída esperada: `desktop\dist\Legioes-do-Eclipse-DREAM-0.1.0.exe`

## Android
A pasta `android/` é um aplicativo Android nativo que abre o jogo localmente em uma WebView, em tela cheia e paisagem.

Com Android Studio/SDK e Gradle configurados:

```powershell
cd android
.\build-android.ps1
```

Saída esperada: `android\app\build\outputs\apk\debug\app-debug.apk`

## Compilação automática pelo GitHub
O arquivo `.github/workflows/build.yml` compila os dois formatos:
- Windows: EXE portátil
- Android: APK debug instalável

Ao subir este pacote para um repositório GitHub e executar a Action `Build DREAM EXE and APK`, os dois binários ficam disponíveis como Artifacts.
