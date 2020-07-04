extends Node2D

onready var dialogBox = $DialogBox

var texts = {
	"intro" : [
		"So this is it.", 
		"This is the house John told me about.", 
		"He told me the owner is an old, innocent woman.", 
		"I'll make a good buck with this one, I'm sure.", 
		"This place is creepy as hell... I'll make it a quick job."
		],
	"seen_house" : [
		"Man, look at this!", 
		"This house is old and really busted!", 
		"Horror movie material, for sure.", 
		"You really can't make this shit up haha.", 
		"Let's go inside."],
	"entered_kitchen" : [
		"Woman: Hello dear, welcome to my house.",
		"Hey there. You should be Susane, right?",
		"Woman: Yes, that is me indeed.",
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
		"Thanks. So let's begin: Can you describe the problem?",
		"SUSANE: Oh, I don't really know what's happening. Sometimes I hear some strange noises coming out of the sinks.",
		"SUSANE: Sometimes, the water smells weird and tastes like garbage.",
		"When did it start?",
		"SUSANE: A couple of months ago. But it wasn't that bad at the beginning, so that's why I took so long to call John.",
		"And where does it happen?",
		"SUSANE: All around the house, really. Here, in the kitchen, but also in the bathroom. And the basement is just awful.",
		"Ok, and there's where the whater pump is, right?",
		"SUSANE: Exactly. I haven't gone there for weeks now, though. The smell is unbearable for me.",
		"Sure, I understand perfectly. Well, I'll check the sinks and the basement.",
		"With a problem this big, it won't be cheap for you though, miss.",
		"SUSANE: I see. I'm fine with that. But please, just make it stop. I can't take it anymore."
	
		]
}


func startDialog(text_list) :
	dialogBox.startDialog(text_list)
