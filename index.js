var config = {
	id :               '',
	platform :         'html5',
    renderingBackEnd : 'canvas-2d',
    audioBackEnd :     'html5',
    verbose :          true,
	mode :             'deployed',
	screenSize :       [ window.innerWidth, window.innerHeight ],
	currentLanguage :  window.navigator.language
}

window.spell = {
	addToCache : function( x ) {
		this.cache = x
	},
    setApplicationModule : function( x ) {
		this.applicationModule = x
	}
}

ejecta.include('spelljs/spell.js')
ejecta.include('spelljs/data.js')

var engineInstance = require( 'spell/client/main', config )
engineInstance.start( spell.applicationModule, spell.cache )

