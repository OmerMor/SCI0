(script# ORBIT)


(class Orbit kindof Motion
; Orbit about the screen.  This motion never terminates.
;
; Usage:
;			(anActor setMotion: 
;							Orbit			;class Orbit or an instance of it
;							
;							theCtrObj	;some object with x and y properties
;							theRadius	;of the orbit
;							theXTilt		;counterclockwise from x-axis in degrees
;							theYTilt		;same from y-axis
;							theStep		;in degrees, default is 10
;							theWinding	;clockwise=1 counterclockwise=-1
;							theAngle		;0=north, etc.
;			)
;			
;			Global variable "perspective" is taken into account
	
	(properties
		centerObj	0			;center x and y are properties
		radius		50
		xTilt			0			;0=flat circular view 90=edge-on
		yTilt			0			;0=flat circular view 90=edge-on
		angleStep	10			;angle degree increment per animation cycle
		winding		1			;clockwise=1 counterclockwise=-1
		curAngle		0			;0=north, etc.
	)
	
	(methods
		initStep
	)
	
	(method 
		(init theObj theCtrObj theRadius theXTilt theYTilt
			theStep theWinding theAngle)
		
		(= client		theObj)
		(= centerObj	(if (> argc 1) theCtrObj))		
		(= radius		(if (> argc 2) theRadius	else (/ SCRNHIGH 3)))
		(= xTilt 		(if (> argc 3) theXTilt		else 0))
		(= yTilt 		(if (> argc 4) theYTilt		else 0))
		(= angleStep	(if (> argc 5) theStep		else 10))
		(= winding 		(if (> argc 6) theWinding	else 1))
		(= curAngle 	(if (> argc 7) theAngle		else 0))
		
		(self initStep:)
	)
	
	(method (initStep 
			&tmp centerX centerY deltaX deltaY
		;	mainHeading 
		;	mainSpeed
		;	mainXStep mainYStep
		)
		
		(if centerObj
			(= centerX (centerObj x?))						;track a moving center
			(= centerY (centerObj y?))
		;	(= mainHeading (centerObj heading?))
		;	(= mainSpeed (centerObj moveSpeed?))
		;	(= mainXStep (centerObj xStep?))
		;	(= mainYStep (centerObj yStep?))
		else
			(= centerX (/ SCRNWIDE 2))						;or use screen center
			(= centerY (/ SCRNHIGH 2))
		;	(= mainHeading 0)
		;	(= mainSpeed 0)
		;	(= mainXStep 2)
		;	(= mainYStep 3)
		)
		
		(= deltaX (SinMult curAngle radius))
		(= deltaY 
			(CosMult (+ yTilt perspective)
				(CosMult curAngle radius)
			)
		)
		(if xTilt
			(=  deltaX	(CosMult xTilt deltaX))
			(+= deltaY	(SinMult xTilt deltaX))
		)
		
	;	(if (<= 
	;			(Abs (- (client heading?) mainHeading))
	;			90)
	;		;; same direction: catching up
	;		;			(client xStep: (* mainXStep 2))
	;		;			(client yStep: (* mainYStep 2))
	;		(client moveSpeed: (/ mainSpeed 2))	;reduce delay to speed up
	;		(+= deltaX mainXStep)
	;		(+= deltaY mainYStep)
	;	else
	;		;; opposite direction: zipping by
	;		;			(client xStep: (/ mainXStep 2))
	;		;			(client yStep: (/ mainYStep 2))
	;		(client moveSpeed: (* mainSpeed 2))	;increase delay to slow down
	;		(-= deltaX mainXStep)
	;		(-= deltaY mainYStep)
	;	)
		
		(= x 	(+ centerX deltaX))								;compute destination
		(= y	(-	centerY deltaY))
		
		(= curAngle 
			(mod (+ curAngle (* winding angleStep)) 	;angle for next step
				360
			)
		)
		
		(super init: client x y)							;Initialize the motion
		
	)
	
	(method (moveDone)
		(self initStep:)		;proceed with next step
	)
)