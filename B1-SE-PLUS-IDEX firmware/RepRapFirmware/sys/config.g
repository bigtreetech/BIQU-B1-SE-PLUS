; General preferences
G90                                            ; send absolute coordinates...
M83                                            ; ...but relative extruder moves
M550 P"B1-SE-Plus-IDEX"                         ; set printer name
; Network
M552 S0
M586 P0 S0                                     ; enable HTTP
M586 P1 S0                                     ; disable FTP
M586 P2 S0                                     ; disable Telnet

; Drives
M569 P0 S0                                     ; physical drive 0 goes forwards using default driver timings
M569 P1 S1                                     ; physical drive 1 goes forwards using default driver timings
M569 P2 S1                                     ; physical drive 2 goes forwards using default driver timings
M569 P3 S0                                     ; physical drive 3 goes forwards using default driver timings
M569 P4 S1                                     ; physical drive 4 goes forwards using default driver timings
M569 P5 S0                                     ; physical drive 5 goes forwards using default driver timings
M584 X0 Y1 Z2 U5 E3:4                          ; set drive mapping
M350 X16 Y16 U16 Z16 E16 I1                    ; configure microstepping with interpolation
M92 X80.00 Y80.00 U64.00 Z400.00 E93.00:93.00  ; set steps per mm
M566 X900.00 Y900.00 U900.00 Z60.00 E120.00    ; set maximum instantaneous speed changes (mm/min)
M203 X12000.00 Y12000.00 U12000.00 Z600.00 E1200.00      ; set maximum speeds (mm/min)
M201 X500.00 Y500.00 U500.00 Z20.00 E250.00    ; set accelerations (mm/s^2)
M906 X800 Y800 U800 Z800 E1200 I30             ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                        ; Set idle timeout

; Axis Limits
M208 X0 Y0 U81 Z-2 S1                           ; set axis minima
M208 X244 Y335 U325 Z332.1 S0                    ; set axis maxima

; Endstops
M574 X1 S1 P"!xstop"                            ; configure active-high endstop for low end on X via pin xstop
M574 U2 S1 P"!zstop"
M574 Y1 S1 P"!ystop"                            ; configure active-high endstop for low end on Y via pin ystop
M574 Z1 S2 P"^probe" 
;M591 D0 P7 C"e0stop" S1  R50:130 L7.0 E10
;M591 D1 P7 C"e1stop" S1  R50:130 L7.0 E10

; Z-Probe
M950 S0 C"PE8"
M950 S1 C"servo0"
M558 P9 C"!^probe" H5 F120 T3000                ; set Z probe type to bltouch and the dive height + speeds

G31 Z0 P500                   ; set Z probe trigger value, offset and trigger height
M557 X0:160 Y10:230 S40                       ; define mesh grid
M376 H10

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B3950 ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bed" T0                              ; create bed heater output on bed and map it to sensor 0
M307 H0 D120 B1 S1.00                        ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                        ; map heated bed to heater 0
M143 H0 S150                                   ; set temperature limit for heater 0 to 150C

; T0
M308 S1 P"e0temp" Y"thermistor" T100000 B3950  ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                           ; create nozzle heater output on e0heat and map it to sensor 1
M301 H1 P21.73 I1.54 D76.55                    ; disable bang-bang mode for the bed heater and set PWM limit
M307 H1 B0 S1.00                               ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S300                                   ; set temperature limit for heater 1 to 300C
; T1
M308 S2 P"e1temp" Y"thermistor" T100000 B3950  ; configure sensor 1 as thermistor on pin e0temp
M950 H2 C"e1heat" T2                           ; create nozzle heater output on e0heat and map it to sensor 1
M301 H2 P21.73 I1.54 D76.55                    ; disable bang-bang mode for the bed heater and set PWM limit
M307 H2 B0 S1.00                               ; disable bang-bang mode for heater  and set PWM limit
M143 H2 S300                                   ; set temperature limit for heater 1 to 300C

; Fans
M950 F0 C"fan0" Q1000                          ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1                                 ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan2" Q1000                          ; create fan 1 on pin fan2 and set its frequency
M106 P1 S0 H-1                                 ; set fan 1 value. Thermostatic control is turned off

; motherboard fan
M950 F2 C"fan1" Q1000
M106 P2 S255 H0 T35

; Tools
M563 P0 D0 H1 F0:1                             ; define tool 0
G10 P0 X0 Y0 Z0 S0 R0                          ; set tool 0 axis offsets

M563 P1 D1 H2 X3 F0:1                       ; define tool 0
G10 P1 Y0 U0 Z0 S0 R0

M563 P2 D0:1 H1:2 X0:3 F0:1 S"COPY" 
G10 P2 X55 Y0 U-55 S0 R0  
M567 P2 E1:1
M563 P3 D0:1 H1:2 X0:3 F0:1 S"MIRROR" 
G10 P3 X-116.2 Y0 U0 S0 R0  
M567 P3 E1:1

; Custom settings are not defined
M552 S1
; Miscellaneous
;M575 P1 S1 B57600                              ; enable support for PanelDue
M575 P1 S2 B57600
M501
M150 X2

T0 P0
M375
