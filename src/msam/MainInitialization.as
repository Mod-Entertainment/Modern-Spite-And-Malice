package msam
{
	import me.elementary.ui.core.AppAppearance;
	import me.elementary.ui.core.BaseColors;
	import me.elementary.ui.stylesheet.StylesheetSet;
	import me.games.action.cards.Deposit;
	import me.games.action.undoLastMoves.UndoLastMoveSet;
	import me.games.ui.components.gamblingTable.GamblingTableColorSet;
	import me.games.ui.components.options.GameOptionsComponent;
	import me.games.ui.components.options.symbols.GameOptionsGroup;
	import me.games.ui.skins.FontReplacement;
	import me.games.ui.views.supportClasses.AppSettings;

	import ms.action.cards.SkipBoCardDeposit;
	import ms.action.options.SkipBoOptions;
	import ms.controller.cards.SkipBoCardController;
	import ms.ui.components.options.SkipBoOptionsComponent;
	import ms.ui.components.options.symbols.SkipBoOptionsGroup;
	import ms.ui.components.options.symbols.SkipBoOptionSymbol;
	import ms.ui.manuals.Skip2GoManual;

	CONFIG::freeEdition
	{
		import me.elementary.ui.callouts.ads.ModernSpiteAndMalicePE;
		import me.elementary.ui.callouts.ads.SpiteAndMalice;
		import me.elementary.ui.components.advertising.MoreFromAd;
		import me.elementary.ui.images.AppIcon;
		import me.games.ui.views.HomeScreenFE;

		import ms.ui.views.supportClasses.ShowAdAndStartGameListeners;

		import ma.adPlacement.provider.AdProvider;

		CONFIG::debug
		{
			import me.games.ui.views.Admin;
			
			import ma.components.AdvertisingToggle;
		}
	}

	CONFIG::premiumEdition
	{
		import me.elementary.adPlacement.provider.AdFreeProvider;
		import me.games.ui.views.HomeScreen;
		
		import ms.ui.views.supportClasses.StartGameListeners;
	}

	import mx.events.FlexEvent;
	import spark.components.ViewNavigatorApplication;

	/*----------------------------------------------------------------------------*/
    /* Klasse MainInitialization
	/*----------------------------------------------------------------------------*/
    public class MainInitialization
    {
		/*----------------------------------------------------------------------------*/
		/* Methoden
		/*----------------------------------------------------------------------------*/

		/*******************************************************************************
		*
		*******************************************************************************/
		protected static function createFontReplacements():void
		{
			const ORANGE:uint = 0xF19E36;
			const RED:uint = 0xA04B4E;
			const BLUE:uint = 0x006B92;
			const ORANGE_RED_BLUE:Vector.<uint> = new <uint>[ORANGE, RED, BLUE];
			const LIGHT_ORANGE_RED_BLUE:Vector.<uint> = new <uint>[BaseColors.WHITE];

			FontReplacement.instances = new Vector.<FontReplacement>();

			// Kartenvorderseite 0 (zweifarbig, hell)
			var fr:FontReplacement = new FontReplacement();
			fr.fontFace = "CardCharacters_CFF";
			fr.fontColor = ORANGE_RED_BLUE;
			fr.fontSizeRatio = 0.37;
			fr.horizontalOffsetRatio = 0.24;
			fr.verticalOffsetRatio = 0.14;
			fr.fontSizeRatio2 = 0.7;
			fr.verticalOffsetRatio2 = -0.05;
			FontReplacement.instances.push(fr);

			// Kartenvorderseite 1 (zweifarbig, dunkel)
			fr = new FontReplacement();
			fr.fontFace = "CardCharacters_CFF";
			fr.fontColor = ORANGE_RED_BLUE;
			fr.fontSizeRatio = 0.37;
			fr.horizontalOffsetRatio = 0.24;
			fr.verticalOffsetRatio = 0.14;
			fr.fontSizeRatio2 = 0.7;
			fr.verticalOffsetRatio2 = -0.05;
			FontReplacement.instances.push(fr);

			// Kartenvorderseite 2 (einfarbig, hell)
			fr = new FontReplacement();
			fr.fontFace = "CardCharacters_CFF";
			fr.fontColor = ORANGE_RED_BLUE;
			fr.fontSizeRatio = 0.34;
			fr.verticalOffsetRatio = 0.12;
			fr.fontSizeRatio2 = 0.7;
			fr.verticalOffsetRatio2 = -0.05;
			FontReplacement.instances.push(fr);

			// Kartenvorderseite 3 (einfarbig, dunkel)
			fr = new FontReplacement();
			fr.fontFace = "CardCharacters_CFF";
			fr.fontColor = ORANGE_RED_BLUE;
			fr.fontSizeRatio = 0.34;
			fr.verticalOffsetRatio = 0.12;
			fr.fontSizeRatio2 = 0.7;
			fr.verticalOffsetRatio2 = -0.05;
			FontReplacement.instances.push(fr);

			// Kartenvorderseite 4 (schräg, hell)
			fr = new FontReplacement();
			fr.fontFace = "RobotoBlackItalic_CFF";
			fr.fontColor = ORANGE_RED_BLUE;
			fr.fontSizeRatio = 0.52;
			fr.verticalOffsetRatio = 0.12;
			fr.rotationZ = -8;
			fr.fontSizeRatio2 = 1.2;
			fr.verticalOffsetRatio2 = 0.15;
			FontReplacement.instances.push(fr);

			// Kartenvorderseite 5 (schräg, dunkel)
			fr = new FontReplacement();
			fr.fontFace = "RobotoBlackItalic_CFF";
			fr.fontColor = LIGHT_ORANGE_RED_BLUE;
			fr.fontSizeRatio = 0.52;
			fr.rotationZ = -8;
			fr.verticalOffsetRatio = 0.12;
			fr.fontSizeRatio2 = 1.2;
			fr.verticalOffsetRatio2 = 0.15;
			FontReplacement.instances.push(fr);

			// Kartenvorderseite 6 (uni, dunkel)
			fr = new FontReplacement();
			fr.fontFace = "RobotoBlack_CFF";
			fr.fontColor = LIGHT_ORANGE_RED_BLUE;
			fr.fontSizeRatio = 0.51;
			fr.verticalOffsetRatio = 0.06;
			fr.fontSizeRatio2 = 0.9;
			fr.verticalOffsetRatio2 = 0.05;
			FontReplacement.instances.push(fr);

			// Kartenvorderseite 7 (uni, schwarz)
			fr = new FontReplacement();
			fr.fontFace = "RobotoBlack_CFF";
			fr.fontColor = ORANGE_RED_BLUE;
			fr.fontSizeRatio = 0.51;
			fr.verticalOffsetRatio = 0.06;
			fr.fontSizeRatio2 = 0.9;
			fr.verticalOffsetRatio2 = 0.05;
			FontReplacement.instances.push(fr);
		}

		/*******************************************************************************
		* Wichtig: firstView in preinitialze festlegen!
		*******************************************************************************/
		public static function preinitialize(event:FlexEvent):void
		{
			var main:ViewNavigatorApplication = ViewNavigatorApplication(event.currentTarget);

			CONFIG::freeEdition
			{
				main.firstView = HomeScreenFE;
			}

			CONFIG::premiumEdition
			{
				main.firstView = HomeScreen;
			}
		}

		/*******************************************************************************
		* App initialisieren
		*******************************************************************************/
		public static function initialize(event:FlexEvent):void
		{
			var main:ViewNavigatorApplication = ViewNavigatorApplication(event.currentTarget);

			// Keine animierten Ansichts-Übergänge
			main.navigator.transitionsEnabled = false;

			// Stylesheet-Eigenschaften (z. B. font-size) der aktuellen Grafikauflösung anpassen
			StylesheetSet.adjustStylesheetProperties(main.styleManager);

			// Interne App-Id
			AppAppearance.appId = AppAppearance.MODERN_SPITE_AND_MALICE_ID;

			// Farben der App initialisieren und festlegen
			AppAppearance.determineColors();

			// Standardwert für das Aussehen des Spieltisches festlegen
			GamblingTableColorSet.defaultColorSet = GamblingTableColorSet.BLUE;

			// Klasse des Initialisierungs-Kartenstapels festlegen
			Deposit.classType = SkipBoCardDeposit;

			// Spieloptionen und deren Visualisierung initialiseren
			SkipBoOptions.initialize();
			SkipBoOptionSymbol.labelingStyle = SkipBoOptionSymbol.LETTERS_STYLE;
			GameOptionsGroup.classType = SkipBoOptionsGroup;
			GameOptionsComponent.offlineClassType = SkipBoOptionsComponent;

			// Spielanleitung einbinden
			Skip2GoManual.embedAndInstantiate();

			// Schriftersetzung bei Jokern
			createFontReplacements();

			CONFIG::freeEdition
			{
				AppAppearance.premiumEdition = false;

				AppSettings.classTypeOfStartGameListeners = ShowAdAndStartGameListeners;

				UndoLastMoveSet.maxItems = 3;

				var testAdsEnabled:Boolean = false;

				CONFIG::debug
				{
					testAdsEnabled = true;

					Admin.testAdToggleClass = AdvertisingToggle;
				}

				// Werbung intialisieren
				AdProvider.initialize(AppAppearance.appId, new <Class>[ModernSpiteAndMalicePE, SpiteAndMalice], testAdsEnabled);

				// App-Symbole für das Werbe-Banner in der Start-Ansicht initialisieren!
				MoreFromAd.appIcons = new <AppIcon>[AppIcon.modernSpiteAndMalicePE,
												    AppIcon.spiteAndMalice,
													AppIcon.spiteAndMalicePE];

				// Anzahl der Kartenvorder- und Kartenrückseiten festlegen
				var maxFrontDesigns:uint = 2;
				var maxBackDesigns:uint = 4;
			}
			
			CONFIG::premiumEdition
			{
				AppAppearance.premiumEdition = true;

				AppSettings.classTypeOfStartGameListeners = StartGameListeners;

				// Unendlich
				UndoLastMoveSet.maxItems = 0;

				// Werbung (es wird keine Werbung angezeigt) intialisieren
				AdFreeProvider.initialize();

				// Anzahl der Kartenvorder- und Kartenrückseiten festlegen
				var maxFrontDesigns:uint = 4;
				var maxBackDesigns:uint = 14;
			}

			// Spielkarten initialisieren und Karten-Desgin festlegen
			SkipBoCardController.initialize(maxFrontDesigns, maxBackDesigns);

			// Titelbild und Icon der App festlegen, Eigenschaft "premiumEdition" muss festgelegt sein!
			AppAppearance.determineCoverAndIcon();
		}
    }
}
