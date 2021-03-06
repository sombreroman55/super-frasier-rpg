; Displays green screen
;
; ca65 green.s
; ld65 -C lorom128.cfg -o green.smc green.o

.define ROM_NAME "GREEN"
.include "test.inc"

reset:
    init_cpu

    ; Clear PPU registers
    ldx #$33

@loop:
    stz $2100,x
    stz $4200,x
    dex
    bpl @loop

    lda #$12
    sta $2122
    lda #$24
    sta $2122

    ; Maximum screen brightness
    lda #$0F
    sta $2100

forever:
    jmp forever
