
(function($) {
	$.fn.validationEngineLanguage = function() {};
	$.validationEngineLanguage = {
		newLang: function() {
			$.validationEngineLanguage.allRules = 	{"required":{    			// Add your regex rules here, you can take telephone as an example
					"regex":"none",
						"alertText":"* This field is required",
						"alertTextCheckboxMultiple":"* Please select an option",
						"alertTextCheckboxe":"* This checkbox is required"},
					"length":{
						"regex":"none",
						"alertText":"* Should be 9 digit number"},
					"maxCheckbox":{
						"regex":"none",
						"alertText":"* Checks allowed Exceeded"},	
					"minCheckbox":{
						"regex":"none",
						"alertText":"* Please select ",
						"alertText2":" options"},	
					"equals":{
						"regex":"none",
						"alertText":"* Fields do not match"},		
					"phone":{
						// credit: jquery.h5validate.js / orefalo
						"regex": /^([\+][0-9]{1,3}[ \.\-])?([\(]{1}[0-9]{2,6}[\)])?([0-9 \.\-\/]{3,20})((x|ext|extension)[ ]?[0-9]{1,4})?$/,
						"alertText":"* Invalid phone number"},	
					"email":{
						// Shamelessly lifted from Scott Gonzalez via the Bassistance Validation plugin http://projects.scottsplayground.com/email_address_validation/
						"regex": /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/,
						"alertText":"* Invalid email address"},
					"integer":{
						"regex": /^[\-\+]?\d+$/,
						"alertText":"* Not a valid integer"},
					"number":{
						// Number, including positive, negative, and floating decimal. Credit: bassistance
						"regex": /^[\-\+]?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)$/,
						"alertText":"* Invalid floating decimal number"},
					"date":{
						// Date in ISO format. Credit: bassistance
                         "regex":/^\d{4}[\/\-]\d{1,2}[\/\-]\d{1,2}$/,
                         "alertText":"* Invalid date, must be in YYYY-MM-DD format"},
                         
                    "ipv4":{
                    	"regex": /^([1-9][0-9]{0,2})+\.([1-9][0-9]{0,2})+\.([1-9][0-9]{0,2})+\.([1-9][0-9]{0,2})+$/,
                    	"alertText":"* Invalid IP address"},      
                    "url":{
                    	"regex":/^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/,
                    	"alertText":"* Invalid URL"},
					"onlyNumber":{
						"regex":/^[0-9\ ]+$/,
						"alertText":"* Numbers only"},	
					"noSpecialCaracters":{
						"regex":/^[0-9a-zA-Z]+$/,
						"alertText":"* No special caracters allowed"},	
					"ajaxUser":{
						"file":"validateUser.php",
						"extraData":"name=eric",
						"alertTextOk":"* This user is available",	
						"alertTextLoad":"* Loading, please wait",
						"alertText":"* This user is already taken"},	
					"ajaxName":{
						"file":"validateUser.php",
						"alertText":"* This name is already taken",
						"alertTextOk":"* This name is available",	
						"alertTextLoad":"* Loading, please wait"},		
					"onlyLetter":{
						"regex":/^[a-zA-Z\ \']+$/,
						"alertText":"* Letters only"},
					"validate2fields":{
    					"nname":"validate2fields",
    					"alertText":"* You must have a firstname and a lastname"}	
					};
					
		}
	};
})(jQuery);

$(document).ready(function() {	
	$.validationEngineLanguage.newLang();	
	
	function class_no_validate(){
		$('.class_number').each(function(index) {
			var class_no = $(this).val();
			var class_no_visible = $(this).is(":visible")
			var test = "#class_information"+index+"_class_number"
			if (class_no.length == 0 && class_no_visible){
				$.validationEngine.buildPrompt(".class_no_title", "* This field is required", "error")
				return false
			}
			else if(isNaN($(this).val()) && class_no_visible){
				$.validationEngine.buildPrompt(".class_no_title", "* Numbers only", "error");
				return false
			}
			else if(class_no.length != 5 && class_no_visible){
				$.validationEngine.buildPrompt(".class_no_title", "* should be 5 digit number", "error");
				return false;
			}			
			else{
				$.validationEngine.closePrompt(".class_no_title");	
			}
		});		
	}
	
	function credits_validate(){
		$('.credits').each(function(index){
			var credits = $(this).val();			
			var credits_visible = $(this).is(":visible")
			if (credits.length == 0 && credits_visible){
				$.validationEngine.buildPrompt(".credits_title", "This field is required", "error");
				return false;
			}
			else{
			        $.validationEngine.closePrompt(".credits_title")				
			}
		});		
	}
	
	function day_validate(){
		$('.day').each(function(index){
			var day = $(this).val();			
			var day_visible = $(this).is(":visible")
			if (day.length == 0 && day_visible){
				$.validationEngine.buildPrompt(".day_title", "This field is required", "error");
				return false;
			}
			else{
			        $.validationEngine.closePrompt(".day_title")				
			}
		});
	}
	
	$(".class_number").blur(function(){
		class_no_validate();
	});
	
	$(".credits").blur(function(){
		credits_validate();
	});
	
	$(".day").blur(function(){
		day_validate();
	});

});