## 
## LIBRARY OF CONVERSION FUNCTIONS FOR HW8
##

## START FUNCTION MILES2KILOMETERS
.global miles2kilometers
.text
miles2kilometers:

    ## CONVERT MILES TO KILOMETERS
    ##
    ## ARGUMENTS: 
    ## r0 ~ int miles
    ##
    ## RETURNS:
    ## r0 ~ int kilometers
    ## 
    ## FUNCTION:
    ## => km = 1.60934 * miles
    ##
    ## To maintain higher precision, we perform operations
    ## using integer values by first multiplying by 161
    ## and then dividing by 100. Division further reduces 
    ## precision so we perform that operation last. 
    ## We could increase precision by increasing the number
    ## of significant digits used in the conversion and
    ## increase the order of magnitude of the opperands
    ## correspondingly. 

    ## PUSH STACK
    SUB sp, sp, #4
    STR lr, [sp]

    ## MULTIPLY BY 161
    MOV r1, #161
    MUL r0, r0, r1

    ## DIVIDE BY 100
    MOV r1, #100
    BL __aeabi_idiv

    ## POP STACK AND RETURN
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
## END miles2kilometers


## START FUNCTION KPH
.global kph
.text
kph:

    ## CONVERT HOURS AND MILES TO KILOMETERS PER HOUR
    ##
    ## ARGUMENTS:
    ## r0 ~ int hours
    ## r1 ~ int miles
    ## 
    ## RETURNS:
    ## r0 ~ int kilometers per hour
    ##
    ## FUNCTION:
    ## => miles2kilometers(miles) / hours

    ## PUSH STACK
    SUB sp, sp, #4
    STR lr, [sp]

    ## CALL miles2kilometers 
    MOV r5, r0
    MOV r0, r1
    BL miles2kilometers

    ## DIVIDE KILOMETERS BY HOURS
    MOV r1, r5
    BL __aeabi_idiv

    ## POP STACK AND RETURN
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
## END kph


## START FUNCTION CELSIUS2FAHRENHEIT
.global celsius2fahrenheit
.text
celsius2fahrenheit: 

    ## CONVERT DEGREES CELSIUS TO DEGREES FAHRENHEIT
    ## 
    ## ARGUMENTS:
    ## r0 ~ int degrees celsius
    ## 
    ## RETURNS: 
    ## r0 ~ int degrees fahrenheit
    ##
    ## FUNCTION:
    ## => F = (c * 9/5) + 32

    ## PUSH STACK
    SUB sp, sp, #4
    STR lr, [sp]
    
    ## MULTIPLY DEG C BY 9
    MOV r1, #9
    MUL r0, r0, r1

    ## DIVIDE RESULT BY 5
    MOV r1, #5
    BL __aeabi_idiv

    ## ADD 32
    ADD r0, r0, #32

    ## POP STACK AND RETURN
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
## END celsius2fahrenheit



## START FUNCTION INCHES2FEET
.global inches2feet
.text
inches2feet:

    ## CONVERT INCHES TO FEET AND REMAINDER INCHES
    ## 
    ## ARGUMENTS:
    ## r0 ~ int inches
    ## 
    ## RETURNS:
    ## r0 ~ int feet
    ## r1 ~ int inches remaining
    ## 
    ## FUNCTION
    ## => feet = floor(inches / 12)
    ## => remainder_inches = inches - (feet*12)

    ## PUSH STACK 
    SUB sp, sp, #4
    STR lr, [sp]

    ## SAVE THE INITIAL NUMBER OF INCHES
    MOV r5, r0

    ## COMPUTE THE NUMBER OF FEET IN r0
    MOV r1, #12
    BL __aeabi_idiv

    ## GET THE NUMBER OF INCHES IN THOSE FEET
    MUL r2, r0, r1

    ## GET THE NUMBER OF REMAINING INCHES
    SUB r1, r5, r2

    ## POP STACK AND RETURN
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
## END inches2feet


