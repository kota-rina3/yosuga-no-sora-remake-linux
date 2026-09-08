import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import entryNapi from 'libentry.so';

const TAG: string = 'YosugaOHOS';
const DOMAIN: number = 0x0000;

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'EntryAbility onCreate');
    // Give the native side the ability context (rawfile access) and the
    // sandbox files directory before the game page appears.
    entryNapi.initResourceManager(this.context, this.context.filesDir);
  }

  onDestroy(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'EntryAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'EntryAbility onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, TAG, 'Failed to load content: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'Succeeded in loading content');
    });
    windowStage.getMainWindow().then((mainWindow: window.Window) => {
      // The ability is declared landscape in module.json5, so no runtime
      // rotation is needed (runtime rotation froze the UI thread on first
      // launches with the screen locked).
      // Fully immersive on every page: edge-to-edge layout with BOTH bars
      // hidden (no white status strip, no bottom black strip).
      mainWindow.setWindowLayoutFullScreen(true);
      mainWindow.setWindowSystemBarEnable([]);
      // NOTE: do NOT resize the window into a floating window at startup.
      // On the HarmonyOS PC (2-in-1) Beta1 EMULATOR any window-size change
      // that involves a floating window segfaults inside the ArkUI framework
      // itself (libace_compatible.z.so +0x2b939d0, fault addr=0, UI thread,
      // no app frames in the stack - captured by our crash handler on
      // builds 37103..37106 across startup, maximize and restore paths).
      // The maximized-window default is the only stable window mode on this
      // system; the in-game fullscreen toggle stays functional as a
      // compositor-level immersive switch.
    }).catch((err: Error) => {
      hilog.error(DOMAIN, TAG, 'Failed to configure main window: %{public}s', JSON.stringify(err));
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'EntryAbility onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'EntryAbility onForeground');
  }

  onBackground(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'EntryAbility onBackground');
  }
}
