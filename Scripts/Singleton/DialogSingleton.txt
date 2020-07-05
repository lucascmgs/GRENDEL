extends Node2D

onready var dialogBox = $DialogBox

var is_displaying = false

var texts = {
	"intro" : [
		"(So this is it.)", 
		"(This is the house John told me about.)", 
		"(He told me the owner is an old, innocent woman.)", 
		"(I'll make a good buck with this one, I'm sure.)", 
		"(This place is creepy as hell... I'll make it a quick job.)"
		],
	"seen_house" : [
		"(Man, look at this!)", 
		"(This house is old and really busted!)", 
		"(Horror movie material, for sure.)", 
		"(You really can't make this shit up haha.)", 
		"(Let's go inside.)"
		],
	"entered_kitchen" : [
		"WOMAN: Hello dear, welcome to my house.",
		"Hey there. You should be Susane, right?",
		"WOMAN: Yes, that is me indeed.",
		"Cool. Er... do you live alone here?",
		"SUSANE: Well, yes, it's just me.",
		"SUSANE: My son used to live here with me, but he disappeared, years ago.",
		"SUSANE: I miss him so much. He used to help me with all the housework.",
		"(Like I care)",
		"Oh, It's so sad to hear that.",
		"Well, I was told you had a problem with your piping system, is that right?",
		"SUSANE: Yes, and my son isn't here to take care of things anymore, so I called John.",
		"Right, and he was busy with another client, so that's why I'm here!",
		"SUSANE: I'm glad you are.",
		"Thanks. So let's begin. Can you describe the problem?",
		"SUSANE: Oh, I don't really know what's happening. Sometimes I hear strange noises coming out of the sinks.",
		"SUSANE: Sometimes, the water smells weird and tastes like weirder.",
		"When did it start?",
		"SUSANE: A couple of months ago. But it wasn't that bad at the beginning, so that's why I took so long to call John.",
		"And where does it happen?",
		"SUSANE: All around the house, really. Here, in the kitchen, but also in the bathroom. And the basement is just awful.",
		"Ok, and there's where the whater pump is, right?",
		"SUSANE: Exactly. I haven't gone there for weeks now, though. The smell is unbearable for me.",
		"Sure, I understand perfectly. Well, I'll check the sinks and the basement.",
		"With a problem this big, it won't be cheap for you though, miss.",
		"SUSANE: I see. I'm fine with that. But please, just make it stop. I can't take it anymore."
		],
		"interact_kitchen_sink" : [
		"(Let's see what we have here.)",
		"(Well, everything seems ok.)",
		"(No noticeable dripping, water flux looks normal.)",
		"(I can sense a faint smell coming out of it though.)",
		"(It's probably just due to accumulated food residue.)",
		"(I'll apply a cleaning product and it should be fine.)"
		],
		"interact_bathroom_sink" : [
		"(Well, this one is working fine too.)",
		"(This is gonna cost her a lot, and I haven't even done anything besides using caustic soda hahaha.)",
		"(But wait...)",
		"(There's something weird in here.)",
		"(It's that smell again.)",
		"(The more I smell it, the more intense it becomes, yet I cannot describe it completely.)",
		"(I's something like... Rotting metal?)",
		"(That's impossible, though. Metal doesn't really \"rot\".)",
		"(On top of that, everything in this bathroom is made of ceramic or wood.)",
		"(There must be something really messed up going on with the pipes.)",
		"(I'll just apply the cleaning product again for now and go back to Susane.)"
		],
		"interact_photograph" : [
		"(There's a picture here.)",
		"(This must be Susane and her son.)",
		"(Unlike the rest of the corridor, this part is dusty and full of cobwebs.)",
		"(They look happy in the photograph. Both seem young, too! Her son must only be a teen in it.)",
		"(He's wearing a pair of earrings, each resembling a cross.)",
		"(She mentioned he disappeared years ago. What the hell happened to that kid?)"
		],
		"report_to_suzane" : [
		"Ok, so I've checked both sinks.",
		"SUSANE: Oh, and did you figure the cause of the problem out?",
		"Not really. I used a product to mitigate the smell a little, but the cause is elsewhere.",
		"SUSANE: I see. Maybe it's coming from the basement?",
		"Yeah, it's probably from there.",
		"SUSANE: The entrance to the basement is in my bedroom. Please, take the door on the right.",
		"Alright, let's go take a look."
		],
		"arrived_at_bedroom" : [
			"Hey, the smell's strong here!",
			"SUSANE: Is it, really? I think I'm getting used to it, so I don't always notice.",
			"SUSANE: When I do notice, though, it seems familiar. Like an old, known smell.",
			"SUSANE: It really creeps me out.",
			"(This is beginning to get weird)",
			"Ok, so even more reason for me to fix this mess.",
			"SUSANE: Right. The entrance to the basement is right behind my bed.",
			"Ok, I'll go check it out. Wait here, I got it.",
			"SUSANE: Call me if you need anything, dear."
		],
		"arrived_at_basement" : [
			"(What the hell. The smell is straight up oppressive here.)",
			"(I wonder how was Susane able to sleep next to the entrance for so long.)",
			"(Let's get this over with.)"
		],
		"interact_pipe" : [
			"(Oh my god!)",
			"(There's a hole in the pipe, and a big one at that.)",
			"(I don't have any idea what kind of... Creature could do this.)",
			"(What's more, it seems it was done from the inside of the pipe.)",
			"(It sure isn't the cause of the smell, even though it's stronger here.)",
			"(There must be something deeper in the piping system causing it. Probably a dead animal.)",
			"(Anyway, the only thing I can do for now is change this part of the pipe altogether.)",
			"(I'll need to get a replacement at my truck, so let's go.)"
		],
		"interact_pump" : [
			"(This is the water pump.)",
			"(It seems to be working fine, the water pressure is alright.)",
			"(The problem must be elsewhere.)"
		],
		"interact_grid":[
			"(Hey, what's that?)",
			"(There's something among the waste.)",
			"(Looks like an earring of some sort. Have I seen it before?)",
			"(Wait, I think I could... Yeah, I can definetly grab it if I use my finger.)",
			"(Got it. I'll keep it to show to Susane. Maybe I'll even get a reward.)"
		],
		"came_out_of_basement" :[
			"(Hey, where's Susane?)",
			"(I thought she would wait for me here.)",
			"(Heh, maybe she went to grab a coffee or something.)"
		],
		"came_out_of_bedroom" : [
			"(She isn't here either. Maybe she's using the toilet.)"
		],
		"got_replacement" : [
			"(This should be the same kind of pipe.)",
			"(I should go back and change it.)",
			"(I've got a strange feeling. I hope Susane is ok.)"
		]
}


func startDialog(text_list) :
	is_displaying = true
	dialogBox.startDialog(text_list)
