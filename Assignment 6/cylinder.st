Shape subclass: Cylinder [
	| radius height |

	Cylinder class >> new: cylName radius: cylinderRadius height: cylinderHeight [
		<category: 'instance creation'>
		| r |
		r := super new.
		r init: cylName radius: cylinderRadius height: cylinderHeight.
		^r
	]

	init: cylName radius: cylinderRadius height: cylinderHeight [
		<category: 'initalization'>
		super init: cylName.
		radius := cylinderRadius.
		height := cylinderHeight
	]

	Cylinder >> getArea [
		^ (2.00 * Float pi * radius * (radius + height) asFloat)
	]

	Cylinder >> getVolume [
		^ (Float pi * radius squared * height)
	]

	Cylinder >> getInfo [
		| ss |
		ss := WriteStream on: (String new: 200).
		ss nextPutAll: 'Cylinder: ', self getName, ', Radius=', (radius asFloat) asString, ', Height=', (height asFloat) asString.
		ss nl.
		ss tab.
		ss nextPutAll: ' Surface Area: ', (self getArea) asString, ', Volume: ', (self getVolume) asString.
		^ (ss contents)
	]
	
    Cylinder >> test: cond [
		| type op value shape subs trueVal i |
		shape := 'cylinder'.

		i := 1.
		[ i <= cond size ] whileTrue: [
			| subs |
			subs := (cond at: i) substrings.
			type := subs at: 1.
			op := subs at: 2. 
			value := subs at: 3.

			(type = 'type') ifTrue: [
				(op = '==') ifTrue: [
					value ~= 'cylinder' ifTrue: [
						^ false
					].
				].
				(op = '!=') ifTrue: [
					value = 'cylinder' ifTrue: [
						^ false
					].
				]. 
				(op = '>=') ifTrue: [
					shape < value ifTrue: [
						^ false
					].
				].
				(op = '<=') ifTrue: [
					shape > value ifTrue: [
						^ false
					].
				].
				(op = '>') ifTrue: [
					shape <= value ifTrue: [
						^ false
					].
				].
				(op = '<') ifTrue: [
					shape >= value ifTrue: [
						^ false
					].
				].
			].
			(type = 'area') ifTrue: [
                | area |
				area := (self getArea) asNumber.
				trueVal := value asNumber.

				(op = '==') ifTrue: [
					area ~= trueVal ifTrue: [
						^ false
					].
				].
				(op = '!=') ifTrue: [
					area = trueVal ifTrue: [
						^ false
					].
				].
				(op = '>=') ifTrue: [
					area < trueVal ifTrue: [
						^ false
					].
				].
				(op = '<=') ifTrue: [
					area > trueVal ifTrue: [
						^ false
					].
				].
				(op = '>') ifTrue: [
					area <= trueVal ifTrue: [
						^ false
					].
				].
				(op = '<') ifTrue: [
					area >= trueVal ifTrue: [
						^ false
					].
				].
			].
			(type = 'volume') ifTrue: [
				| vol |
				vol := (self getVolume) asNumber.
				trueVal := value asNumber.

				(op = '==') ifTrue: [
					vol ~= trueVal ifTrue: [
						^ false
					].
				].
				(op = '!=') ifTrue: [
					vol = trueVal ifTrue: [
						^ false
					].
				].
				(op = '>=') ifTrue: [
					vol < trueVal ifTrue: [
						^ false
					].
				].
				(op = '<=') ifTrue: [
					vol > trueVal ifTrue: [
						^ false
					].
				].
				(op = '>') ifTrue: [
					vol <= trueVal ifTrue: [
						^ false
					].
				].
				(op = '<') ifTrue: [
					vol >= trueVal ifTrue: [
						^ false
					].
				].
            ].

			i := i + 1.
		].

		^ true
	]
]