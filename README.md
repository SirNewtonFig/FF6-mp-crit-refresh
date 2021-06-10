# FF6 MPcrit Refresh

by Sir Newton Fig

sirnewtonfig@gmail.com

## Contents

1) Description
2) Files
3) Technical Bits

## 1) Description

Typically, when using a weapon that consumes MP for automatic critical hits (think Punisher, Ogre Nix, Ragnarok, etc), the spell availability of the wielder does not refresh correctly after their attack resolves and their MP updates. This can cause them to be able to select a spell to cast that they cannot actually afford anymore, which is inconsistent with how the game handles a lack of MP normally. This behaviour is especially noticeable if you have a source of counter-attack, such as a Black Belt, as the attack that depletes your MP could happen while you are browsing for a spell to cast!

This Patch fixes this by performing the same operation that would happen after receiving any other source of MP damage (or healing). It makes you unable to select spells that you cannot afford to cast after an MP-crit attack. It does not, however, refresh the text of the open Magic/Lore menus (neither do other MP-affecting effects), so spells will still appear castable that you cannot cast anymore, even though you cannot select them.

I tried to fix that too, but got a little lost – so if anyone has any ideas, feel free to take this patch and run with it.

## 2) Files
```
  |- BNW/
  |   |- asm/...
  |   |- ips/...
  |
  |- FF6/
      |- asm/...
      |- ips/...
```

Headered and non-headered versions of the ips patches are provided, in addition to the original asm source. Both a vanilla FF6 version and BNW-compatible version are provided, as the MP-crit routine varies slightly between the two.


## 3) Technical Bits

There is an unused special weapon effect in FF6 that is identical to the regular MP-crit property that is used on various weapons – its only difference is that it costs 16MP more for whatever reason. This patch re-points that special effect to the exact same location as the regular MP-crit effect, making them completely identical, and steals the bytes it originally occupied to call the spell list refresh routine after the main MP-crit stuff is done. If your hack uses this second MP-crit property (or repurposes it for something else), then you'll want to move some stuff in this patch to free space instead.
