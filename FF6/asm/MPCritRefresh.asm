hirom
; header

org $C23F64                   ; The RTS for the Pearl Wind routine that immediately follows
Return:                       ; the Ogre Nix/MP Crit routine
  RTS

org $C242FF
  dw #$3F22                   ; Make the other (unused?) MP Crit routine identical to the main
                              ; one – we're gonna steal its bytes.

org $C23F2A
  BNE Return                  ; Exit function if "No Critical and Ignore True Knight" is set

org $C23F2F
  BEQ Return                  ; Exit function if no targets

org $C23F43
  BCC Return                  ; Exit function if weapon would drain more MP than the wielder currently has

org $C23F4F                   ; This is after MP gets updated on an MP Crit
  rep 2 : LSR                 ; Shift #$0200 -> #$0080
  JMP $464C                   ; Set bit on $3204,Y and return
