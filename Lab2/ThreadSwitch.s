		AREA    |.text|, CODE, READONLY, ALIGN=2
		THUMB		        
		EXPORT PendSV_Handler      
		EXTERN RunPt
		EXTERN NextPt
			
;Round-Robin Switching			
;PendSV_Handler 
;	CPSID I
;	PUSH {R4 - R11}
;	LDR R0, =RunPt
;	LDR R1, [R0]
;	STR SP, [R1]
;	LDR R1, [R1, #4]
;	STR R1, [R0]
;	LDR SP, [R1]
;	POP {R4 - R11}
;	CPSIE I
;	BX LR
;	END
	
;switch using chosen NextPt
PendSV_Handler
	CPSID I
	PUSH {R4 - R11}
	LDR R0, =RunPt
	LDR R1, [R0]
	STR SP, [R1]
	LDR R1, =NextPt
	LDR R2, [R1]
	STR R2, [R0]
	LDR SP, [R2]
	POP {R4 - R11}
	CPSIE I
	BX LR
	END
		