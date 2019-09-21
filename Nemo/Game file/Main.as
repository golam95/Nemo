package {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import caurina.transitions.Tweener;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.utils.setTimeout;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.text.engine.TabAlignment;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLVariables;
	import flash.net.URLRequestMethod;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLLoader;



	public class Main extends MovieClip {
		private var bg_speed: Number = 5;
		public var bg_mc: MovieClip;
		private var menu_mc: MovieClip;
		private var levelpanel_mc: MovieClip;
		private var soundpanel_mc: MovieClip;
		private var instructionpanel_mc: MovieClip;
		private var aboutpanel_mc: MovieClip;
		private var highscorepanel_mc: MovieClip;
		private var selecthero_mc: MovieClip;

		//score board
		private var insectaleftscore_mc: MovieClip;
		private var insectarightscore_mc: MovieClip;
		

		//bullet
		private var nemoBullet: Array = new Array;
		private var bossoneBullet: Array = new Array;
		private var angryfishoneBullet: Array = new Array;


		private var nemoBullet_mc: MovieClip;
		private var invalidMove: Boolean = false;

		private var flashbg_mc: MovieClip;
		//select hero
		private var nemo_1: MovieClip;
		//end hero
		//
		private var scoregame_mc: MovieClip;
		private var hero_X: int = 0;
		private var hero_Y: int = 0;

		//mark
		var markScore: MovieClip = new markclass();
		var markScore1: MovieClip = new mark1class();
		var bloodangryfish: MovieClip = new bloodangryfishclass();
		var bloodboss_mc: MovieClip = new bossvanishClass();
		var bomfishblood_mc: MovieClip = new bombfishbrustclass();
		//

		//insecta left

		private var insectaLeftAppear: Timer;
		private var insectaRightAppear: Timer;
		private var angryfishAppear: Timer;
		private var coinboxAppear: Timer;
		private var bossOneAppear: Timer;
		private var bubbleAppear: Timer;
		private var bombfishAppear: Timer;



		private var isGameOver: Boolean;
		private var isGameoverangryfish: Boolean;
		private var randomshoot: Boolean;
		private var randomshoot1: Boolean;
		private var randomshootangryfish: Boolean;

		//Boss commig
		private var cehckTime: Timer;
		private var bossOnebullet_mc: MovieClip;
		private var angryfishbullet_mc: MovieClip;
		private var timer: Timer;
		private var shoot_timer: Timer;
		private var bossMovement: Boolean;


		private var insectaLeftcount: Number = 0;
		private var insectaRightcount: Number = 0;
		private var gameScore: Number = 0;


		//Nemo live
		private var nemolive_mc: MovieClip = new nemoliveClass;
		private var nemoLiveprogress_mc: MovieClip = new liveprogressclass;
		private var liveContainer_mc: MovieClip = new MovieClip;
		private var outerContainer_mc: MovieClip = new progressContainerclass;



		private var liveContainerboss_mc: MovieClip = new MovieClip;
		private var outerbosspro_mc: MovieClip = new progressContainerclass;
		private var bosslivepro_mc: MovieClip = new bossprogressClass;
		private var bosslive_mc: MovieClip = new bossproClass;



		//Game over panel
		private var gameoverBoard_mc: MovieClip;
		private var gamecloseLevel_mc: MovieClip;
		private var currentNemo: Number = 0;

		private var bombfishmovement: Boolean;

		private var gameLevel: Number = 1;
		private var getLevel: Number = 0;

		private var levelalldone: Boolean = false;

		private var eatsound: MovieClip;
		private var livesound: MovieClip;
		private var angryfishSound_mc: MovieClip;
		private var bossOneSound_mc: MovieClip;




		//end game over panel


		public function Main() {
			// constructor code
			bg_mc = new bgClass;
			this.addChild(bg_mc);
			bg_mc.visible = false;

			flashbg_mc = new beforestartgameclass();
			this.addChild(flashbg_mc);


			menu_mc = new menuClass();
			menu_mc.width = 420;
			menu_mc.height = 470;
			menu_mc.x = 360;
			menu_mc.y = 50;
			this.addChild(menu_mc);


			//Show levelpanel
			levelpanel_mc = new labelboardclass();
			levelpanel_mc.width = 510;
			levelpanel_mc.height = 470;
			levelpanel_mc.x = 387;
			levelpanel_mc.y = 120;
			this.addChild(levelpanel_mc);
			levelpanel_mc.visible = false;


			//sound panel
			instructionpanel_mc = new instructionClass();
			instructionpanel_mc.width = 510;
			instructionpanel_mc.height = 470;
			instructionpanel_mc.x = 387;
			instructionpanel_mc.y = 120;
			this.addChild(instructionpanel_mc);
			instructionpanel_mc.visible = false;
			//end sound panel

			//sound panel settings
			soundpanel_mc = new sound_panelclass();
			soundpanel_mc.width = 510;
			soundpanel_mc.height = 470;
			soundpanel_mc.x = 387;
			soundpanel_mc.y = 120;
			this.addChild(soundpanel_mc);
			soundpanel_mc.visible = false;



			//sound panel settings


			//about panel

			aboutpanel_mc = new aboutClass();
			aboutpanel_mc.width = 510;
			aboutpanel_mc.height = 470;
			aboutpanel_mc.x = 387;
			aboutpanel_mc.y = 120;
			this.addChild(aboutpanel_mc);
			aboutpanel_mc.visible = false;
			//end about panel

			//High score
			highscorepanel_mc = new hight_scoreClass();
			highscorepanel_mc.width = 390;
			highscorepanel_mc.height = 470;
			highscorepanel_mc.x = 480;
			highscorepanel_mc.y = 110;
			this.addChild(highscorepanel_mc);
			highscorepanel_mc.visible = false;
			//End score

			//Select hero
			selecthero_mc = new welcom_nemoclass();
			selecthero_mc.width = 510;
			selecthero_mc.height = 470;
			selecthero_mc.x = 387;
			selecthero_mc.y = 120;
			this.addChild(selecthero_mc);
			selecthero_mc.visible = false;
			//select hero

			//start score relate
			scoregame_mc = new scoreboardClass();
			this.addChild(scoregame_mc);
			scoregame_mc.visible = false;


			



			//Insecta class

			insectaleftscore_mc = new insectascoreleftclass();
			this.addChild(insectaleftscore_mc);
			insectaleftscore_mc.visible = false;

			insectarightscore_mc = new insectascorerightclass();
			this.addChild(insectarightscore_mc);
			insectarightscore_mc.visible = false;



			//very difficult to handle
			this.addChild(nemolive_mc);
			nemolive_mc.visible = false;

			liveContainer_mc.addChild(outerContainer_mc);
			liveContainer_mc.addChild(nemoLiveprogress_mc);
			stage.addChild(liveContainer_mc);
			liveContainer_mc.x = 585;
			liveContainer_mc.y = 14;
			liveContainer_mc.visible = false;


			this.addChild(bosslive_mc);
			bosslive_mc.visible = false;

			liveContainerboss_mc.addChild(outerbosspro_mc);
			liveContainerboss_mc.addChild(bosslivepro_mc);
			stage.addChild(liveContainerboss_mc);
			liveContainerboss_mc.x = 992;
			liveContainerboss_mc.y = 12;
			liveContainerboss_mc.visible = false;


			//done the reduce step


		


			//end score


			gameoverBoard_mc = new gameoverbodyClass();
			gameoverBoard_mc.x = 400;
			gameoverBoard_mc.y = 200;
			stage.addChild(gameoverBoard_mc);
			gameoverBoard_mc.visible = false;

			gamecloseLevel_mc = new nextlevelpanelclass();
			gamecloseLevel_mc.x = 400;
			gamecloseLevel_mc.y = 310;
			stage.addChild(gamecloseLevel_mc);
			gamecloseLevel_mc.visible = false;


			gamecloseLevel_mc.win1_mc.visible = false;
			gamecloseLevel_mc.win2_mc.visible = false;
			gamecloseLevel_mc.win3_mc.visible = false;

			gamecloseLevel_mc.winlock1.visible = true;
			gamecloseLevel_mc.winlock1.visible = true;
			gamecloseLevel_mc.winlock1.visible = true;







			//add event listener

			menu_mc.btn_instruction.addEventListener(MouseEvent.CLICK, mouseHandlerInstruction);
			menu_mc.btn_level.addEventListener(MouseEvent.CLICK, mouseHandlerLevel);
			menu_mc.btn_sound.addEventListener(MouseEvent.CLICK, mouseHandlerSound);
			menu_mc.btn_about.addEventListener(MouseEvent.CLICK, mouseHandlerAbout);
			menu_mc.btn_score.addEventListener(MouseEvent.CLICK, mouseHandlerScore);
			menu_mc.btn_start.addEventListener(MouseEvent.CLICK, mouseHandlerStartscore);

			//select nemo actionlistener;

			selecthero_mc.nemo_1_hero.addEventListener(MouseEvent.CLICK, mouseHandlerSelectNemo);
			selecthero_mc.nemo_2_hero.addEventListener(MouseEvent.CLICK, mouseHandlerSelectNemo);
			selecthero_mc.nemo_3_hero.addEventListener(MouseEvent.CLICK, mouseHandlerSelectNemo);


			levelpanel_mc.btn_cancel.addEventListener(MouseEvent.CLICK, mouseHandlerCancel);
			soundpanel_mc.btn_cancel.addEventListener(MouseEvent.CLICK, mouseHandlerCancel);
			instructionpanel_mc.btn_cancel.addEventListener(MouseEvent.CLICK, mouseHandlerCancel);
			aboutpanel_mc.btn_cancel.addEventListener(MouseEvent.CLICK, mouseHandlerCancel);
			highscorepanel_mc.btn_cancel.addEventListener(MouseEvent.CLICK, mouseHandlerCancel);
			selecthero_mc.btn_cancel.addEventListener(MouseEvent.CLICK, mouseHandlerCancel);


			//Game Over mc show;

			//Game over mc down;
			////


			insectaLeftAppear = new Timer((rnd(1, 5) * 1000), 1);
			insectaLeftAppear.addEventListener(TimerEvent.TIMER_COMPLETE, onInsectaLeftAppearTimer);

			insectaRightAppear = new Timer((rnd(1, 5) * 500), 1);
			insectaRightAppear.addEventListener(TimerEvent.TIMER_COMPLETE, onInsectaRightAppearTimer);

			angryfishAppear = new Timer((rnd(1, 5) * 1000), 1);
			angryfishAppear.addEventListener(TimerEvent.TIMER_COMPLETE, onangryfishAppearTimer);

			coinboxAppear = new Timer((rnd(1, 5) * 3000), 1);
			coinboxAppear.addEventListener(TimerEvent.TIMER_COMPLETE, oncoinboxAppearTimer);

			//initalzation of timer class;

			bubbleAppear = new Timer((rnd(1, 5) * 1000), 1);
			bubbleAppear.addEventListener(TimerEvent.TIMER_COMPLETE, onbubbleAppearTimer);



			bombfishAppear = new Timer((rnd(1, 5) * 1000), 1);
			bombfishAppear.addEventListener(TimerEvent.TIMER_COMPLETE, onbombfishAppearTimer);


			//Level 1 boss;

			bossOneAppear = new Timer(20);
			bossOneAppear.addEventListener(TimerEvent.TIMER_COMPLETE, onbossoneAppearTimer);


			//end the timer class;

			timer = new Timer(3000);
			timer.addEventListener(TimerEvent.TIMER, updateTimeHandler);

			cehckTime = new Timer(1000);
			cehckTime.addEventListener(TimerEvent.TIMER, checktimeHandler);


			shoot_timer = new Timer(3000);
			shoot_timer.addEventListener(TimerEvent.TIMER, updateshootpanel);
			shoot_timer.start();


			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);

		}
		//end event listener;

		private function mouseHandlerStartscore(event: MouseEvent): void {

			selecthero_mc.visible = true;
			menu_mc.visible = false;
		}

		private function mouseHandlerInstruction(event: MouseEvent): void {
			instructionpanel_mc.visible = true;
			menu_mc.visible = false;
		}
		private function mouseHandlerLevel(event: MouseEvent): void {
			levelpanel_mc.visible = true;
			menu_mc.visible = false;
		}
		private function mouseHandlerSound(event: MouseEvent): void {
			soundpanel_mc.visible = true;
			menu_mc.visible = false;
		}

		private function mouseHandlerAbout(event: MouseEvent): void {
			aboutpanel_mc.visible = true;
			menu_mc.visible = false;
		}
		private function mouseHandlerScore(event: MouseEvent): void {
			highscorepanel_mc.visible = true;
			menu_mc.visible = false;
			fetchvalue();
		}

		

		private function mouseHandlergamoverCancel(event: MouseEvent): void {

			//give

			gameLevel = 1;
			bg_mc.visible = false;
			visibleallPanel();
			gameoverBoard_mc.visible = false;
			gamecloseLevel_mc.visible = false;
			//trace('action occour');
		}
		private function mouseHandlerPlayagain(event: MouseEvent): void {


			if ((currentNemo > 0)) {


				startGame(currentNemo);

				//Looping sound

				//End looping sound

				insectaLeftcount = 0;
				insectaRightcount = 0;
				gameScore = 0;
				scoregame_mc.txtscore.text = 0;
				insectaleftscore_mc.txtinsleft.text = 0;
				insectarightscore_mc.txtinsright.text = 0;
				nemoLiveprogress_mc.width = 100;

				gameLevel = 1;
			}


		}


		//gamecontinue
		private function mousehandlerGamecontinue(event: MouseEvent): void {

			if ((gameLevel < 4)) {
				gameLevel += 1;
			} else {
				gameLevel = 1;
			}

			if (levelalldone == true) {

				gameLevel = 1;
				gamecloseLevel_mc.winlock1.visible = true;
				gamecloseLevel_mc.win1_mc.visible = false;

				gamecloseLevel_mc.winlock2.visible = true;
				gamecloseLevel_mc.win2_mc.visible = false;

				gamecloseLevel_mc.winlock3.visible = true;
				gamecloseLevel_mc.win3_mc.visible = false;

				insectaLeftcount = 0;
				insectaRightcount = 0;
				gameScore = 0;
				scoregame_mc.txtscore.text = 0;
				insectaleftscore_mc.txtinsleft.text = 0;
				insectarightscore_mc.txtinsright.text = 0;
				nemoLiveprogress_mc.width = 100;


			}

			//trace('Here the game level two= '+gameLevel);

			startGame(currentNemo);
			getLevel = gameLevel;

		}
		//end the game continue


		private function mouseHandlerCancel(event: MouseEvent): void {
			levelpanel_mc.visible = false;
			soundpanel_mc.visible = false;
			instructionpanel_mc.visible = false;
			aboutpanel_mc.visible = false;
			highscorepanel_mc.visible = false;
			selecthero_mc.visible = false;
			menu_mc.visible = true;
		}

		private function mouseHandlerSelectNemo(event: MouseEvent): void {
			var nemo_Name: String = event.currentTarget.name;
			var which_nemo: int = parseInt(nemo_Name.charAt(5));
			var selectedNemo: MovieClip = event.currentTarget as MovieClip;
			Tweener.addTween(selectedNemo, {
				y: selectedNemo.y - 120,
				time: 0.5
			});
			Tweener.addTween(selectedNemo, {
				y: selectedNemo.y,
				time: 2.6,
				delay: 0.6,
				onComplete: removeSelectAfterDely(which_nemo)
			});
		}

		private function removeSelectAfterDely(select: int): void {
			setTimeout(function () {
				startGame(select);
			}, 1900);
		}
		private function startGame(nemo: int): void {
			if ((nemo == 1)) {
				nemo_1 = new nemo3Class;
			} else if ((nemo == 2)) {
				nemo_1 = new nemo1Class;
			} else {
				nemo_1 = new nemo2class;
			}



			if ((gameLevel == 1)) {

				insectaLeftcount = 0;
				insectaRightcount = 0;
				gameScore = 0;
				scoregame_mc.txtscore.text = 0;
				insectaleftscore_mc.txtinsleft.text = 0;
				insectarightscore_mc.txtinsright.text = 0;
				nemoLiveprogress_mc.width = 100;


			}

			if (((gameLevel == 2) || (gameLevel == 3))) {

				shoot_timer.start();

			}


			bosslivepro_mc.width = 105;

			nemo_1.visible = true;
			currentNemo = 1;
			//check background image null 
			bg_mc.visible = true;
			scoregame_mc.visible = true;
			insectaleftscore_mc.visible = true;
			insectarightscore_mc.visible = true;



			liveContainer_mc.visible = true;
			nemolive_mc.visible = true;
		


			//check nemo
			false_allpanel();
			nemo_1.scaleX = nemo_1.scaleY = 0.5;
			nemo_1.x = nemo_1.width / 2 + 100;
			nemo_1.y = nemo_1.height / 2 + 50;
			this.addChild(nemo_1);
			this.addEventListener(Event.ENTER_FRAME, eventHandleGame);

			//lets move the insecta

			isGameOver = false;
			isGameoverangryfish = false;
			insectaLeftAppear.start();
			createLeftInsecta();
			insectaRightAppear.start();
			createRightInsecta();
			angryfishAppear.start();
			createAngryfish();
			coinboxAppear.start();
			createCoinbox();

			cehckTime.start();
			createBubble();
			bubbleAppear.start();


		}

		private function eventHandleGame(e: Event): void {

			nemo_1.x += hero_X;
			nemo_1.y += hero_Y;

			bg_mc.x -= bg_speed;

			if (bg_mc.x < -1132) {
				bg_mc.x = 0;
				//trace('background');
			}

			createBullet();
			createBossbullet();
			nemostageBoundary();
			createAngryfishbullet();
			//actionlistener

			gamecloseLevel_mc.btngmovercancel.addEventListener(MouseEvent.CLICK, mouseHandlergamoverCancel);
			gamecloseLevel_mc.gamecontinue.addEventListener(MouseEvent.CLICK, mousehandlerGamecontinue);
			gameoverBoard_mc.btngmovercancel.addEventListener(MouseEvent.CLICK, mouseHandlergamoverCancel);
			gameoverBoard_mc.btnplayagain.addEventListener(MouseEvent.CLICK, mouseHandlerPlayagain);

		

		}
		private function nemostageBoundary(): void {

			if (nemo_1.x < 0) {
				nemo_1.x = 50;
			} else if (nemo_1.y < 0) {
				nemo_1.y = 50;
			} else if (nemo_1.x + nemo_1.width > stage.stageWidth) {
				nemo_1.x = stage.stageWidth - nemo_1.width;
			} else if (nemo_1.y + nemo_1.height > stage.stageHeight) {
				nemo_1.y = stage.stageHeight - nemo_1.height;
			}
		}

		//
		private function onInsectaLeftAppearTimer(event: TimerEvent): void {
			createLeftInsecta();
			insectaLeftAppear.delay = rnd(1, 5) * 1000;
			insectaLeftAppear.start();
		}
		private function onInsectaRightAppearTimer(event: TimerEvent) {
			createRightInsecta();
			insectaRightAppear.delay = rnd(3, 7) * 500;
			insectaRightAppear.start();
		}
		private function onangryfishAppearTimer(event: TimerEvent) {
			createAngryfish();
			angryfishAppear.delay = rnd(1, 5) * 600;
			angryfishAppear.start();
		}

		private function onbombfishAppearTimer(event: TimerEvent) {
			cretebombfish();
			bombfishAppear.start();
		}



		private function oncoinboxAppearTimer(event: TimerEvent) {
			createCoinbox();
			coinboxAppear.delay = rnd(1, 5) * 5000;
			coinboxAppear.start();
		}

		private function onbossoneAppearTimer(event: TimerEvent) {
			createBossone();
			bossOneAppear.start();

		}

		private function onbubbleAppearTimer(event: TimerEvent) {
			createBubble();
			bubbleAppear.delay = rnd(1, 5) * 1000;
			bubbleAppear.start();
		}

		//bubbleClass;
		//Create Leftinsecta;

		private function createLeftInsecta(): void {

			var leftinsecta: insectaleftClass = new insectaleftClass;
			leftinsecta.width = 40;
			leftinsecta.height = 40;
			leftinsecta.cacheAsBitmap = true;
			this.addChild(leftinsecta);
			leftinsecta.y = rnd(30, 580);

			var leftinsectaTimer: Timer = new Timer(20, 1);
			leftinsectaTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
			leftinsectaTimer.start();

			function onTimer(event: TimerEvent): void {
				if ((isGameOver == true)) {
					remove();
				}
				if ((isGameOver == false)) {
					if (leftinsecta.x < 1130) {
						leftinsecta.x += 1;
						leftinsectaTimer.start();

						if (leftinsecta.hitTestObject(nemo_1) == true) {

							//count point


							eatsound = new eatingsoundclass();
							eatsound.play();




							insectaLeftcount++;
							gameScore += 3;
							insectaleftscore_mc.txtinsleft.text = insectaLeftcount;
							scoregame_mc.txtscore.text = gameScore;
							//End count
							remove();
							addChild(markScore);
							markScore.x = leftinsecta.x;
							markScore.y = leftinsecta.y;

							Tweener.addTween(markScore, {
								x: 245.95,
								time: 0.5
							});
							Tweener.addTween(markScore, {
								y: 21.55,
								time: 2.6,
								delay: 0.6,
								onComplete: removescoreDely(markScore)
							});

						}

					} else {
						remove();
					}
				}
			}

			function remove(): void {
				if ((leftinsectaTimer != null)) {
					leftinsectaTimer.stop();
					leftinsectaTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
					leftinsectaTimer = null;
				}
				//check to see if the main movie clip contains our coin

				if (contains(leftinsecta)) {
					removeChild(leftinsecta);
				}
			}
		}




		private function createBubble(): void {

			var pondbubble: bubbleClass = new bubbleClass;
			pondbubble.width = 40;
			pondbubble.height = 40;
			pondbubble.cacheAsBitmap = true;
			this.addChild(pondbubble);

			pondbubble.x = rnd(10, 1100);

			pondbubble.y = 600;

			var pondbubbleTimer: Timer = new Timer(20, 1);
			pondbubbleTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
			pondbubbleTimer.start();

			function onTimer(event: TimerEvent): void {
				if ((isGameOver == true)) {
					remove();
				}
				if ((isGameOver == false)) {
					if (pondbubble.y > 50) {
						pondbubble.y -= 1;
						pondbubbleTimer.start();

					} else {
						remove();
					}
				}
			}

			function remove(): void {
				if ((pondbubbleTimer != null)) {
					pondbubbleTimer.stop();
					pondbubbleTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
					pondbubbleTimer = null;
				}

				if (contains(pondbubble)) {
					removeChild(pondbubble);
				}
			}
		}

		//Right Rightinsecta

		private function createRightInsecta(): void {
			var rightinsecta: insectarightClass = new insectarightClass;
			rightinsecta.width = 40;
			rightinsecta.height = 40;
			rightinsecta.cacheAsBitmap = true;
			this.addChild(rightinsecta);

			rightinsecta.x = stage.stageWidth + rightinsecta.width;
			rightinsecta.y = rnd(30, 580);

			var rightinsectaTimer: Timer = new Timer(20, 1);
			rightinsectaTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
			rightinsectaTimer.start();

			function onTimer(event: TimerEvent): void {
				if ((isGameOver == true)) {
					remove();
				}
				if ((isGameOver == false)) {
					if (rightinsecta.x > 1) {
						rightinsecta.x -= 2;
						rightinsectaTimer.start();

						if (rightinsecta.hitTestObject(nemo_1) == true) {

							///

							eatsound = new eatingsoundclass();
							eatsound.play();


							insectaRightcount++;
							gameScore += 2;
							insectarightscore_mc.txtinsright.text = insectaRightcount;
							scoregame_mc.txtscore.text = gameScore;


							remove();
							addChild(markScore1);
							markScore1.x = rightinsecta.x;
							markScore1.y = rightinsecta.y;
							Tweener.addTween(markScore1, {
								x: 442.95,
								time: 0.5
							});
							Tweener.addTween(markScore1, {
								y: 16.55,
								time: 3.6,
								delay: 0.6,
								onComplete: removescorerightDely(markScore1)
							});

						}

					} else {
						remove();
					}
				}
			}
			function remove(): void {
				if ((rightinsectaTimer != null)) {
					rightinsectaTimer.stop();
					rightinsectaTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
					rightinsectaTimer = null;
				}
				//check to see if the main movie clip contains our coin

				if (contains(rightinsecta)) {
					removeChild(rightinsecta);
				}
			}
		}

		//create angry fish

		//private var angryfishAppear:Timer;angryeneclass/onangryfishAppearTimer

		private function createAngryfish(): void {

			var angryfish: MovieClip = new angryfishClass;

			angryfish.cacheAsBitmap = true;
			this.addChild(angryfish);
			angryfish.width = 80;
			angryfish.height = 50;
			angryfish.x = stage.stageWidth + angryfish.width;
			angryfish.y = rnd(50, 530);

			var angryfishTimer: Timer = new Timer(20, 1);
			angryfishTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
			angryfishTimer.start();

			function onTimer(event: TimerEvent): void {



				if (((randomshootangryfish == true) && (gameLevel == 2))) {

					var gererateValue: int = rnd(550, 800);

					if (angryfish.x <= gererateValue) {
						if (contains(angryfish)) {
							angryfishbullet_mc = new angryfishbulletclass;
							addChild(angryfishbullet_mc);
							//add the position
							angryfishbullet_mc.x = angryfish.x + 14;
							angryfishbullet_mc.y = angryfish.y + 10;
							angryfishoneBullet.push(angryfishbullet_mc);
							randomshootAngryfishDelay();
						}


					}


				}

				if (nemoLiveprogress_mc.width <= 0) {
					allstopLevel();
					shoot_timer.reset();
					shoot_timer.stop();
					randomshootangryfish = false;

					remove();
					gameoverBoard_mc.visible = true;
					gameoverBoard_mc.txtfinalscore.text = gameScore;
				}




				if ((isGameoverangryfish == true)) {
					//isGameoverangryfish
					remove();
					//golam
				} else {

					if ((isGameoverangryfish == false)) {
						if (angryfish.x > 1) {
							angryfish.x -= 2;
							angryfishTimer.start();

							for (var i: int = 0; i < nemoBullet.length; i++) {
								var bullet: MovieClip = nemoBullet[i];
								if (angryfish.hitTestObject(bullet) == true) {


									angryfishSound_mc = new angryfishdiesoundclass();
									angryfishSound_mc.play();



									remove();
									gameScore += 3;
									scoregame_mc.txtscore.text = gameScore;
									//blood
									addChild(bloodangryfish);
									bloodangryfish.x = angryfish.x;
									bloodangryfish.y = angryfish.y;
									//end blood
									removeangryfishbloodDely(bloodangryfish);
									removeChild(bullet);
									bullet = null;
									nemoBullet.splice(i, 1);
									i--;
									//
								}
							}

							if (angryfish.hitTestObject(nemo_1) == true) {

								nemoLiveprogress_mc.width -= 20;
								nemo_1.alpha = 0.5;
								nemoposition();
								removenemocrashDely();
							}


							for (var g: int = 0; g < angryfishoneBullet.length; g++) {
								var angryfishboulet: MovieClip = angryfishoneBullet[g] as MovieClip;
								if (angryfishboulet.hitTestObject(nemo_1) == true) {
									nemoLiveprogress_mc.width -= 20;
									nemoposition();
									//trace('nemo live decrease..');
								}

							}


						} else {
							remove();
						}
					}

				}
			}



			function remove(): void {
				if ((angryfishTimer != null)) {
					angryfishTimer.stop();
					angryfishTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
					angryfishTimer = null;
				}
				//check to see if the main movie clip contains our coin

				if (contains(angryfish)) {
					removeChild(angryfish);
				}
			}

		}

		//create coin box

		private function cretebombfish(): void {

			var bomfish: MovieClip = new fishwithbombClass();
			bomfish.width = 50;
			bomfish.height = 50;
			bomfish.cacheAsBitmap = true;
			this.addChild(bomfish);
			bomfish.x = stage.stageWidth + bomfish.width;
			bomfish.y = 300;

			var bombfishTimer: Timer = new Timer(5, 1);
			bombfishTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
			bombfishTimer.start();

			function onTimer(event: TimerEvent): void {

				if ((isGameoverangryfish == true)) {

					removebomfish();

				} else {
					if ((isGameoverangryfish == false)) {


						if (bombfishmovement == true) {

							if (bomfish.x >= 720) {
								bomfish.x -= 2;
							} else {
								bomfish.y -= 1;
								if (bomfish.y == 50) {
									bombfishmovement = false;
								}
							}
							bombfishTimer.start();

						} else {

							if (bomfish.x >= 760) {
								bomfish.x -= 1;

							} else {
								bomfish.y += 1;
								if (bomfish.y == 400) {
									bombfishmovement = true;
								}
							}
							bombfishTimer.start();


						}

					}


					function removebomfish() {

						if ((bombfishTimer != null)) {

							bombfishTimer.stop();
							bombfishTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
							bombfishTimer = null;
						}

						if (contains(bomfish)) {
							removeChild(bomfish);

						}
					}


				}


			}


		}


		private function createCoinbox(): void {
			var coinbox: coinapearclass = new coinapearclass;
			coinbox.width = 50;
			coinbox.height = 50;
			coinbox.cacheAsBitmap = true;
			this.addChild(coinbox);
			coinbox.x = rnd(25, 1146);
			//the bomb timer
			var coinTimer: Timer = new Timer(20, 1);
			coinTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
			coinTimer.start();

			function onTimer(event: TimerEvent) {
				if ((isGameOver == true)) {
					remove();
				}

				if ((isGameOver == false)) {
					if (coinbox.y < 640) {
						coinbox.y += 1;
						coinTimer.start();

						if (nemo_1.hitTestObject(coinbox) == true) {


							livesound = new coinSoundclass();
							livesound.play();




							if (nemoLiveprogress_mc.width < 100) {

								nemoLiveprogress_mc.width += 20;

							}

							scoregame_mc.txtscore.text = gameScore;
							remove();

						}


					} else {
						remove();
					}
				}

				function remove() {
					//If the bomb isn't null
					if ((coinTimer != null)) {
						//Stop the timer, remove the event and make timer null
						coinTimer.stop();
						coinTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
						coinTimer = null;
					}
					//If the bomb is on the stage, remove it
					if (contains(coinbox)) {
						removeChild(coinbox);

					}
				}
			}
		}

		//create boss

		private function createBossone(): void {
			var bossOne: MovieClip;

			if ((gameLevel == 1)) {

				bossOne = new boss1Class;

			} else if ((gameLevel == 2)) {
				bossOne = new boss2Class;
			} else if ((gameLevel == 3)) {
				bossOne = new boss3class;
			}

			bossOne.cacheAsBitmap = true;
			if ((gameLevel == 1)) {
				bossOne.width = 250;
				bossOne.height = 150;
			}

			this.addChild(bossOne);
			bossOne.x = stage.stageWidth + bossOne.width;
			bossOne.y = 200;
			//the bomb timer
			var bossOneTimer: Timer = new Timer(20, 1);
			bossOneTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
			bossOneTimer.start();

			function onTimer(event: TimerEvent) {
				//check the bosslive

				if (bosslivepro_mc.width <= 0) {
					if (contains(bossOne)) {


						bossOneSound_mc = new bossdiesoundclass();
						bossOneSound_mc.play();



						removeChild(bossOne);
					}
					addChild(bloodboss_mc);
					bloodboss_mc.x = bossOne.x;
					bloodboss_mc.y = bossOne.y;
					removeBossDely(bloodboss_mc);

				} else {

					//End the check bosslive

					if ((randomshoot == true)) {
						bossOnebullet_mc = new randombulletClass;
						addChild(bossOnebullet_mc);
						bossOnebullet_mc.width = 40;
						bossOnebullet_mc.height = 23;
						//add the position
						bossOnebullet_mc.x = bossOne.x + 14;
						bossOnebullet_mc.y = bossOne.y + 70;
						bossoneBullet.push(bossOnebullet_mc);
						randomshootDelay();
					}

					if (((randomshoot1 == true) && (gameLevel == 2) || (randomshoot1 == true) && (gameLevel == 3))) {
						bossOnebullet_mc = new randombulletClass;
						addChild(bossOnebullet_mc);
						bossOnebullet_mc.width = 40;
						bossOnebullet_mc.height = 23;
						//add the position
						bossOnebullet_mc.x = bossOne.x + 14;
						bossOnebullet_mc.y = bossOne.y + 105;
						bossoneBullet.push(bossOnebullet_mc);
						randomshootDelay();

					}


					//another code is comming

					if (((isGameOver == true) && (bossMovement == true))) {

						if (bossOne.x >= 820) {
							bossOne.x -= 2;
						} else {
							bossOne.y -= 1;
							if (bossOne.y == 50) {
								bossMovement = false;
							}
						}
						bossOneTimer.start();


						if (nemo_1.hitTestObject(bossOne) == true) {
							nemoLiveprogress_mc.width -= 20;
							nemoposition();
						}


						for (var i: int = 0; i < nemoBullet.length; i++) {
							var nemobullet: MovieClip = nemoBullet[i] as MovieClip;

							if (bossOne.bossonhit != null) {
								if (nemobullet.hitTestObject(bossOne.bossonhit) == true) {
									bossOne.alpha = 5;
									bosslivepro_mc.width -= 5;
									//trace('hit the boss');
									gameScore += 2;
									scoregame_mc.txtscore.text = gameScore;
								}
							}

						}


						for (var b: int = 0; b < bossoneBullet.length; b++) {
							var boosOnebullet: MovieClip = bossoneBullet[b] as MovieClip;
							if (boosOnebullet.hitTestObject(nemo_1) == true) {
								nemoLiveprogress_mc.width -= 20;
								nemoposition();

							}

						}

						if (nemoLiveprogress_mc.width <= 0) {
							bossOneAppear.stop();

							if (contains(bossOne)) {
								removeChild(bossOne);
							}

						}


						for (var p: int = 0; p < nemoBullet.length; p++) {
							var bullet: MovieClip = nemoBullet[p] as MovieClip;
							if (bullet.hitTestObject(bossOne)) {
								removeChild(bullet);
								nemoBullet.splice(p, 1);
								p--;

							}
						}

						//end the first panel 

						//crash the bullet

					} else {
						if (bossOne.x >= 860) {
							bossOne.x -= 2;

						} else {
							bossOne.y += 1;
							if (bossOne.y == 400) {
								bossMovement = true;
							}
						}
						bossOneTimer.start();

						//reduce live nemo because of hit with bossOne;

						if (nemo_1.hitTestObject(bossOne) == true) {
							nemoLiveprogress_mc.width -= 20;
							nemoposition();


						}

						//reduce live boss because of nemobullet

						for (var j: int = 0; j < nemoBullet.length; j++) {
							var nemobullet1: MovieClip = nemoBullet[i] as MovieClip;

							if (bossOne.bossonhit != null) {
								if (nemobullet1.hitTestObject(bossOne.bossonhit) == true) {
									bossOne.alpha = 5;
									bosslivepro_mc.width -= 1;
									gameScore += 2;
									scoregame_mc.txtscore.text = gameScore;

								}
							}

						}
						//reduce live nemo because of bossbullet

						for (var r: int = 0; r < bossoneBullet.length; r++) {
							var boosOnebullet1: MovieClip = bossoneBullet[r] as MovieClip;
							if (boosOnebullet1.hitTestObject(nemo_1) == true) {
								nemoLiveprogress_mc.width -= 20;
								nemoposition();
							}

						}


						for (var l: int = 0; l < nemoBullet.length; l++) {
							var bulletN: MovieClip = nemoBullet[l] as MovieClip;
							if (bulletN.hitTestObject(bossOne)) {
								removeChild(bulletN);
								nemoBullet.splice(l, 1);
								l--;

							}
						}


						if (nemoLiveprogress_mc.width <= 0) {
							bossOneAppear.stop();

							if (contains(bossOne)) {
								removeChild(bossOne);
							}

						}
						//End reduce live nemo because of bossbullet
					}

				}

			}
		}



		public function keyDownHandler(event: KeyboardEvent): void {
			if (event.keyCode == Keyboard.LEFT) {
				nemo_1.scaleX = -0.5;
				hero_X = -5;
				invalidMove = true;

			} else if (event.keyCode == Keyboard.RIGHT) {
				nemo_1.scaleX = 0.5;
				hero_X = 5;
				invalidMove = false;
			} else if (event.keyCode == Keyboard.UP) {
				hero_Y = -5;

			} else if (event.keyCode == Keyboard.DOWN) {
				hero_Y = 5;

			} else if (event.keyCode == Keyboard.B) {
				if ((invalidMove == false)) {
					nemoBullet_mc = new nemoBulletclass;
					addChild(nemoBullet_mc);
					nemoBullet_mc.width = 15;
					nemoBullet_mc.height = 15;
					//add the position
					nemoBullet_mc.x = nemo_1.x + 34;
					nemoBullet_mc.y = nemo_1.y - 14;
					nemoBullet.push(nemoBullet_mc);


				}
			}
		}

		private function createBullet(): void {

			for (var i: int = 0; i < nemoBullet.length; i++) {
				var bullet: MovieClip = nemoBullet[i];

				if (bullet.x > 1136) {
					//trace("remove");
					removeChild(bullet);
					bullet = null;
					nemoBullet.splice(i, 1);
					i--;
				} else {
					bullet.x += 12;

				}


			}
		}

		private function createBossbullet(): void {

			for (var i: int = 0; i < bossoneBullet.length; i++) {
				var bullet: MovieClip = bossoneBullet[i];

				if (bullet.x < 1) {
					removeChild(bullet);
					bullet = null;
					bossoneBullet.splice(i, 1);
					i--;
				} else {
					bullet.x -= 12;

				}
			}
		}

		private function createAngryfishbullet(): void {

			for (var i: int = 0; i < angryfishoneBullet.length; i++) {
				var bullet: MovieClip = angryfishoneBullet[i];

				if (bullet.x < 1) {
					removeChild(bullet);
					bullet = null;
					angryfishoneBullet.splice(i, 1);
					i--;
					//trace('remove the bullet');
				} else {
					bullet.x -= 12;

				}
			}
		}
		

		public function keyUpHandler(event: KeyboardEvent): void {
			if (event.keyCode == Keyboard.LEFT || event.keyCode == Keyboard.RIGHT) {
				hero_X = 0;
			} else if (event.keyCode == Keyboard.DOWN || event.keyCode == Keyboard.UP) {
				hero_Y = 0;
			}
		}
		
		
		private function false_allpanel(): void {
			flashbg_mc.visible = false;
			menu_mc.visible = false;
			gameoverBoard_mc.visible = false;
			gamecloseLevel_mc.visible = false;
			selecthero_mc.visible = false;
		}
		

		private function visibleallPanel(): void {

			flashbg_mc.visible = true;
			menu_mc.visible = true;

			
			nemolive_mc.visible = false;
			insectaleftscore_mc.visible = false;
			insectarightscore_mc.visible = false;
			scoregame_mc.visible = false;
			liveContainer_mc.visible = false;

		}


		private function rnd(min: Number, max: Number): Number {
			var randomNum: Number = Math.floor(Math.random() * ((max - min) + 1)) + min;
			return randomNum;
		}
		
		
		private function removescoreDely(score: MovieClip): void {
			setTimeout(function () {

				if (contains(score)) {
					removeChild(score);
				}
			}, 900);
		}
		
		
		private function removeangryfishbloodDely(score: MovieClip): void {
			setTimeout(function () {
				if (contains(score)) {
					removeChild(score);
				}

			}, 300);
		}
		
		
		private function removescorerightDely(score: MovieClip): void {
			setTimeout(function () {
				if (contains(score)) {
					removeChild(score);
				}

			}, 1000);
		}
		
		private function removenemocrashDely(): void {
			setTimeout(function () {
				nemo_1.alpha = 5;
			}, 2000);
		}

		private function randomshootDelay(): void {
			setTimeout(function () {
				randomshoot = false;
				randomshoot1 = false;
			}, 1200);
		}
		private function randomshootAngryfishDelay(): void {
			setTimeout(function () {
				randomshootangryfish = false;
			}, 10);
		}

		private function removeBossDely(bloodboss_mc: MovieClip): void {
			setTimeout(function () {
				if (contains(bloodboss_mc)) {
					removeChild(bloodboss_mc);
					bossgameoverpanel();
				}
			}, 2000);
		}


		private function checktimeHandler(event: TimerEvent): void {
			//trace(cehckTime.currentCount);

			if (cehckTime.currentCount == 16) {
				timer.start();
				createBossone();
				liveContainerboss_mc.visible = true;
				bosslive_mc.visible = true;
				delaystopTimer();

			}

		}

		private function stoplevelOneTimer(): void {
			
			isGameOver = true;
			bossMovement = true;


			insectaLeftAppear.stop();
			insectaRightAppear.stop();
			coinboxAppear.stop();
			bossOneAppear.start();
			
		}

		private function delaystopTimer(): void {
			setTimeout(function () {
				stoplevelOneTimer();
			}, 7000);
		}

		public function updateTimeHandler(event: TimerEvent): void {
			//trace(timer.currentCount);

			if (timer.currentCount % 2 == 0) {
				timer.reset();
				timer.start();
				randomshoot = true;
				//trace(randomshoot);
			} else {
				if ((gameLevel == 2)) {
					timer.reset();
					timer.start();
					randomshoot1 = true;
				}

			}

		}

		public function updateshootpanel(event: TimerEvent): void {
			if ((gameLevel == 2) || (gameLevel == 3)) {
				if (shoot_timer.currentCount % 2 == 0) {
					shoot_timer.reset();
					shoot_timer.start();
					randomshootangryfish = true;
				}
			}
		}



		private function nemoposition(): void {
			nemo_1.x = 100;
			nemo_1.y = 70;
		}

		private function allstopLevel(): void {
			isGameOver = true;
			isGameoverangryfish = true;
			bossMovement = false;

			bosslive_mc.visible = false;
			liveContainerboss_mc.visible = false;

			nemo_1.visible = false;
			insectaLeftAppear.stop();
			insectaRightAppear.stop();
			coinboxAppear.stop();
			bossOneAppear.stop();
			angryfishAppear.stop();

			cehckTime.stop();
			cehckTime.reset();
			timer.stop();
			//timer.reset();

		}


		private function bossgameoverpanel(): void {
			allstopLevel();
			angryfishAppear.stop();

			gamecloseLevel_mc.visible = true;
			gamecloseLevel_mc.txtfinalscore.text = gameScore;


			if ((gameLevel == 1)) {

				Tweener.addTween(gamecloseLevel_mc.winlock1, {
					y: gamecloseLevel_mc.winlock1.y + 50,
					time: 0.5
				});
				Tweener.addTween(gamecloseLevel_mc.winlock1, {
					y: gamecloseLevel_mc.winlock1.y,
					time: 0.6,
					delay: 0.6,
					onComplete: removeLevellockDely()
				});

			} else if ((gameLevel == 2)) {
				Tweener.addTween(gamecloseLevel_mc.winlock2, {
					y: gamecloseLevel_mc.winlock2.y + 50,
					time: 0.5
				});
				Tweener.addTween(gamecloseLevel_mc.winlock2, {
					y: gamecloseLevel_mc.winlock2.y,
					time: 0.6,
					delay: 0.6,
					onComplete: removeLevellockDely()
				});

			} else if ((gameLevel == 3)) {
				Tweener.addTween(gamecloseLevel_mc.winlock3, {
					y: gamecloseLevel_mc.winlock3.y + 50,
					time: 0.5
				});
				Tweener.addTween(gamecloseLevel_mc.winlock3, {
					y: gamecloseLevel_mc.winlock3.y,
					time: 0.6,
					delay: 0.6,
					onComplete: removeLevellockDely()
				});

			}

		}

		private function removeLevellockDely(): void {
			setTimeout(function () {

				if (gameLevel == 1) {

					gamecloseLevel_mc.winlock1.visible = false;
					gamecloseLevel_mc.win1_mc.visible = true;

				} else if (gameLevel == 2) {

					gamecloseLevel_mc.winlock2.visible = false;
					gamecloseLevel_mc.win2_mc.visible = true;

				} else if (gameLevel == 3) {

					gamecloseLevel_mc.winlock3.visible = false;
					gamecloseLevel_mc.win3_mc.visible = true;

					levelalldone = true;

					scoreaddServer(gameLevel, gameScore);

				}


			}, 2000);
		}


		private function scoreaddServer(gameLevel: int, gameScore: int): void {


			var getLevel: int = gameLevel;
			var getScore: int = gameScore;

			if ((getLevel != 0) && (getScore != 0)) {
				//trace('Fiend is not empty!');

				var store_Level: String = 'Level' + getLevel;

				var variables: URLVariables = new URLVariables();
				variables.myname = store_Level;
				variables.myscore = getScore;

				var request: URLRequest = new URLRequest('http://localhost/Nemo/Score.php');
				request.method = URLRequestMethod.POST;
				request.data = variables;

				var loader: URLLoader = new URLLoader(request);
				loader.dataFormat = URLLoaderDataFormat.VARIABLES;
				loader.addEventListener(Event.COMPLETE, dataOnLoad);
				loader.load(request);
			}


		}

		function dataOnLoad(e: Event) {
			var variables: URLVariables = URLVariables(e.target.data);
			//trace(variables.result); // gives : System Updated
		}

		private function fetchvalue(): void {

			var phpVars: URLVariables = new URLVariables();
			phpVars.systemCall = "process";

			var phpFileRequest: URLRequest = new URLRequest('http://localhost/Nemo/fetch.php');
			phpFileRequest.method = URLRequestMethod.POST;
			phpFileRequest.data = phpVars;

			var phpLoader: URLLoader = new URLLoader();
			phpLoader.dataFormat = URLLoaderDataFormat.VARIABLES;
			phpLoader.addEventListener(Event.COMPLETE, showResult);
			phpLoader.load(phpFileRequest);

		}
		function showResult(e: Event): void {

			//trace(e.target.data.result);
			var strvalue: String = e.target.data.result;
			highscorepanel_mc.txthighscore.text=strvalue;
		}

	}

}