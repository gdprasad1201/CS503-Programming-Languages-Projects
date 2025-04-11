Shape subclass: Box [
	| length width height |

	Box class >> new: boxName length: boxLength width: boxWidth height: boxHeight [
		<category: 'instance creation'>
		| r |
		r := super new.
		r init: boxName length: boxLength width: boxWidth height: boxHeight.
		^r
	]

	init: boxName length: boxLength width: boxWidth height: boxHeight[
		<category: 'initalization'>
		super init: boxName.
		length:= boxLength.
		width:= boxWidth.
		height:= boxHeight.
	]

	Box >> getArea [
		^ (2.00 * ((length * width) + (length * height) + (width * height)) asFloat)
	]

	Box >> getVolume [
		^ (length * width * height).
	]

	Box >> getInfo [
		| ss |
		ss := WriteStream on: (String new: 200).
		ss nextPutAll: 'Box: ', self getName, ', Length=', (length asFloat) asString, ', Width=', (width asFloat) asString, ', Height=', (height asFloat) asString.
		ss nl.
		ss tab.
		ss nextPutAll: ' Surface Area: ', (self getArea) asString, ', Volume: ', (self getVolume) asString.
		^ (ss contents)	
	]

	Box >> test: cond [
		| type op value shape subs trueVal i |
		shape := 'box'.

		i := 1.
		[ i <= cond size ] whileTrue: [
			| subs |
			subs := (cond at: i) substrings.
			type := subs at: 1.
			op := subs at: 2. 
			value := subs at: 3.

			(type = 'type') ifTrue: [
				(op = '==') ifTrue: [
					value ~= 'box' ifTrue: [
						^ false
					].
				].
				(op = '!=') ifTrue: [
					value = 'box' ifTrue: [
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