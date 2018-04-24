"use strict";

//Variables
var Alexa = require("alexa-sdk");
var SKILL_NAME = "Confidence Builder";
var APP_ID = "";

//List of compliments
var COMPLIMENT_LIST = [
	"Damn son, you're looking good today!",
	"Wow!. You made an alexa skill. You're smarter than I thought!",
	"If you were a food, you'd be an endless supply of Cheesecake."
];

//Setup
exports.handler = function(event, context, callback){
	var alexa = Alexa.handler(event, context);
	alexa.APP_ID = APP_ID;
	alexa.registerHandlers(handlers);
	alexa.execute();
}

var handlers = {
	'LaunchRequest': function() {
		this.emit('GetComplement');
	},
	'GetComplimentIntent': function() {
		this.emit('GetComplement');
	},
	'GetCompliment': function() {
		var complimentIndex = Math.floor(Math.random() * COMPLIMENT_LIST.length);
		var randomCompliment = COMPLIMENT_LIST[complimentIndex];

		//Output
		var speechOutput = "Your compliment " + randomCompliment;

		this.emit(":tellWithCard", speechOutput, SKILL_NAME, randomCompliment);
	},
	'AMAZON.HelpIntent': function() {
		var speechOutput = "You say give me a compliment, or, you can say exit... What can I help you with?"
		var reprompt = "What can i help you with?"
		this.emit(":ask", speechOutput, reprompt);
	},
	'AMAZON.StopIntent': function() {
		this.emit(":tell", "Goodbye!");
	},
	'AMAZON.CancelIntent': function() {
		this.emit(":tell", "Goodbye!");
	}
}