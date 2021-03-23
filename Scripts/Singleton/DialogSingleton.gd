extends Node2D

onready var dialogBox = $DialogBox

var is_displaying = false
var texts = {}

var texts_ptbr = {
	"intro" : [
		"(Então é aqui)", 
		"(Essa é a casa que o John me falou)", 
		"(Ele disse que a dona é uma moça velha e ingênua)", 
		"(Vou conseguir uma grana boa aqui, com certeza)", 
		"(Esse lugar é macabro... Vou tentar ser rápido)"
		],
	"check_truck" : [
		"(Meu velho caminhão. Ele já esteve melhor. Já esteve pior também. Bem, deixa pra lá.)"
	],
	"seen_house" : [
		"(Cara, olha isso aqui!)", 
		"(Esse casebre tá caindo aos pedaços!)", 
		"(Coisa de filme de terror, pode crer)", 
		"(Dá nem pra inventar uma coisa dessas)", 
		"(Bom, vamos entrar)"
		],
	"entered_kitchen" : [
		"MOÇA: Olá querido, seja bem vindo.",
		"Opa, olá. Você é a... Susane, né?",
		"MOÇA: Sim, sou eu mesma.",
		"Maneiro. Hã... você mora sozinha aqui?",
		"SUSANE: Bom, sim, sou apenas eu.",
		"SUSANE: Meu filho morava aqui comigo, mas ele... ele não está mais por aqui.",
		"SUSANE: Sinto tanta falta dele. Ele me ajudava com as tarefas da casa.",
		"(Como se eu me importasse)",
		"Ah, sinto muito em ouvir isso.",
		"Bem, me disseram que você tem um problema no seu encanamento, é isso mesmo?",
		"SUSANE: Sim, normalmente meu filho resolveria isso para mim, mas... então, eu chamei o John.",
		"Certo, e ele ficou ocupado com outro cliente, por isso que estou aqui!",
		"SUSANE: Estou feliz que está aqui.",
		"Obrigado. Então, vamos começar. Me conta qual é o problema.",
		"SUSANE: Ah, eu não sei direito o que está acontecendo. Às vezes, escuto barulhos estranhos na pia.",
		"SUSANE: Às vezes a água fica com um gosto e cheiro esquisitos.",
		"E quando isso começou?",
		"SUSANE: Há alguns meses. Não era tão ruim assim no começo. Mas agora tive que ligar para o John.",
		"E onde esse problema acontece?",
		"SUSANE: Por toda a casa. Aqui na cozinha, no banheiro. E olha, o porão está terrível.",
		"Certo. E é lá que fica a bomba hidráulica, né?",
		"SUSANE: Exatamente, tem semanas que não desço lá. O cheiro ficou insuportável para mim.",
		"Eu entendo Perfeitamente. Bom, vou checar as pias e depois desço pro porão.",
		"Vou ser sincero senhora. Com um problema desse tamanho, não vai sair barato.",
		"SUSANE: Entendo. Está tudo bem. Mas por favor, acabe com isso. Não aguento mais."
		],
		"fix_kitchen_sink" : [
		"(Vamos ver o que temos aqui)",
		"(Parece tudo ok)",
		"(Não tem goteira, o fluxo de água tá normal)",
		"(Só tem um cheiro estranho saindo do ralo)",
		"(Devem ser restos de comida acumulados)",
		"(Vou colocar um produto de limpeza e acho que vai ficar tudo certo)"
		],
		"check_kitchen_sink" : [
			"(Eu já olhei a pia da cozinha)"
		],
		"interact_fridge" : [
		"(Eu nem tô com fome, por que tô olhando pra geladeira?)",
		"(Tenho trabalho a fazer e dinheir pra ganhar)"
		],
		"interact_puddle" : [
		"(Tem uma poça d'água aqui)",
		"(Isso não tem nada a ver com o problema do encanamento, vou deixa pra lá)"
		],
		"fix_bathroom_sink" : [
		"(Bem, essa tá funcionando bem também)",
		"(Isso vai custar uma nota pra ela, e nem fiz nada além de aplicar diabo verde hahaha)",
		"(Pera aí....)",
		"(Tem algo estranho aqui)",
		"(É aquele cheiro de novo)",
		"(Quanto mais eu sinto esse cheiro, mais estranho fica, só que não sei descrever ele direito)",
		"(É algo tipo... Ferro estragado?)",
		"(Mas isso não faz sentido. Metal não \"estraga\")",
		"(E aliás, tudo nesse banheiro é madeira ou cerâmica)",
		"(Deve ter algo muito bizarro nesse encanamento)",
		"(Bom, vou só aplicar o produto de limpeza mesmo, e aí voltar pra Susane)"
		],
		"check_bathroom_sink" : [
			"(Eu já olhei a pia do banheiro)"
		],
		"interact_shower": [
		"(Um chuveiro até que chique pra uma casa velha dessas)",
		"(Tem um cheiro bom de xampú e sabonete também)",
		"(Por que não sinto aquele cheiro estranho aqui?)"
		],
		"interact_photograph" : [
		"(Tem um retrato aqui)",
		"(Esses devem ser a Susane e o filho dela)",
		"(O resto do corredor parece limpo, mas isso aqui tá cheio de poeira e teias de aranha)",
		"(Eles estão felizes nessa foto. E jovens, também! O filho deve ser um adolescente aqui)",
		"(Ele tá usando brincos, no formato de cruz)",
		"(Ela disse que ele não tá mais por aqui. Imagino o que houve)" ,
		"(Deve ter sido trágico pra ela)"
		], 
		"interact_photograph_again" : [
			"(É triste lembrar do passado dessa forma)"
		],
		"interact_garbage_can" : [
			"(Nada além de papel higiênico e caixas de remédio)",
			"(Não deveria ficar reparando essas coisas)"
		],
		"interact_toilet" : [
			"(O vaso tá bem limpo. Aliás, limpo demais)",
			"(Ele também não cheira mal. Esquisito)"
		],
		"arrived_on_bathroom_after_basement" : [
		"(Ela não tá aqui. Pra onde essa mulher foi?)",
		"(De qualquer forma, eu deveria ir pegar a peça no meu caminhão)",
		"(Ele tá estacionado na frente da casa)"
		],
		"report_to_suzane" : [
		"Ok, eu chequei as duas pias.",
		"SUSANE: Ah, e você descobriu qual é o problema?",
		"Na verdade não. Usei um produto pra tirar o cheiro, mas não encontrei a causa do problema.",
		"SUSANE: Entendi. Talvez esteja no porão?",
		"Sim, provavelmente está lá.",
		"SUSANE: A entrada do porão fica no meu quarto. Por favor, entre pela porta à direita.",
		"Certo, vamos dar uma olhada."
		],
		"arrived_at_bedroom" : [
			"Ei, o cheiro tá bem forte aqui!",
			"SUSANE: Está mesmo? Acho que estou me acostumando a ele.",
			"SUSANE: Quando eu o percebo, parece familiar, no entanto. Como um cheiro velho e conhecido.",
			"SUSANE: Isso realmente me assusta.",
			"(As coisas tão ficando esquisitas)",
			"Certo, então é um bom motivo pra acabar com isso logo.",
			"SUSANE: Concordo. A entrada fica logo atrás da minha cama.",
			"Ok, vou dar uma olhada. Espera aqui, já volto.",
			"SUSANE: Me chame se precisar de algo, querido."
		],
		"interact_wardrobe": [
			"(O guarda-roupa parece bem arrumado)",
			"(Só a porta da esquerda tá aberta, e tem roupas de menino nela)",
			"(Muito bizarro)"
		],
		"interact_susane_bedroom" : [
			"SUSANE: Pode ir, querido",
			"SUSANE: Vou te esperar aqui."
		],
		"arrived_at_basement" : [
			"(Que merda é essa? O cheiro tá simplesmente absurdo aqui!)",
			"(Fico pensando em como a Susane consegue dormir perto desse porão)",
			"(Vamos acabar logo com isso)"
		],
		"interact_pipe" : [
			"(Meu deus!)",
			"(Tem um buraco no cano. Um dos grandes. Parece que algo arrancou uma boa parte dele!)",
			"(Não sei que tipo de... Criatura poderia fazer isso)",
			"(E aliás, parece que isso foi feito de dentro do cano)",
			"(Não tenho ideia se é isso a causa do cheiro, mesmo ele sendo mais forte aqui)",
			"(Deve ter algo preso no encanamento causando isso. Provavelmente um animal morto)",
			"(De qualquer jeito, agora só o que posso fazer é trocar essa parte do cano)",
			"(Vou precisar pegar uma peça no meu caminhão, vamos lá então)"
		],
		"interact_pipe_again" : [
			"(Não posso fazer nada por enquanto. Preciso pegar a peça nova no meu caminhão)"
		],
		"interact_pump" : [
			"(Essa é a bomba hidráulica)",
			"(Parece funcionar bem, a pressão da água tá boa)",
			"(O problema deve estar em outro lugar)"
		],
		"interact_box_1" : [
			"(Nada de importante aqui, só um monte de tranqueira)"
		],
		"interact_box_2" : [
			"(Um monte de coisas velhas, nada que me interesse)"
		],
		"interact_grid":[
			"(Ei, o que é isso?)",
			"(Tem uma coisa no meio da sujeira)",
			"(Parece um tipo de brinco. Será que eu vi isso antes?)",
			"(Pera, acho que eu... É, eu consigo pegar ele se eu colocar o dedo ali e...)",
			"(Consegui. Vou guardar e mostrar pra Susane. De repente ela me recompensa por isso)"
		],
		"interact_grid_no_earrings" : [
			"(Uma grade que dá acesso ao esgoto)"
		],
		"came_out_of_basement" :[
			"(Ei, cadê a Susane?)",
			"(Achei que ela ia me esperar aqui)",
			"(Ah, ela deve ter ido pegar um café ou sei lá)"
		],
		"came_out_of_bedroom" : [
			"(Ela também não tá aqui. De repente foi usar o banheiro?)"
		],
		"got_replacement" : [
			"(Esse deve ser o mesmo tipo de cano)",
			"(Agora tenho que voltar e trocar ele)",
			"(Estou com um mal pressentimento. Espero que a Susane esteja bem)"
		],
		"normal_ending" : [
			"Que merda é essa!",
			"O que diabos é essa coisa!?",
			"Fi... Fique longe, por favor!",
			"Eu só queria ganhar uma grana, droga!",
			"Eu te odeio por me mandar pra cá, John!"
		
		],
		"ending_with_earrings" : [
			"Mas que-",
			"O que diabos é você?",
			"Espera... Será que...?",
			"Esse brinco... Você é o filho da Susane, não é?",
			"CRIATURA: *Rugido*",
			"O que aconteceu com a sua mãe?",
			"CRIATURA:...",
			"Você levou ela, não é? Você deve sentir falta dela.",
			"Sua mãe te deu esse brinco, não é? Estou com o outro dele aqui. Pegue.",
			"(A criatura pegou o brinco e se apressou para o porão)"
		],
		"cannot_go_to_bedroom" :[
			"(Não devo ir para o quarto ainda)"
		],
		"cannot_go_outside" : [
			"(Não devo sair agora)"
		],
		"cannot_go_to_bathroom" : [
			"(Preciso checar a pia da cozinha primeiro)"
		]
}

var texts_en = {
	"intro" : [
		"(So this is it)", 
		"(This is the house John told me about)", 
		"(He told me the owner is an old, innocent woman)", 
		"(I'll make a good buck with this one, I'm sure)", 
		"(This place is creepy as hell... I'll make it a quick job)"
		],
	"seen_house" : [
		"(Man, look at this!)", 
		"(This house is old and really busted!)", 
		"(Horror movie material, for sure)", 
		"(You really can't make this shit up haha)", 
		"(Let's go inside)"
		],
	"check_truck" : [
		"(My old truck. It's seen better days. It's seen worse days too. Whatever, I should go.)"
	],
	"entered_kitchen" : [
		"WOMAN: Hello dear, welcome to my home.",
		"Hey there. You should be... Susane, right?",
		"WOMAN: Yes, that is me indeed.",
		"Cool. Er... do you live alone here?",
		"SUSANE: Well, yes, it's just me.",
		"SUSANE: My son used to live here with me, but he... isn't around anymore.",
		"SUSANE: I miss him so much. He used to help me with all the housework.",
		"(Like I care)",
		"Oh, It's so sad to hear that.",
		"Well, I was told you had a problem with your piping system, is that right?",
		"SUSANE: Yes, my son would've easily sorted it for me... so... so I called John.",
		"Right, and he was busy with another client, so that's why I'm here!",
		"SUSANE: I'm glad you are.",
		"Thanks. So let's begin. Can you describe the problem?",
		"SUSANE: Oh, I don't really know what's happening. Sometimes I hear strange noises coming out of the sinks.",
		"SUSANE: Sometimes, the water smells stagnant and tastes strange.",
		"When did it start?",
		"SUSANE: A couple of months ago. But it wasn't that bad at the beginning. I hadn't felt a need to call John until recently",
		"And where does it happen?",
		"SUSANE: All around the house, really. Here, in the kitchen, but also in the bathroom. And the basement is just awful.",
		"Ok. That's where the water pump is, right?",
		"SUSANE: Exactly. I haven't been down there in weeks now. The smell is unbearable for me.",
		"Sure, I understand perfectly. Well, I'll check the sinks and the basement.",
		"With a problem this big, it won't be cheap for you though, miss.",
		"SUSANE: I see. I'm fine with that. But please, just make it stop. I can't handle it anymore."
		],
		"fix_kitchen_sink" : [
		"(Let's see what we have here)",
		"(Well, everything seems ok)",
		"(No noticeable dripping, water flux looks normal)",
		"(There is a strange smell coming out of it though)",
		"(It's probably just due to accumulated food residue)",
		"(I'll apply a cleaning product and it should be fine)"
		],
		"check_kitchen_sink" : [
			"(I've already checked the kitchen sink)"
		],
		"interact_fridge" : [
		"(I'm not even hungry, why am I looking at the fridge?)",
		"(I've got a job to do, and money to make)"
		],
		"interact_puddle" : [
		"(There's a puddle of water here)",
		"(This one is not because of piping problems though, just normal kitchen stuff)"
		],
		"fix_bathroom_sink" : [
		"(Well, this one is working fine too)",
		"(This is gonna cost her a lot, and I haven't even done anything besides using caustic soda hahaha)",
		"(But wait...)",
		"(There's something weird in here)",
		"(It's that smell again)",
		"(The more I smell it, the more intense it becomes, yet I cannot describe it completely)",
		"(I's something like... Rotting metal?)",
		"(That's impossible, though. Metal doesn't really \"rot\")",
		"(On top of that, everything in this bathroom ceramic and wood)",
		"(There must be something really messed up going on with the pipes)",
		"(I'll just apply the cleaning product again for now and go back to Susane)"
		],
		"check_bathroom_sink" : [
			"(I've already checked the bathroom sink)"
		],
		"interact_shower": [
		"(A very elegant shower for an old house like this)",
		"(It has a nice smell of soap and shampoo, too)",
		"(Why is it that the strange smell doesn't appear here?)"
		],
		"interact_photograph" : [
		"(There's a picture here)",
		"(This must be Susane and her son)",
		"(Unlike the rest of the corridor, this part is dusty and full of cobwebs)",
		"(They look happy in the photograph. Both seem young, too! Her son must only be a teen in it)",
		"(He's wearing a pair of earrings, each resembling a cross)",
		"(She mentioned he isn't around anymore. I wonder what happened)" ,
		"(Must've been tragic for her)"
		], "interact_photograph_again" : [
			"(What a sad way to remember the past)"
		],
		"interact_garbage_can" : [
			"(Nothing but old medicine carts and toilet paper)",
			"(I shouldn't be looking at this stuff)"
		],
		"interact_toilet" : [
			"(The toilet is very clean. Methodically so)",
			"(It doesn't smell bad either, which is very strange)"
		],
		"arrived_on_bathroom_after_basement" : [
		"(She doesn't seem to be here. Where the hell did she go?)",
		"(Anyway, I should go back to get a replacement part at my truck)",
		"(It's parked just outside the house)"
		],
		"report_to_suzane" : [
		"Ok, so I've checked both sinks.",
		"SUSANE: Oh, and did you figure the problem out?",
		"Not really. I used a product to mitigate the smell a little, but the cause is elsewhere.",
		"SUSANE: I see. Maybe it's coming from the basement?",
		"Yeah, it's probably from there.",
		"SUSANE: The entrance to the basement is in my bedroom. Please, take the door on the right.",
		"Alright, let's go take a look."
		],
		"arrived_at_bedroom" : [
			"Hey, the smell's strong here!",
			"SUSANE: Is it, really? I think I'm getting used to it.",
			"SUSANE: When I do notice, though, it seems familiar. Like an old, known smell.",
			"SUSANE: It really creeps me out.",
			"(This is beginning to get weird)",
			"Ok, so even more reason for me to fix this mess.",
			"SUSANE: Right. The entrance to the basement is right behind my bed.",
			"Ok, I'll go check it out. Wait here, I got it.",
			"SUSANE: Call me if you need anything, dear."
		],
		"interact_wardrobe": [
			"(The wardrobe seems very tidy)",
			"(Only the left door is open and it has boys' clothes in it)",
			"(Weird stuff)"
		],
		"interact_susane_bedroom" : [
			"SUSANE: Go on, dear.",
			"SUSANE: I'll wait for you right here."
		],
		"arrived_at_basement" : [
			"(What the hell. The smell is straight up oppressive here)",
			"(I wonder how was Susane able to sleep next to the entrance for so long)",
			"(Let's get this over with)"
		],
		"interact_pipe" : [
			"(Oh my god!)",
			"(There's a hole in the pipe, and a big one at that. Looks like something has torn a huge chunk out of it!)",
			"(I don't have any idea what kind of... Creature could do this)",
			"(What's more, it seems it was done from the inside of the pipe)",
			"(It sure isn't the cause of the smell, even though it's stronger here)",
			"(There must be something deeper in the piping system causing it. Probably a dead animal)",
			"(Anyway, the only thing I can do for now is change this part of the pipe altogether)",
			"(I'll need to get a replacement at my truck, so let's go)"
		],
		"interact_pipe_again" : [
			"(I'm done here for now. I need to get the replacement part at my truck.)"
		],
		"interact_pump" : [
			"(This is the water pump)",
			"(It seems to be working fine, the water pressure is alright)",
			"(The problem must be elsewhere)"
		],
		"interact_box_1" : [
			"(Nothing meaningful here, just a bunch of old devices)"
		],
		"interact_box_2" : [
			"(Just a bunch of old stuff, nothing that catches my eye)"
		],
		"interact_grid":[
			"(Hey, what's that?)",
			"(There's something among the waste)",
			"(Looks like an earring of some sort. Have I seen it before?)",
			"(Wait, I think I could... Yeah, I can definetly grab it if I use my finger)",
			"(Got it. I'll keep it to show to Susane. Maybe I'll even get a reward)"
		],
		"interact_grid_no_earrings" : [
			"(A Grate that gives access to the sewers)"
		],
		"came_out_of_basement" :[
			"(Hey, where's Susane?)",
			"(I thought she would wait for me here)",
			"(Heh, maybe she went to grab a coffee or something)"
		],
		"came_out_of_bedroom" : [
			"(She isn't here either. Maybe she's using the toilet)"
		],
		"got_replacement" : [
			"(This should be the same kind of pipe)",
			"(I should go back and change it)",
			"(I've got a strange feeling. I hope Susane is ok)"
		],
		"normal_ending" : [
			"What the hell!",
			"What in the seven hells is this thing!?",
			"St...stay back!, please!",
			"Damn, I just wanted to make some money!",
			"I hate you for sending me here, John!"
		
		],
		"ending_with_earrings" : [
			"What the-",
			"What the hell are you?",
			"Wait... Can it be...?",
			"That earring... Your Susane's son, aren't you?",
			"CREATURE: *Growls*",
			"What happend to your mother?",
			"CREATURE:...",
			"You've taken her, right? You must have missed her.",
			"I've got your other earring here, your mom gave it to you, right? Take it.",
			"(The creature takes the earring from me and scrambles towards the basement)"
		],
		"cannot_go_to_bedroom" :[
			"(I shouldn't go to the bedroom yet)"
		],
		"cannot_go_outside" : [
			"(I shouldn't go out yet)"
		],
		"cannot_go_to_bathroom" : [
			"(I have to check the kitchen sink first)"
		]
}

func _ready():
	texts = texts_ptbr
	
func set_language(language):
	if language == "Português":
		texts = texts_ptbr
	elif language == "Inglês":
		texts = texts_en

func startDialog(text_list) :
	is_displaying = true
	dialogBox.startDialog(text_list)
	
func startDialogBeforeScene(text_list, path_to_scene) :
	is_displaying = true
	dialogBox.startDialogBeforeScene(text_list, path_to_scene)
