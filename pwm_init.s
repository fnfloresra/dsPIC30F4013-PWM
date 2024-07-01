 ; File: pwm.s
    
.section    .text, code
.global	_initPWM

_initPWM:
    ; Timer3 Configuration
    
    MOV #0x0020, W0          ; Select internal clock (Fosc/4) and prescaler 1:8
    MOV W0, T3CON            ; Load T3CON register
    MOV #0x1388, W0          ; Load PR3 with 5000 for 5 kHz frequency (assuming Fosc = 20 MHz)
    MOV W0, PR3              ; Load PR3 register
    CLR TMR3                 ; Clear Timer3 register
    MOV W0, 0x1000
    MOV T3CON, W0	    ; Start Timer3
    
 ; Output Compare Configuration
    MOV #0x0006, W0          ; Set OCxCON: PWM mode with Timer3 as time base
    MOV W0, OC1CON           ; Load OC1CON register
    MOV #0x09C4, W0          ; Set OC1R to 50% duty cycle (initially)
    MOV W0, OC1R             ; Load OC1R register
    MOV #0x09C4, W0          ; Set OC1RS to 50% duty cycle (initially)
    MOV W0, OC1RS            ; Load OC1RS register
    
    RETURN