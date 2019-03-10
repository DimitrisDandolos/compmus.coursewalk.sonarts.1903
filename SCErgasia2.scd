(
SynthDef.new(\synth1, {
	arg freq=440, rq=0.2;
	var sig;
	sig = PinkNoise.ar(1!2);
	sig = BPF.ar(
		sig,
		freq.lag(0.5),
		rq.lag(0.5),
		1/rq.sqrt.lag(0.5)
	);
	Out.ar(0, sig);
}).add;
)

(
Window.closeAll;
w = Window("EQ", Rect(750,50,350,150))
.background_(Color(0,0,1,0.3))
.front
.alwaysOnTop_(true);

~slider0 = Slider(w.view, Rect(20,60,150,30))
.background_(Color(1,0,0,1))
.action_({
	arg obj;
	var cf;
	cf = obj.value.linexp(0,1,500,6000).postln;
	if(
		x.isPlaying,
		{x.set(\freq, cf)}
	);
	~numberBox.value_(obj.value.linexp(0,1,500,6000));
});

~slider1 = Slider(w.view, Rect(20,20,150,30))
.background_(Color(1,0,0,1))
.action_({
	arg obj;
	var cf;
	cf = obj.value.linexp(0,1,50,500).postln;
	if(
		x.isPlaying,
		{x.set(\freq, cf)}
	);
	~numberBox1.value_(obj.value.linexp(0,1,50,500));
});

~slider2 = Slider(w.view, Rect(20,100,150,30))
.background_(Color(1,0,0,1))
.action_({
	arg obj;
	var cf;
	cf = obj.value.linexp(0,1,6000,10000).postln;
	if(
		x.isPlaying,
		{x.set(\freq, cf)}
	);
	~numberBox2.value_(obj.value.linexp(0,1,6000,10000));
});

~numberBox = NumberBox(w, Rect(180,60,50,30))
.value_(100)
.clipLo_(500)
.clipHi_(6000)
.font_(Font("italic", 16))
.decimals_(0)
.action_({
	arg obj;
	~slider0.valueAction_(obj.value.explin(500,6000,0,1))
});

~numberBox1 = NumberBox(w, Rect(180,20,50,30))
.value_(50)
.clipLo_(50)
.clipHi_(500)
.font_(Font("italic", 16))
.decimals_(0)
.action_({
	arg obj;
	~slider1.valueAction_(obj.value.explin(50,500,0,1))
});

~numberBox2 = NumberBox(w, Rect(180,100,50,30))
.value_(6000)
.clipLo_(6000)
.clipHi_(10000)
.font_(Font("italic", 16))
.decimals_(0)
.action_({
	arg obj;
	~slider2.valueAction_(obj.value.explin(6000,10000,0,1))
});

~freqLabel = StaticText(w, Rect(180,0,50,20))
.string_("freq")
.font_(Font("italic", 14))
.align_(\center)
.background_(Color.black)
.stringColor_(Color.red);

~qLabel = StaticText(w, Rect(231,0,50,20))
.string_("Q")
.font_(Font("italic", 14))
.align_(\center)
.background_(Color.black)
.stringColor_(Color.red);

~knob = Knob(w, Rect(240,60,30,30))
.action_({
	arg obj;
	var qual;
	qual = obj.value.linexp(0,1,1,100).reciprocal;
	if(
		x.isPlaying,
		{x.set(\rq, qual)}
	);
});

~button = Button(w, Rect(290,20,50,30))
.states_([
	["OFF", Color.black, Color.red],
	["ON", Color.white, Color.green]
])
.font_(Font("italic", 18))
.action_({
	arg obj;
	if(
		obj.value == 1,
		{
			x = Synth.new(
				\synth1,
				[
					\freq, ~slider0.value.linexp(0,1,500,6000),
					\rq, ~knob.value.linexp(0,1,1,100).reciprocal
				]
			).register;
		},
		{x.free}
	);
})
)
(
x = Synth.new(
	\synth1,
	{[
		\freq, ~slider0.value.linexp(0,1,500,6000),
		\freq, ~slider1.value.linexp(0,1,50,6000),
		\freq, ~slider2.value.linexp(0,1,6000,10000)
	]}
);
)