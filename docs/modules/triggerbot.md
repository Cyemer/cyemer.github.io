# TriggerBot

TriggerBot is a generic combat module that automatically attacks entities when your crosshair is aimed at them. This means it should be paired with [**AimAssist**](https://cyemer.github.io/docs_site/modules/aimassist.md), or if the user is skilled enough they can aim manually.

## Features & Settings

The module comes with a variety of settings to fine-tune how "blatant" or "legit" you want the attacks to be.

## targeting
*   **Ignore Friends**: Prevents the bot from attacking players added to your Friend Manager.
*   **Ignore Shields**: If the target is blocking with a shield, the bot will stop attacking to prevent wasting durability/cooldown.
*   **Only on LMB**: The bot will only active while you are holding down your attack key (Left Mouse Button).
    *   *Recommended for legit play to prevent accidentally hitting players while walking around.*

## Timing & Logic
*   **Crit Prio**: Smart critical hit logic. The bot waits until you can crit if you are falling.
    *   *Note: This automatically disables itself if you are in webs, water, or climbing ladders.*
*   **Cooldown %**: Determines how fully charged your attack indicator must be before swinging. 100% is standard 1.9+ combat, however, 90% is superior as you can still crit, but it is faster than waiting for 100%. 
*   **TPS Sync**: Syncs attacks to the server tick rather than the client framerate. This helps register hits more consistently on laggy servers. Hits may appear to be slighly delayed (not very noticable in a fight).

### Item Filtering
*   **Only Weapons**: Ensures you only attack when holding a weapon (Sword, Axe, Trident, Mace).
*   **Slot Restriction**: Forces the bot to only work if you have a specific hotbar slot selected (1-9).

### Humanization
*   **Randomization**: Enables a random delay offset for attacks.
*   **Random Delay (ms)**: The maximum amount of time (in milliseconds) to delay the attack.

!!! tip "Legit Configuration"
    If you are playing on a server with a powerful heuristic anticheat (like Polar), you want to have delay time on so it is harder to detect.

!!! warning "Shield Logic"
    If **Ignore Shields** is enabled, it will appear very blatant as you automatically hit as they lower their shield, which normal players do not do.
