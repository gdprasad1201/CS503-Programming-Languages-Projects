Shape subclass: Torus [
	| smallRadius bigRadius |

	Torus class >> new: torusName smallRadius: smallR bigRadius: bigR [
		<category: 'instance creation'>
		| r |
		r := super new.
		r init: torusName smallRadius: smallR bigRadius: bigR.
		^r
	]

	init: torusName smallRadius: smallR bigRadius: bigR [
		<category: 'initalization'>
		super init: torusName.
		smallRadius := smallR.
		bigRadius := bigR
	]

	Torus >> getArea [
		^ ((4 asFloat) * ((Float pi) squared) * bigRadius * smallRadius)
	]

	Torus >> getVolume [
		^ (((Float pi) squared) * (smallRadius squared) * 2 * bigRadius)
	]

	Torus >> getInfo [
		| ss |
		ss := WriteStream on: (String new: 100).
		ss nextPutAll: 'Torus: ', self getName, ', Small Radius=', (smallRadius asFloat) asString, ', Big Radius=', (bigRadius asFloat) asString.
		ss nl.
		ss tab.
		ss nextPutAll: ' Surface Area: ', (self getArea) asString, ', Volume: ', (self getVolume) asString.
		^ (ss contents)
	]

	Torus >> test: cond [
		| type op value shape subs trueVal i |
		shape := 'torus'.

		i := 1.
		[ i <= cond size ] whileTrue: [
			| subs |
			subs := (cond at: i) substrings.
			type := subs at: 1.
			op := subs at: 2. 
			value := subs at: 3.
                        
			(type = 'type') ifTrue: [
				(op = '==') ifTrue: [
					value ~= 'torus' ifTrue: [
						^ false
					].
				].
				(op = '!=') ifTrue: [
					value = 'torus' ifTrue: [
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
