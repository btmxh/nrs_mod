import 'dart:convert';

import 'package:nrs_mod/nrs_mod.dart';
import 'package:test/test.dart';

void main() {
  group("Parsing tests", () {
    test('SB69.kt', () {
      String source = r'''
package com.dah.nrs

import com.dah.nrs.dsl.*
import com.dah.nrs.exts.*

private val AllSB69Tracks = mutableListOf<String>()

private fun DSLEntry.FesALiveMusic(score: Double) {
    Music(score)
    AllSB69Tracks.add(id)
}

fun DSLScope.SB69() {
    // Almost every cat seems to enjoy catching birds.
    // But there is a cat, that wants to be a bird.
    // She wants to fly on that blue sky once painted pink.

    // In the past, there is a legendary rabbit.
    // A bunny that changed the world by flying in that sky.
    // No one expected it to be able to soar through the clouds like a bird.

    // Bunnies can fly, and so can cats.
    Entry {
        id = "F-VGMDB-4499"
        title = "Show By Rock!!"

        // in sb69 s1, s2, the cat have so much screentime, but i didn't
        // value it. and when s4 comes, the cat changed and lose screentime,
        // thus giving me nostalgia of the prequels,
        // when pmgc was the center of the franchise,
        // when rosia and retoree decided to be friends,
        // when the cat got taught a good lesson by grateful king.
        // To quote rst mfs:
        // "If that time ..." I was thinking
        // 「あの時もし...」 考えてたって
        // The days that have passed will not come back anymore
        // 過ぎた日々はもう 戻らないけど
        Cry(Emotion.CU) {
            contributors["A-MAL-41520"] = 0.5
            contributors["A-MAL-27441"] = 0.2
            contributors["A-MAL-32038"] = 0.2
            contributors["M-VGMDB-AL-51276"] = 0.1
        }
        PADS(3, Emotion.CU) {
            contributors["A-MAL-41520"] = 0.5
            contributors["A-MAL-27441"] = 0.25
            contributors["A-MAL-32038"] = 0.25
        }

        AEI(5.0, Emotion.AP) {
            contributors["A-MAL-27441"] = 0.5
            contributors["A-MAL-32038"] = 0.5
        }

        AEI(2.0, Emotion.AP) {
            contributors["A-MAL-40763"] = 0.6
            contributors["A-MAL-41520"] = 0.4
        }

        Waifu("Hijirikawa Cyan", "2022-01-15" to "2022-03-10") {
            contributors["A-MAL-27441"] = 0.35
            contributors["A-MAL-32038"] = 0.35
            contributors["A-MAL-40763"] = 0.05
            contributors["A-MAL-41520"] = 0.2
            contributors["G-VGMDB-8429"] = 0.05
        }

        KilledBy("F-VGMDB-7059", potential = 0.4, effect = 0.75) {
            contributors["A-MAL-27441"] = 0.2
            contributors["A-MAL-32038"] = 0.2
            contributors["A-MAL-40763"] = 0.2
            contributors["A-MAL-41520"] = 0.2
            contributors["G-VGMDB-8429"] = 0.2
        }

        KilledBy("O-1", potential = 0.2, effect = 0.75) {
            contributors["A-MAL-27441"] = 0.2
            contributors["A-MAL-32038"] = 0.2
            contributors["A-MAL-40763"] = 0.2
            contributors["A-MAL-41520"] = 0.2
            contributors["G-VGMDB-8429"] = 0.2
        }

        Entry {
            id = "A-MAL-27441"    // generated
            idMAL = 27441
            idAniList = 20843
            idAniDB = 10830
            idKitsu = 9729
            title = "Show by Rock!!"
            bestGirl = "Hijirikawa Cyan" // aka the ayumu cat

            FeatureMusic("M-VGMDB-AL-51276-1")
            FeatureMusic("M-VGMDB-AL-51278-1")
            FeatureMusic("M-VGMDB-AL-51706-1")
            FeatureMusic("M-VGMDB-AL-51706-2")

            Progress(Boredom.Completed)
            Visual(VisualKind.Animated, 0.6, 0.4)
        }

        Entry {
            id = "A-MAL-32038"    // generated
            idMAL = 32038
            idAniList = 21476
            idAniDB = 11763
            idKitsu = 11494
            title = "Show by Rock!! #"
            bestGirl = "Hijirikawa Cyan" // aka the ayumu cat

            // the lesson thingy was pretty cool ig
            AEI(2.0, Emotion.MP)

            // I almost cried at the ailane thing
            // <strikethrough>but NEI because gigachad animes don't farm tears</strikethrough>
            // didn't care didn't ask, and the NEI/AEI rework is here either way
            AEI(7.0, Emotion.MP)

            FeatureMusic("M-VGMDB-AL-61217-1")
            FeatureMusic("M-VGMDB-AL-61940-1")
            FeatureMusic("M-VGMDB-AL-61981-1")
            FeatureMusic("M-VGMDB-AL-61981-3")

            Progress(Boredom.Completed)
            Visual(VisualKind.Animated, 0.6, 0.4)
        }

        Entry {
            id = "A-MAL-40763"    // generated
            idMAL = 40763
            idAniList = 113470
            idAniDB = 15281
            idKitsu = 42885
            title = "Show By Rock!! Mashumairesh!!"
            bestGirl = "Mashima Himeko" // aka himekek
            // main girl is hoan tinh xdddddddddd
            // chao em co gai howan tinh
            // actually the cat appeared in last ep but idc

            // my heart skipped a beat when the cat
            // appeared in last ep
            // keking
            NEI(7.5, Emotion.MP)

            FeatureMusic("M-VGMDB-AL-93440-1")
            FeatureMusic("M-VGMDB-AL-93440-3")
            FeatureMusic("M-VGMDB-AL-93441-1")

            // the screentime thing
            // mashu mp farm got fucked by the existence of the cat
            // and pmgc
            KilledBy("M-18", potential = 0.75, effect = 0.75)
            Visual(VisualKind.Animated, 0.65, 0.4)

            Progress(Boredom.Completed)
        }

        Entry {
            id = "A-MAL-41520"    // generated
            idMAL = 41520
            idAniList = 113476
            idAniDB = 15467
            idKitsu = 43590
            title = "Show by Rock!! Stars!!"
            bestGirl = "Hijirikawa Cyan" // aka the ayumu cat
            // aka show by rock!! banded rocking records high school idol club
            // the gen2 niji

            // although this is not watched during its release
            // to make sure sb69 not killing rst, and maybe sb69 stars
            // can pull up a niji moment, this is watched in a "seasonal"
            // way, at every 12pm saturday from 2022/1/22
            // update: shit happened and no more seasonal
            seasonal = false

            bestGirl = "Hijirikawa Cyan" // cats can fly

            // bro the ayumu shit happened again xddddddddddd
            // basically in ep 1&2, the cat has little screentime,
            // and considering i have to wait 2 long weeks to watch
            // this, it's frustrating af.
            NEI(5.0, Emotion.AU)

            // basically the cat va in s4 focuses on moe more
            // than the fact that the cat is kinda reserved and shit
            // maybe chardev happened but didn't care + didn't ask for that
            AdditionalImpact("the cat va sucks in this season", -0.25)

            FeatureMusic("M-VGMDB-AL-104341-1")
            FeatureMusic("M-VGMDB-AL-104341-2")
            FeatureMusic("M-VGMDB-AL-104266-3")
            FeatureMusic("M-VGMDB-AL-104266-6")
            FeatureMusic("M-VGMDB-AL-104267-5")
            FeatureMusic("M-VGMDB-AL-100087-1")

            Progress(Boredom.Completed)
            Visual(VisualKind.Animated, 0.65, 0.4)
        }

        // fes a live has fhana songs lmao
        FeatureMusic("M-VGMDB-AL-62516-1")
        FeatureMusic("M-VGMDB-AL-110219-1")

        Entry {
            id = "M-VGMDB-AL-100087"
            title = "How To Fly"

            Visual(VisualKind.AlbumArt, 0.45, 0.3)
            SubIDEntry("1") {
                // fes a live art looks a little bit weird ngl
                Visual(VisualKind.AnimatedMV, 0.45, 0.3)
                FesALiveMusic(3.5)
            }
        }

        Entry {
            id = "M-VGMDB-AL-94913"
            title = "My pace!!"

            Visual(VisualKind.AlbumArt, 0.3, 0.7)

            SubIDEntry("1") {
                // really interesting vocal
                // (somewhat resemble kano)
                FesALiveMusic(2.5)
            }
        }

        Entry {
            id = "M-VGMDB-AL-51276"
            title = "Seishun wa Non-Stop!"

            Visual(VisualKind.AlbumArt, 0.6, 0.6)

            SubIDEntry("1") {
                FesALiveMusic(2.5)

                Remix("M-22")
            }

            SubIDEntry("2", "Close to you") {
                FesALiveMusic(4.0)

                Remix("M-VGMDB-AL-61981-3")
            }
        }

        Entry {
            id = "M-VGMDB-AL-51278"
            title = "Tabiji Yoiyoi Yume Hanabi"

            Visual(VisualKind.AlbumArt, 0.45, 0.5)

            SubIDEntry("1") {
                FesALiveMusic(3.0)
            }
        }

        Entry {
            id = "M-VGMDB-AL-51706"
            title = "Meikyuu DESTINY/Ryuusei Dreamline"

            Visual(VisualKind.AlbumArt, 0.55, 0.4)

            SubIDEntry("1", "Meikyuu DESTINY") {
                FesALiveMusic(5.0)
            }

            SubIDEntry("2", "Ryuusei Dreamline") {
                // kekekekekekek
                FesALiveMusic(2.25)
            }
        }

        Entry {
            id = "M-VGMDB-AL-61217"
            title = "Heart wo Rock!!"

            Visual(VisualKind.AlbumArt, 0.45, 0.4)

            SubIDEntry("1") {
                FesALiveMusic(7.0)
            }
        }

        Entry {
            id = "M-VGMDB-AL-61940"
            title = "Schlehit Melodie/Danzai no Solitude"

            Visual(VisualKind.AlbumArt, 0.4, 0.4)

            SubIDEntry("1", "Schlehit Melodie") {
                FesALiveMusic(4.0)
            }
        }

        Entry {
            id = "M-VGMDB-AL-61981"
            title = "My Resolution ~Mirai e no Kizuna~"

            Visual(VisualKind.AlbumArt, 0.5, 0.4)

            SubIDEntry("1") {
                FesALiveMusic(5.0)
            }

            SubIDEntry("3", "Close to you (Cyan ver.)") {
                FesALiveMusic(3.5)

                NEI(2.5, Emotion.MP)
            }
        }

        Entry {
            id = "M-VGMDB-AL-59914"
            title = "Do Re Mi Fa PARTY"

            Visual(VisualKind.AlbumArt, 0.35, 0.5)

            SubIDEntry("1") {
                // xd
                FesALiveMusic(2.0)
                Meme(0.1, 2)
            }
        }

        // "visual"s of hiromemes and mashiro start line are good
        NEI(5.0, Emotion.MP) {
            contributors["A-MAL-40763"] = 0.75
            contributors["M-VGMDB-AL-93440-1"] = 0.25
        }

        AEI(5.0, Emotion.CP) {
            contributors["A-MAL-40763"] = 0.75
            contributors["M-VGMDB-AL-93440-3"] = 0.25
        }

        Entry {
            id = "M-VGMDB-AL-93440"
            title = "Hiromenes/Kimi no Rhapsody"

            Visual(VisualKind.AlbumArt, 0.4, 0.3)

            SubIDEntry("1", "Hiromenes") {
                FesALiveMusic(6.0)
            }

            SubIDEntry("2", "Kimi no Rhapsody") {
                // hahahahahaaha the howan tinh song
                FesALiveMusic(2.5)
                Meme(0.01, numDays("2022-04-01"))
                Remix("M-62")
            }

            SubIDEntry("3", "Masshiro Start Line") {
                FesALiveMusic(6.0)
            }
        }

        Entry {
            id = "M-62"
            title = "Kimi no Rhapsody (DJ DEVILMINTKIRYU Remix)"
            // aka hoantinh theme song

            FesALiveMusic(4.0)
        }

        Entry {
            id = "M-VGMDB-AL-93441"
            title = "Yell and Response"

            Visual(VisualKind.AlbumArt, 0.5, 0.3)

            SubIDEntry("1") {
                FesALiveMusic(2.0)
            }
        }

        Entry {
            id = "M-VGMDB-AL-104341"
            title = "Do Re Mi Fa STARS!!/Hoshizora Light Story"

            Visual(VisualKind.AlbumArt, 0.6, 0.3)

            SubIDEntry("1", "Do Re Mi Fa STARS!!") {
                // aka ceui - colorful days (mp-based franchise ver.)
                // or the counting song
                FesALiveMusic(5.0)
            }

            SubIDEntry("2", "Hoshizora Light Story") {
                FesALiveMusic(3.5)
            }
        }

        Entry {
            id = "M-VGMDB-AL-104266"
            title = "SHOW BY ROCK!! STARS!! INSERT SONG MINI ALBUM Vol.1"

            Visual(VisualKind.AlbumArt, 0.1, 0.2)

            SubIDEntry("3", "Do! It! Happy Daibouken!") {
                // do it party reference lmfao
                FesALiveMusic(6.5)
            }

            SubIDEntry("6", "Kyukyukyun♡Heart Shaker") {
                // aaaaa co sao method thong minh the
                // co le dell ai ngau giong anh chang
                // ngau loi nhat ca doi tuyen toan
                // do co le la em toi

                FesALiveMusic(5.0)
            }
        }

        Entry {
            id = "M-VGMDB-AL-104267"
            title = "SHOW BY ROCK!! STARS!! INSERT SONG MINI ALBUM Vol.2"

            Visual(VisualKind.AlbumArt, 0.1, 0.2)

            SubIDEntry("5", "EMPIRE DOMINATOR") {
                FesALiveMusic(2.5)
            }

            SubIDEntry("8", "Anokanatarium") {
                // this was unranked all this time?????
                // lmfao
                FesALiveMusic(6.5)

                // there's no one who is cooler
                // there's no one who's like him
                // the one who shines like the sun
                // forever shining is the method
            }
        }

        Entry {
            id = "M-VGMDB-AL-61982"
            title = "Hanate! Dododon!"

            Visual(VisualKind.AlbumArt, 0.6, 0.4)

            SubIDEntry("1") {
                FesALiveMusic(5.0)
            }
        }

        Entry {
            id = "M-VGMDB-AL-118562"
            title = "Taikakusen wo Tsunaideyo"

            Visual(VisualKind.AlbumArt, 0.6, 0.3)

            SubIDEntry("1") {
                FesALiveMusic(6.5)
            }
        }

        Entry {
            id = "M-VGMDB-AL-104418"
            title = "Good Day by Day"

            // this thing:
            // https://medium-media.vgm.io/albums/81/104418/104418-9cc8d5c0abf7.jpg
            // is from the blu-ray, so it doesn't count
            ValidatorSuppress("dah-visualless-entry")

            // also sung by Ailane (cv. Ruriko Noguchi) and Shibarin (cv. Marika Kohno)
            SubIDEntry("1") {
                FesALiveMusic(3.5)
            }

            // if u understand, u understand
            // RemixOf("M-VGMDB-AL-97688-16")
        }

        Entry {
            id = "M-VGMDB-AL-100082"
            title = "Mirai Wanted"

            Visual(VisualKind.AlbumArt, 0.4, 0.5)

            SubIDEntry("1") {
                FesALiveMusic(5.0)
            }
        }

        Entry {
            id = "M-VGMDB-AL-116297"
            title = "Bokura no Neiro"

            Visual(VisualKind.AlbumArt, 0.4, 0.5)

            SubIDEntry("1") {
                Visual(VisualKind.SemiAnimatedMV, 0.5, 0.6)
                FesALiveMusic(3.5)
            }
        }

        Entry {
            id = "M-VGMDB-AL-105612"
            title = "Mot Mot Mot"

            Visual(VisualKind.AlbumArt, 0.25, 0.45)

            SubIDEntry("1") {
                FesALiveMusic(6.5)
            }
        }

        Entry {
            id = "M-VGMDB-AL-86315-3"
            title = "P SHOW BY ROCK!!"

            SubIDEntry("3", "Nyumber One! Zettai Saikyou!") {
                FesALiveMusic(7.0)
            }
        }

        Entry {
            id = "M-VGMDB-AL-76155"
            title = "Loop Shiteru/Asuiro Koi Moyou"

            Visual(VisualKind.AlbumArt, 0.3, 0.3)

            SubIDEntry("1", "Loop Shiteru") {
                // :tf:
                FesALiveMusic(2.5)
            }

            SubIDEntry("2", "Asuiro Koi Moyou") {
                // absolute catjammer
                // cricri is just too fking based

                // Even if the world was to end in the morning
                // I wouldn’t have any regrets, because I was able to meet you
                // That’s the most of my feelings I can express
                // But it’s fine if you’re too thick to understand

                // btw kaguyashit pls fuck off from this beautiful lyrics
                // this is also known as "A-Sử-iro Koi Moyou"
                // ("vợ chồng a phủ" reference lmfao)

                // the "ai kotoba iii" of rst-sb69
                // which marks the continuation of the duopoly era
                // ^ clueless mfs

                FesALiveMusic(8.0)
                NEI(5.0, Emotion.MP)

                // (the love song parody lyrics shit of me to rst, translated to english)

                // Bởi vì khi con tim ngừng đập
                // Because when our hearts stop beating

                // chẳng phải khi ta đã chết đi trong lòng người khác
                // is not when they are no longer living in any other hearts

                // Em luôn ở đây, kề bên anh soi sáng con đường
                // You are always here, lighting the path for me.

                // Giờ đây là khi, mình tay cầm tay
                // Now it's time, we hand in hand

                // Và cùng nhau ta sẽ thắp sáng ước mơ
                // And together we will [shine our dreams] (lmfao rst song comp diff name)

                // "morbius is a movie of all time"
                AKMEraPart1(1.0)
                AKMEraPart2(1.0)
                AKMEraPart3(0.8)
            }
        }

        // adding these songs to increase Murakawa Rie and Hidaka Rina's score lol
        // (i can't accept ayumu va to be higher than rina hidaka lol)
        Entry {
            id = "M-VGMDB-AL-95313"
            title = "How Are You?"
            Visual(VisualKind.AlbumArt, 0.3, 0.3)

            SubIDEntry("1") {
                FesALiveMusic(6.0)
            }
        }

        Entry {
            id = "M-VGMDB-AL-95314"
            title = "Happy Happy Jump"
            Visual(VisualKind.AlbumArt, 0.3, 0.3)

            SubIDEntry("1") {
                FesALiveMusic(5.0)
            }
        }

        Entry {
            id = "M-18"
            title = "Plasmagica"

            Contains(MusicVocalImageContainFactor) {
                Contains("M-VGMDB-AL-94913")
                Contains("M-VGMDB-AL-51276")
                Contains("M-22", 0.5)
                Contains("M-VGMDB-AL-51706")
                Contains("M-VGMDB-AL-61217")
                Contains("M-VGMDB-AL-61981")
                Contains("M-VGMDB-AL-59914")
                Contains("M-VGMDB-AL-104341-1", 0.5)
                Contains("M-VGMDB-AL-104266-3")
                Contains("M-VGMDB-AL-100082")
                Contains("M-VGMDB-AL-116297")
            }
        }

        Entry {
            id = "M-19"
            title = "Tsurezurenaru Ayatsuri Mugenan"

            Contains(MusicVocalImageContainFactor) {
                Contains("M-VGMDB-AL-51278")
            }
        }

        Entry {
            id = "M-20"
            title = "Mashumairesh!!"

            Contains(MusicVocalImageContainFactor) {
                Contains("M-VGMDB-AL-93440")
                Contains("M-VGMDB-AL-93441")
                Contains("M-VGMDB-AL-104341-1", 0.5)
                Contains("M-VGMDB-AL-104341-2", 1.0)
                Contains("M-VGMDB-AL-104267-8", 1.0)
                Contains("M-62", 0.5)
            }
        }

        Entry {
            id = "M-21"
            title = "BUD VIRGIN LOGIC"

            Contains(MusicVocalImageContainFactor) {
                Contains("M-VGMDB-AL-61940")
                Contains("M-VGMDB-AL-104267-5")
            }
        }

        Entry {
            id = "M-23"
            title = "Criticrista"

            Contains(MusicVocalImageContainFactor) {
                Contains("M-VGMDB-AL-104266-6")
                Contains("M-VGMDB-AL-61982")
                Contains("M-VGMDB-AL-105612")
                Contains("M-VGMDB-AL-86315-3")
                // when you realized that something is missing
                Contains("M-VGMDB-AL-76155")
            }
        }

        Entry {
            id = "G-VGMDB-8429"
            title = "SHOW BY ROCK!! Fes A Live"

            AllSB69Tracks.forEach { FeatureMusic(it) }
            Visual(VisualKind.GachaCardArt, 0.4, 0.3)
        }
    }

    // the famous speed-finger control map
    Entry {
        id = "M-22"
        title = "Seishun wa Non-Stop! (Asterisk DnB Remix)"

        Music(6.0)
        OsuSong(personal = 7.5)
    }

    RSTSB69DuopolyEra(0.8) {
        contributors["A-MAL-27441"] = 0.25
        contributors["A-MAL-32038"] = 0.3
        contributors["A-MAL-40763"] = 0.1
        contributors["A-MAL-41520"] = 0.25
        contributors["G-VGMDB-8429"] = 0.1
    }

    AKMEraPart1(0.3) {
        contributors["A-MAL-27441"] = 0.25
        contributors["A-MAL-32038"] = 0.3
        contributors["A-MAL-40763"] = 0.1
        contributors["A-MAL-41520"] = 0.25
        contributors["G-VGMDB-8429"] = 0.1
    }

    AKMEraPart2(0.75) {
        contributors["A-MAL-27441"] = 0.25
        contributors["A-MAL-32038"] = 0.3
        contributors["A-MAL-40763"] = 0.1
        contributors["A-MAL-41520"] = 0.25
        contributors["G-VGMDB-8429"] = 0.1
    }

    AKMEraPart3(0.6) {
        contributors["A-MAL-27441"] = 0.25
        contributors["A-MAL-32038"] = 0.3
        contributors["A-MAL-40763"] = 0.1
        contributors["A-MAL-41520"] = 0.25
        contributors["G-VGMDB-8429"] = 0.1
    }
}

fun AcceptImpact.AKMEraPart1(strength: Double, block: DSLImpact.() -> Unit = {}) {
    // "
    // rst-sb69 duopoly era season 2: electric boogaloo (June 3rd, 2022 onwards)
    // featuring modern vietnamese literature, esters, tien duc and more...
    // " - clueless mf doesn't know about the song

    // Asuiro Koi Moyou era (part 1)
    // AKM is basically the "child" of rst and sb69,
    // inheriting rst's love and sb69's catjam af music
    // This arc features dumb shit like MVL (modern vietnamese literature)
    Meme(strength, numDays("2022-06-03", "2022-07-17"), block)

    // all of this shit basically spits on all other anime
    // that was unable to be meta'd for longer than a month
    // while literally a song not even 5 minutes was able
    // to turn modern culture into the shittiest hellhole ever.
}

fun AcceptImpact.AKMEraPart2(strength: Double, block: DSLImpact.() -> Unit = {}) {
    // AKM era arc 2
    // seasonal anime now exists, le boat analogy is dying, etc.
    // sb69 top 1 franchise now xd
    Meme(strength, numDays("2022-07-21", "2022-08-31"), block)
    // july then comes with a bunch of new seasonal anime,
    // and some of them were infused with akm shit such as:
    // - classroom of the elite: a girl with same VA as rosia
    // was declared "potential waifu"
    // - something motokano something: another girl with same
    // VA as rosia
    // - atelier (not seasonal): have OP named "asuiro" and
    // sang by the VA of jacklyn, who also was the VA for the
    // main girl aka "botaental guaifu" aka "mc xinh vl" aka
    // "sklol" aka "we live in a society" (btw if u can't tell
    // i'm talking about the escha logy anime)
    // (and then i downloaded the game(s) lol XDDDDDDDDDDDDD)
    // - toji no miko (not seasonal): main antagonist has the
    // same VA as rosia
    // - the idol pride unit: iiix, comsisting of:
    //   + the zenryoku i love you reijing signal girl
    //   + the glory star rst misaki sango girl
    //   + the asuiro koi moyou jacklyn girl
    // (now i finally understood why le gigachad mapper like
    // aipuru so much lol)
    // etc. (btw for somewhateverreason, all of these girls
    // VA'd by these two seiyuus have great waifu material
    // ngl, except for the iiix girls tho, oh wait, and that toji
    // no miko girl, whatever)
    // p/s: i wanna kms

    // btw no fucking way mii hasegawa covered akm:
    // https://www.youtube.com/watch?v=aDh26KX6X0s

    // rosia-chan realized that le cat has so much waifu material that
    // rosia-chan can not be her rival, even though she sang "asuiwanttodie
    // pleasesavemefromthismadness moyou", but she has learned a skill from
    // her senpai's, which is stealing content from other franchises.

    // rosia-chan had an idea, she called jacklyn-chan to discuss the matter
    // and jacklyn-chan accepted. rosia-chan and jacklyn-chan are going to
    // use the seiyuu-no-jutsu to yoink waifus.

    // jacklyn-chan, decided to give her blessings to the atelier franchise,
    // while rosia-chan, jumping on the seasonal hype train and going for
    // the COTE route.

    // both of them haven't succeeded yet, but their plan has resulted in
    // the unfunniest meme of all time: "potential waifu". this also means
    // that those franchises will have a little bit of contribution to this
    // shitty era.

    // and they got the first step right ffs fuck this crap
    // i hate atelier
    // worst game franchise of all time
    // i hate the mc
    // fuck her
    // (pls save me)
}

fun AcceptImpact.AKMEraPart3(strength: Double, block: DSLImpact.() -> Unit = {}) {
    // I heard somewhere that “Love strikes so suddenly”
    // and so suddenly it is, that atelier girl is now a fucking canon waifu
    // rip arisu tho (she is probably just a bait anyways)

    // so, post-rst culture will have another shot with waifu meta, after failing
    // with le cat because of 'lack of content'. let's hope for the best for miss
    // 15-year-old escha malier to turn this culture into absolute chaos.
    Meme(strength, numDays("2022-09-01"), block)
}
''';

      final lines = LineSplitter.split(source).toList(growable: false);

      void check(String id, int lineFrom, int lineTo, int numIndent) {
        final block = getEntryBlock(lines, id);
        expect(block != null, true);
        expect(block!.indentation.codeUnits.any((c) => c != 32), false);
        expect(block.indentation.length, numIndent);
        expect(block.range.from.line + 1, lineFrom);
        expect(block.range.to.line + 1, lineTo);
      }

      check("F-VGMDB-4499", 23, 672, 8);
      check("M-22", 675, 681, 8);
      check("M-VGMDB-AL-76155", 522, 575, 12);
      check("M-VGMDB-AL-76155-2", 533, 574, 16);
    });
    test('CommonArtists.kt', () {
      String source = r'''
package com.dah.nrs

import com.dah.nrs.dsl.DSLScope
import com.dah.nrs.dsl.Entry
import com.dah.nrs.dsl.SubIDEntry
import com.dah.nrs.exts.*

fun DSLScope.CommonArtists() {
    Entry {
        id = "M-1"
        title = "Asterisk"

        Contains("M-35", 1.0 / 3)
        Contains("M-10", 0.5)
        Contains("M-22", 0.5)
    }

    Entry {
        id = "M-34"
        title = "Rakakun"

        Contains("M-35", 1.0 / 3)
    }

    Entry {
        id = "M-VGMDB-AR-15361"
        title = "Minase Inori"

        Contains("M-9", 1.0 / 5)
        Contains("M-44", 1.0 / 4)

        Contains(MusicVocalImageContainFactor) {
            Contains("M-VGMDB-AL-54418-1")
            Contains("M-VGMDB-AL-55364-3")

            //sora yori group
            Contains(1.0 / 4.0) {
                Contains("M-VGMDB-AL-73544")
            }

            Contains("M-VGMDB-AL-82284", 1.0 / 5.0)
        }
    }

    Entry {
        id = "M-VGMDB-AR-15350"
        title = "M·A·O"

        Contains("M-44", 1.0 / 4)
        Contains(MusicVocalImageContainFactor) {
            Contains("M-VGMDB-AL-63666")
        }
    }

    Entry {
        id = "M-VGMDB-AR-15380"
        title = "Takahashi Rie"

        Contains("M-44", 1.0 / 4)

        Contains(MusicVocalImageContainFactor) {
            Contains("M-VGMDB-AL-53719-1")
        }
    }

    Entry {
        id = "M-VGMDB-AR-15998"
        title = "Ozawa Ari"

        Contains("M-13", 1.0 / 2)
        Contains("M-44", 1.0 / 4)

        Contains(MusicVocalImageContainFactor) {
            Contains("M-VGMDB-AL-53719-1", 0.5)
            Contains("M-VGMDB-AL-82983-5")
        }
    }

    Entry {
        id = "M-VGMDB-AR-12726"
        title = "Sakura Ayane"

        Contains("M-9", 1.0 / 5)
        Contains("M-18", 1.0 / 4)

        Contains(MusicVocalImageContainFactor) {
            Contains("M-VGMDB-AL-82284", 1.0 / 5.0)
        }
    }

    Entry {
        id = "M-VGMDB-AR-13211"
        title = "Taneda Risa"

        Contains("M-9", 1.0 / 5)
    }

    Entry {
        id = "M-VGMDB-AR-8874"
        title = "Sato Satomi"

        Contains("M-9", 1.0 / 5)
    }

    Entry {
        id = "M-VGMDB-AR-13289"
        title = "Uchida Maaya"

        Contains("M-9", 1.0 / 5)
    }

    Entry {
        id = "M-VGMDB-AR-13857"
        title = "fhána"

        // band, so no Contains(ImageVocalContainFactor) block
        Contains("M-VGMDB-AL-62516")
        Contains("M-VGMDB-AL-110219")

        Entry {
            id = "M-VGMDB-AL-47403"
            title = "Hoshikuzu no Interlude"

            Visual(VisualKind.AlbumArt, 0.6, 0.3)

            SubIDEntry("1") {
                Music(3.0)
            }
        }
    }

    Entry {
        id = "M-VGMDB-AR-25289"
        title = "Koyama Hidekazu"
        // aka the god nanou

        Contains("M-VGMDB-AL-37130-1", 0.1)
        Contains("M-VGMDB-AL-37130-2", 0.1)
        Contains("M-VGMDB-AL-37130-3", 0.05)
        Contains("M-VGMDB-AL-37130-4", 0.1)
        Contains("M-VGMDB-AL-37130-5", 0.1)
        Contains("M-VGMDB-AL-37130-6", 0.1)

        Contains("M-VGMDB-AL-49423-1", 0.2)
    }

    Entry {
        id = "M-VGMDB-AR-15119"
        title = "Scop"

        Contains("M-VGMDB-AL-37130-1", MusicInstContainFactor / 3.0)
        Contains("M-VGMDB-AL-37130-2", MusicInstContainFactor / 3.0)
        Contains("M-VGMDB-AL-37130-3", MusicInstContainFactor / 3.0)

        Contains("M-VGMDB-AL-34411-11", MusicInstContainFactor)
    }

    Entry {
        id = "M-VGMDB-AR-15120"
        title = "keeno"

        Contains("M-VGMDB-AL-37130-4", MusicInstContainFactor / 3.0)
        Contains("M-VGMDB-AL-37130-5", MusicInstContainFactor / 3.0)
        Contains("M-VGMDB-AL-37130-6", MusicInstContainFactor / 3.0)

        Contains("M-VGMDB-AL-49423-8", 0.2)

        Contains("M-VGMDB-AL-78339-2", 0.1)
    }

    Entry {
        id = "M-VGMDB-AR-17551"
        title = "Saito Shuka"

        Contains(MusicVocalImageContainFactor) {
            Contains("M-VGMDB-AL-97692")
        }
    }

    Entry {
        id = "M-VGMDB-AR-29323"
        title = "Maeda Kaori"

        Contains("M-VGMDB-AR-29922", NijiOldGirlContainFactor)
        Contains(MusicVocalImageContainFactor) {
            Contains("M-VGMDB-AL-99272-3")
        }
    }

    Entry {
        id = "M-VGMDB-AR-29640"
        title = "Onishi Aguri"

        Contains("M-VGMDB-AR-29922", NijiOldGirlContainFactor)
        Contains(MusicVocalImageContainFactor) {
            Contains("M-VGMDB-AL-80802-2")
            Contains("M-VGMDB-AL-87198-1")
            Contains("M-VGMDB-AL-99272-1")
            Contains("M-VGMDB-AL-112929-2")
        }
    }

    Entry {
        id = "M-VGMDB-AR-27779"
        title = "Kusunoki Tomori"
        // the prima doll destroyer

        Contains("M-VGMDB-AR-29922", NijiOldGirlContainFactor)
        Contains(MusicVocalImageContainFactor) {
            Contains("M-VGMDB-AL-80802-8")
            Contains("M-VGMDB-AL-87198-7")
            Contains("M-VGMDB-AL-99272-7")
        }
    }

    Entry {
        id = "M-VGMDB-AR-26954"
        title = "Tanaka Chiemi"

        Contains("M-VGMDB-AR-29922", NijiOldGirlContainFactor)
        Contains(MusicVocalImageContainFactor) {
            Contains("M-VGMDB-AL-80802-10")
        }
    }

    Entry {
        id = "M-VGMDB-AR-16469"
        title = "TrySail"

        Contains(MusicVocalImageContainFactor) {
            Entry {
                id = "M-VGMDB-AL-69147"
                title = "TAILWIND"

                Visual(VisualKind.AlbumArt, 0.1, 0.3)

                SubIDEntry("11", "Kakawari") {
                    Music(6.0)
                }
            }

            Contains("M-VGMDB-AL-89431")
            Contains("M-VGMDB-AL-95029")

            // 765 MILLION ALLSTARS
            Contains("M-VGMDB-AR-32295", 3.0 / 51.0)
        }
    }

    Entry {
        id = "M-VGMDB-AR-11829"
        title = "ClariS"

        Contains(MusicVocalImageContainFactor) {
            Contains("M-VGMDB-AL-23391")
            Contains("M-VGMDB-AL-41292")
            Contains("M-VGMDB-AL-89431")

            // colorful remixes
            Contains(0.5) {
                Contains("M-7")
                Contains("M-8")
            }

            Entry {
                id = "M-VGMDB-AL-23391"
                title = "Connect"

                Visual(VisualKind.AlbumArt, 0.35, 0.6)
                SubIDEntry("1") {
                    Music(3.0)
                }
            }

            Entry {
                id = "M-VGMDB-AL-41292"
                title = "Colorful"

                Visual(VisualKind.AlbumArt, 0.1, 0.2)
                SubIDEntry("1") {
                    Music(5.0)

                    Remix("M-7")
                    Remix("M-8")
                }
            }

            Entry {
                id = "M-VGMDB-AL-89431"
                title = "Signal"

                Visual(VisualKind.AlbumArt, 0.1, 0.2)
                SubIDEntry("1") {
                    Music(7.0)
                }
            }

            Entry {
                id = "M-VGMDB-AL-77471"
                title = "CheerS"

                Visual(VisualKind.AlbumArt, 0.1, 0.4)

                SubIDEntry("1") {
                    Music(4.0)
                    OsuSong(personal = 4.0, community = 0.0)
                }
            }
        }
    }

    Entry {
        id = "M-6"
        title = "tamame"

        Contains(0.5) {
            Entry {
                id = "M-8"
                title = "Colorful (tamame's apostate remix)"

                Music(6.5)
            }

            Entry {
                id = "M-47"
                title = "Tamame - Ebb and Flow (5 years after remix)"

                Music(3.0)
            }
        }
    }

    Entry {
        id = "M-VGMDB-AR-13097"
        title = "Ray"

        Contains(MusicVocalImageContainFactor) {
            Entry {
                id = "M-VGMDB-AL-41278"
                title = "lull ~Soshite Bokura wa~"

                Visual(VisualKind.AlbumArt, 0.15, 0.35)

                SubIDEntry("1") {
                    Music(0.75)
                }
            }

            Entry {
                id = "M-VGMDB-AL-42900"
                title = "ebb and flow"

                Visual(VisualKind.AlbumArt, 0.15, 0.45)

                SubIDEntry("1") {
                    Music(3.5)
                    Remix("M-47")
                }

                SubIDEntry("3", "nagi") {
                    Music(1.2)
                }
            }

            Contains(0.5) {
                Contains("M-47")
            }
        }
    }

    Entry {
        id = "M-VGMDB-AR-5524"
        title = "yanaginagi"

        Contains(MusicVocalImageContainFactor) {
            Entry {
                id = "M-VGMDB-AL-41280"
                title = "Aqua Terrarium"

                Visual(VisualKind.AlbumArt, 0.175, 0.45)

                SubIDEntry("1") {
                    Music(0.75)
                }
            }

            Entry {
                id = "M-VGMDB-AL-43164"
                title = "Mitsuba no Musubime"

                Visual(VisualKind.AlbumArt, 0.1, 0.45)

                SubIDEntry("1") {
                    Music(0.75)
                }
            }

            Entry {
                id = "M-VGMDB-AL-37932"
                title = "Yukitoki"

                Visual(VisualKind.AlbumArt, 0.15, 0.5)

                SubIDEntry("1") {
                    Music(2.0)
                }
            }

            Entry {
                id = "M-VGMDB-AL-51516"
                title = "Harumodoki"

                Visual(VisualKind.AlbumArt, 0.1, 0.35)

                SubIDEntry("1") {
                    Music(2.5)
                    Remix("M-VGMDB-AL-106577-6")
                }
            }

            Entry {
                id = "M-VGMDB-AL-96288"
                title = "Megumi no Ame"

                Visual(VisualKind.AlbumArt, 0.15, 0.45)

                SubIDEntry("1") {
                    Music(3.0)
                }
            }

            Entry {
                id = "M-VGMDB-AL-70716"
                title = "over and over"

                Visual(VisualKind.AlbumArt, 0.05, 0.3)

                SubIDEntry("1") {
                    Music(5.0)
                }
            }
        }
    }

    Entry {
        id = "M-VGMDB-AR-12665"
        title = "Komatsu Mikako"

        Contains(MusicVocalImageContainFactor) {
            Contains("M-VGMDB-AL-45187-1")
        }
    }

    Entry {
        id = "M-VGMDB-AR-18208"
        title = "Takada Yuuki"

        Contains("M-46", 0.25)
        Contains("M-17", 1.0 / 9.0)
        Contains(MusicVocalImageContainFactor) {
            Contains("M-VGMDB-AL-75344-4", 1.0 / 3.0)
        }
    }

    Entry {
        id = "M-VGMDB-AR-18231"
        title = "Yamaguchi Megumi"

        Contains("M-46", 0.25)
    }

    Entry {
        id = "M-VGMDB-AR-16233"
        title = "Toda Megumi"

        Contains("M-46", 0.25)
    }

    Entry {
        id = "M-VGMDB-AR-18205"
        title = "Takeo Ayumi"

        Contains("M-46", 0.25)
    }

    Entry {
        id = "M-36"
        title = "Will Stetson"

        Contains("M-37", 0.3)
        Contains("M-45", 0.45)
    }

    Entry {
        id = "M-VGMDB-AR-6876"
        title = "Hayami Saori"

        Contains(MusicVocalImageContainFactor) {
            // oregairu songs
            Contains(0.5) {
                Contains("M-VGMDB-AL-37999-1")
                Contains("M-VGMDB-AL-51394-1")
                Contains("M-VGMDB-AL-96290-1")
            }

            //sora yori group
            Contains(1.0 / 4.0) {
                Contains("M-VGMDB-AL-73544")
            }
        }
    }

    Entry {
        id = "M-VGMDB-AR-11436"
        title = "Toyama Nao"

        Contains(MusicVocalImageContainFactor) {
            // oregairu songs
            Contains(0.5) {
                Contains("M-VGMDB-AL-37999-1")
                Contains("M-VGMDB-AL-51394-1")
                Contains("M-VGMDB-AL-96290-1")
            }

            // oregairu solo songs
            Contains("M-VGMDB-AL-51394-3")
            Contains("M-VGMDB-AL-37999-2")

            Entry {
                id = "M-VGMDB-AL-93329"
                title = "Aruite Ikou!"

                Visual(VisualKind.AlbumArt, 0.15, 0.2)

                SubIDEntry("1") {
                    Music(4.0)
                }
            }
        }
    }

    Entry {
        id = "M-VGMDB-AR-26898"
        title = "Kito Akari"

        // known as the va of sayu
        // wtf do you mean by kanata???
        // *insert high-copium pasta about love live < rst but in reality it's the opposite*

        Contains("M-VGMDB-AR-30829", 1.0 / 6.0)
        Contains("M-VGMDB-AR-29922", NijiOldGirlContainFactor)

        Contains(
            "M-VGMDB-AL-104618",
            MusicVocalContainFactor + MusicImageContainFactor * MusicFeatArtistFactor
        )

        // the akari kito analogy lol
        AKMEraPart1(0.05)
    }

    Entry {
        id = "M-VGMDB-AR-10934"
        title = "Kayano Ai"

        Contains("M-23", 1.0 / 4.0)
        AKMEraPart1(0.05)
        AKMEraPart2(0.1)
        AKMEraPart2(0.05)
    }

    Entry {
        id = "M-VGMDB-AR-11958"
        title = "Sawai Miku"

        Contains(MusicVocalImageContainFactor) {
            Entry {
                id = "M-VGMDB-AL-49446"
                title = "Colorful."

                Visual(VisualKind.AlbumArt, 0.1, 0.2)

                SubIDEntry("1") {
                    Music(2.5)
                }
            }

            Contains("M-10", 0.5)
            Contains("M-11", 0.5)
        }
    }

    Entry {
        id = "M-12"
        title = "kamaboko"

        Contains("M-11", 0.5)
    }

    Entry {
        id = "M-VGMDB-AR-6783"
        title = "Hanazawa Kana"

        Contains(MusicVocalImageContainFactor) {
            // Sanshuu Chuugaku Yuushabu (post-Sonoko)
            Contains(1.0 / 5.0) {
                Contains("M-VGMDB-AL-114186")
            }
            //sora yori group
            Contains(1.0 / 4.0) {
                Contains("M-VGMDB-AL-73544")
            }

            Contains("M-VGMDB-AL-82284", 1.0 / 5.0)
        }
    }

    Entry {
        id = "M-VGMDB-AR-10253"
        title = "Mimori Suzuko"

        Contains(MusicVocalImageContainFactor) {
            // Sanshuu Chuugaku Yuushabu (pre-Sonoko)
            Contains(1.0 / 4.0) {
                Contains("M-VGMDB-AL-47678")
            }

            // post-Sonoko
            Contains(1.0 / 5.0) {
                Contains("M-VGMDB-AL-114186")
            }

            // We May Never Meet Again, But I Will Never Forget Your Voice
            Entry {
                id = "M-VGMDB-AL-69821"
                title = "Egao no Kimi e"

                Visual(VisualKind.AlbumArt, 0.25, 0.2)

                SubIDEntry("1") {
                    Music(3.5)
                }
            }
        }
    }

    Entry {
        id = "M-VGMDB-AR-16166"
        title = "Inagawa Eri"

        // le cat va
        Contains(MusicVocalImageContainFactor) {
            Contains("M-18", 1.0 / 4.0)
            Contains("M-VGMDB-AR-32295", 1.0 / 51.0)
        }
    }

    Entry {
        id = "M-VGMDB-AR-30564"
        title = "Tono Hikaru"

        // chao e co gai hoan tinh
        Contains(MusicVocalImageContainFactor) {
            Contains("M-20", 1.0 / 4.0)
        }
    }

    Entry {
        id = "M-VGMDB-AR-26886"
        title = "WEAVER"

        Contains(MusicVocalImageContainFactor) {
            // lemur
            Entry {
                id = "M-VGMDB-AL-51918"
                title = "Kuchizuke Diamond"

                Visual(VisualKind.AlbumArt, 0.1, 0.25)

                SubIDEntry("1") {
                    Music(3.5)
                    OsuSong(personal = 4.0, community = 5.0)
                }
            }
        }
    }

    Entry {
        id = "M-VGMDB-AR-15766"
        title = "mimimemeMIMI"

        Contains(MusicVocalImageContainFactor) {
            Entry {
                id = "M-VGMDB-AL-52045"
                title = "CANDY MAGIC"

                // yuki takao version: https://vgmdb.net/album/52045
                Visual(VisualKind.AlbumArt, 0.1, 0.3)
                // mememememememe version: https://vgmdb.net/album/52046
                Visual(VisualKind.AlbumArt, 0.3, 0.35)

                SubIDEntry("1") {
                    Music(1.0)
                }
            }

            Entry {
                id = "M-VGMDB-AL-59371"
                title = "hare bare fanfare"

                Visual(VisualKind.AlbumArt, 0.5, 0.35)

                // kek
                SubIDEntry("1") {
                    Music(4.0)

                    OsuSong(personal = 6.0, community = 3.0)
                }

                SubIDEntry("3", "CANDY MAGIC ~Piano Live Version~") {
                    Remix("M-VGMDB-AL-52045-1")
                }
            }
        }
    }

    Entry {
        id = "M-VGMDB-AR-17342"
        title = "DAOKO"

        // vocal: ImageVocalContainFactor * 0.8
        Contains("M-VGMDB-AL-69257", MusicVocalContainFactor + MusicImageContainFactor / 2)
    }

    Entry {
        id = "M-VGMDB-AR-15121"
        title = "Yonezu Kenshi"

        // vocal: ImageVocalContainFactor * 0.2
        // music + lyrics + arrangement: 0.5 * (1.0 - ImageVocalContainFactor)
        Contains(
            "M-VGMDB-AL-69257", MusicInstContainFactor + MusicImageContainFactor / 2
        )
    }

    Entry {
        id = "M-VGMDB-AL-69257"
        title = "Uchiage Hanabi"

        Visual(VisualKind.AlbumArt, 0.1, 0.2)

        SubIDEntry("1") {
            Music(2.0)
        }
    }

    Entry {
        id = "M-VGMDB-AR-11952"
        title = "LiSA"

        Contains(MusicVocalImageContainFactor) {
            Entry {
                id = "M-VGMDB-AL-33537"
                title = "crossing field"

                Visual(VisualKind.AlbumArt, 0.1, 0.2)

                SubIDEntry("1") {
                    Music(1.0)
                }
            }
        }
    }

    Entry {
        id = "M-VGMDB-AR-26614"
        title = "kemu"

        Contains("M-MAL-36631")
        Contains("M-41", 0.5)
        Contains("M-43", 0.25)
    }

    Entry {
        id = "M-VGMDB-AR-4276"
        title = "yuiko"

        Contains("M-41", 0.5)

        // backing vocal for akogare future sign (piano arrange ver.)
        Contains("M-VGMDB-AL-86622-2", 0.05)
    }

    Entry {
        id = "M-42"
        title = "H△G"

        Contains("M-43", 0.75)

        Entry {
            id = "M-63"
            title = "Everlasting Night of Teenage Girls"

            Entry {
                id = "M-64"
                title = "Shoujotachi no Owaranai Yoru"
                Music(6.0)
            }

            Entry {
                id = "M-65"
                title = "Colorful"
                // [prismatic]
                // 1-2 1-2 1-2 1-2
                // "imagine ruining a 2013 video comment section because of 1-2 xD"
                Music(4.5)
                // cringeworthy material: https://www.youtube.com/watch?v=_3aqQaH9AWM (it's me who made that)
            }
        }
    }

    Entry {
        id = "M-44"
        title = "Chiho"

        Contains("M-42", 0.5)
    }

    Entry {
        id = "M-VGMDB-AR-9455"
        title = "Larval Stage Planning"

        Contains(MusicVocalImageContainFactor) {
            Contains("M-VGMDB-AL-47402")
        }
    }

    Entry {
        id = "M-VGMDB-AR-29251"
        title = "Iwahashi Yuka"

        // t̷̤̀h̵̙̰̒ẽ̷̥̋ ̶̺͔̌͘h̴̡̜̐̎o̴̥͉͒̊n̴͕̈́̎ǰ̷̢͜ő̸̞͎̈ủ̵͔ͅ ̴͔̘̏k̸̛͉̉a̵̯̣͑͆ŝ̴̝u̶͉̠̎̂m̵̞͛i̷͙͉͋ ̴̨̥̓ḯ̵͖̺n̷̲̉̌c̷̪̓i̴̢͎̋d̵̬͛e̸̗̓ń̷͓̤͠t̷̮̭̄̐
        Contains("M-50", 1.0 / 9.0)
        Contains("M-VGMDB-AR-30829", 1.0 / 6.0)
    }

    Entry {
        id = "M-VGMDB-AR-9797"
        title = "Yuki Aoi"

        Contains(MusicVocalImageContainFactor) {
            // petit milady
            Contains(1.0 / 2.0) {
                Entry {
                    id = "M-VGMDB-AL-78478"
                    title = "360° Hoshi no Orchestra"

                    Visual(VisualKind.AlbumArt, 0.15, 0.2)

                    SubIDEntry("1") {
                        // coco's Insane
                        // Akito's Insane
                        // ailv's Insane
                        // Seto's Insane
                        // Trynna's Insane
                        // Doj's Insane
                        // Insane
                        // osugame
                        Music(2.5)
                        OsuSong(personal = 6.0, community = 0.0)
                    }
                }
            }

            Contains("M-VGMDB-AL-30302-2")
        }
    }

    Entry {
        id = "M-VGMDB-AR-29249"
        title = "Makino Amane"

        // le gigachad seiyuu herself
        // such a true sigma chad

        // rst shit
        Contains("M-VGMDB-AR-30829", 1.0 / 6.0)

        // we live in a society
        // we live in a society
        // we live in a society
        // we live in a society
        // we live in a society
        // rst shills are truly on another level of stupidity
        Contains(0.5) {
            Entry {
                id = "M-60"
                title = "Cobalt Memories (Amane Makino ver.)"
                // https://www.youtube.com/watch?v=_IWGubxbp1k

                // rst shills when their dumb lore goes deeper than their gf's pussy

                // her voice kinda fits with the song ngl
                // new kano inc (jk)
                Music(2.5)
            }
        }
    }

    // if you think amanero being ranked is bad already
    // lol clueless

    // say goodbye to your sanity
    Entry {
        id = "M-VGMDB-AR-8480"
        title = "Hidaka Rina"

        AKMEraPart1(0.3)
        AKMEraPart2(0.35)
        AKMEraPart3(0.3)
        // (not the whole cricri unit)
        Contains("M-23", 0.25)

        Contains(MusicVocalImageContainFactor) {
            Contains("M-VGMDB-AL-95314")
            Contains("M-VGMDB-AL-116977-11")
            Contains("M-VGMDB-AL-76155", 0.25)
            // additional 0.25 because every song on this album
            // is sung by rosia and another girl
        }
    }

    Entry {
        id = "M-VGMDB-AR-14761"
        title = "Murakawa Rie"

        AKMEraPart1(0.2)
        AKMEraPart2(0.3)
        AKMEraPart3(0.3)
        Contains("M-23", 0.25)
        // 765
        Contains("M-VGMDB-AR-32295", 1.0 / 51.0)

        Contains(MusicVocalImageContainFactor) {
            Contains("M-VGMDB-AL-95313")
            Contains("M-VGMDB-AL-45361-1")
            Contains("M-VGMDB-AL-76155-2", 0.25)
            // additional 0.25 because akm is sung by rosia and jacklyn
            // (not the whole cricri unit)
        }
    }

    Entry {
        id = "M-VGMDB-AR-29487"
        title = "Takahiro Yuba"
        // aka the gigachad who made akm and destroyed civilization as we know it

        Contains("M-VGMDB-AL-76155-2", MusicInstContainFactor)
        Contains("M-VGMDB-AL-74440-6", MusicInstContainFactor * 2 / 3)
        Contains("M-VGMDB-AL-108194-5", MusicInstContainFactor * 2 / 3)
    }

    Entry {
        id = "M-VGMDB-AR-6799"
        title = "nayuta"

        Contains(MusicVocalImageContainFactor) {
            Entry {
                id = "M-VGMDB-AL-74440"
                title = "Sora ni Kakaru Kimi no Koe."

                Visual(VisualKind.AlbumArt, 0.6, 0.3)
                SubIDEntry("6", "Azure Reunion") {
                    Music(6.0)
                    Remix("M-VGMDB-AL-108194-5")
                }
            }
        }

        Contains(MusicInstContainFactor / 3) {
            Contains("M-VGMDB-AL-74440-6")
            Contains("M-VGMDB-AL-108194-5")
        }
    }

    Entry {
        id = "M-VGMDB-AR-8196"
        title = "Nanahira"
        // aka the hasegawa mii utaite

        Contains(MusicVocalImageContainFactor) {
            Entry {
                id = "M-VGMDB-AL-108194"
                title = "Nanairo Ribbon"

                Visual(VisualKind.AlbumArt, 0.4, 0.5)

                SubIDEntry("5", "Azure Reunion") {
                    Music(6.0)
                }
            }
        }
    }

    Entry {
        id = "M-VGMDB-AR-30942"
        title = "Yunomi" // the "kawaii future bass" dude

        Contains(
            "M-VGMDB-AL-104618",
            MusicInstContainFactor + MusicImageContainFactor * MusicMainArtistFactor
        )
    }
}
''';
      final lines = LineSplitter.split(source).toList(growable: false);
      void check(String id, int lineFrom, int lineTo, int numIndent) {
        final block = getEntryBlock(lines, id);
        expect(block != null, true);
        expect(block!.indentation.codeUnits.any((c) => c != 32), false);
        expect(block.indentation.length, numIndent);
        expect(block.range.from.line + 1, lineFrom);
        expect(block.range.to.line + 1, lineTo);
      }

      check("M-VGMDB-AR-8196", 986, 1003, 8);
      check("M-VGMDB-AL-108194", 992, 1001, 16);
      check("M-VGMDB-AL-108194-5", 998, 1000, 20);
    });
  });
}
