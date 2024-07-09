#set page(
    paper: "a5",
    margin: (x: 1.8cm, y: 1.5cm),
)

#import "heading.typ"
#import "liturgical.typ": dotext

#import "parallel.typ"

#let ctx = parallel.new("morning-prayers")

#parallel.text(ctx: ctx)[
#dotext[Tendo despertado do sono, antes de qualquer outra ação, levante-se com
        reverência, considerando estar na presença do Deus que tudo vê, e, tendo
        feito o sinal da Cruz, diga:]
][
#dotext[Проснувшись от сна, прежде чем совершить какое-либо другое действие,
        встаньте с благоговением, считая себя находящимся в присутствии
        Всевидящего Бога, и, перекрестив себя, произнесите:]
]

#parallel.text(ctx: ctx)[
Em nome do Pai, e do Filho e do Espírito Santo. Amém. ][
Во имя Отца, и Сына и Святого Духа. Аминь. ]

#parallel.text(ctx: ctx)[
Glória a Ti, nosso Deus, glória a Ti. ][
Слава Тебе, Боже наш, слава Тебе. ]

#parallel.text(ctx: ctx)[
Rei Celestial, Consolador, Espírito da Verdade, que está em toda parte e
    preenche tudo, a fonte de bênçãos e o doador da vida, venha e habite em nós,
    e nos purifique de toda sujeira e salve, ó Bom Deus, nossas almas. ][
Царю Небесный, Утешителю, Дух Истины, Который везде находишься и все
    наполняешь, источник благ и податель жизни, приди и вселись в нас, и очисти
    нас от всякой скверны и спаси, Благой, наши души. ]

#parallel.text(ctx: ctx)[
Santo Deus, Santo Poderoso, Santo Imortal, tende piedade de nós (três vezes). ][
Святый Боже, Святый Крепкий, Святый Бессмертный, помилуй нас (трижды). ]

#parallel.text(ctx: ctx)[
Glória ao Pai, e ao Filho, e ao Espírito Santo, agora (agora) e sempre
    (sempre). e para todo o sempre. Amém (de verdade). ][
Слава Отцу, и Сыну, и Святому Духу, и ныне (теперь), и присно (всегда). и во
    веки веков. Аминь (истинно так). ]

#parallel.text(ctx: ctx)[
Santíssima Trindade, tende piedade de nós. Senhor, purifica nossos pecados,
    Mestre, perdoa nossas iniquidades, Santo, visita e cura nossas enfermidades
    por amor do Teu nome. ][
Пресвятая Т
    роице, помилуй нас. Господи, очисти грехи наши, Владыка, прости
    беззакония наши, Святый, посети и исцели немощи наши имени Твоего ради. ]

#parallel.text(ctx: ctx)[
Senhor, tenha piedade (três vezes). ][
Господи, помилуй (трижды). ]

#parallel.text(ctx: ctx)[
Glória ao Pai e ao Filho e ao Espírito Santo, agora e sempre, e pelos séculos
    dos séculos. Amém. ][
Слава Отцу и Сыну, и Святому Духу, ныне и присно, и во веки веков. Аминь. ]

#parallel.text(ctx: ctx)[
Pai Nosso que estais no céu. Santificado seja o Teu nome, venha a nós o Teu
    reino, seja feita a Tua vontade, assim na terra como no céu. O pão nosso de
    cada dia (necessário) dá-nos hoje, e perdoa-nos as nossas dívidas, assim
    como nós perdoamos aos nossos devedores, e não nos deixes cair em tentação,
    mas livra-nos do maligno (o diabo). ][
Отче наш, сущий на небесах. Да святится имя Твое, да придет Царствие Твое,
    да будет воля Твоя и на земле, как на небе. Хлеб наш насущный (необходимый)
    дай нам на сей день, и прости нам долги наши, как и мы прощаем должникам
    нашим, и не введи нас в искушение, но избавь нас от лукавого (дьявола). ]

#parallel.text(ctx: ctx)[
Para (porque). Teu é o reino, e o poder, e a glória do Pai, e do Filho, e do
    Espírito Santo, agora e sempre, e pelos séculos dos séculos. Amém. ][
Ибо (потому что). Твое есть царство, и сила, и слава Отца и Сына, и Святого
    Духа, ныне и присно, и во веки веков. Аминь. ]

#parallel.render(ctx)
