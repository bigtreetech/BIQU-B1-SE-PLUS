T0 P0
G91                     ; relative positioning
G1 H2 Z5 F6000          ; lift Z relative to current position
G1 H1 X-240 Y-240 U240 F6000 ; move quickly to X and Y axis endstops and stop there (first pass)
G1 H2 X5 Y5 U-5 F6000       ; go back a few mm
G1 H1 X-240 Y-240 U240 F360  ; move slowly to X and Y axis endstops once more (second pass)
G1 X160 Y160 F6000
G30
G1 Z5 
T1
G30 S-2
G1 Z5
T0
M500