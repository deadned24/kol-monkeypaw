// Monkey paw script 
// uses Ezandora's choice override (github.com/Ezandora/Choice-Override/)

/*
* minimal effort because making kol nice isn't my job.
* Ask jick to hire someone to do the UI instead of half-assing everything and relying on modders to pick up the slack. 10 dollars deserves more than a cryptic input box
* it SHOULD have had wishes stored in history, a favorites list, persistent textbox for personal notes, and more.
* art would have been nice too.
*/
import "relay/choice.ash";

string MWish(){
//Inserts js file, css and div hooks.
string Ins_JS;
//js
Ins_JS+="\n<script language='Javascript' src='monkeyPaw.js'></script>\n";
//css
Ins_JS+="<style>\n .title{color:blue; font-weight: 800; font-size: 1.2em;}\n .Container{text-align: center;  min-width: 250px;}\n";
Ins_JS+=" .button {	border: 2px solid #000;	font-size: 10pt;	font-weight: 700; background-color: #FFF; color: #000; -webkit-appearance: none; -webkit-border-radius: 0; }\n";
Ins_JS+="input[name=\"wish\"] { width: 23em;}\n";
Ins_JS+="</style>\n";
//hooks
Ins_JS+="<div style=\"display: flex; justify-content: center; margin-bottom:10px;\">\n";
Ins_JS+="    <div  style=\"margin-right: 2em;\"><span class=title>History</span>\n";
Ins_JS+="        <span style=\"display: block; margin-top: 0.2em;\"> </span>\n";//spacer
Ins_JS+="        <div id=\"SIC\" class=Container>...</div>\n";
Ins_JS+="    </div>\n";
Ins_JS+="    <div  style=\"margin-left: 2em; \"> <span class=title>Favorites</span>\n";
Ins_JS+="        <span style=\"display: block; margin-top: 0.2em;\"> </span>\n"; //spacer
Ins_JS+="        <div id=\"FIC\" class=Container style=\"padding: 0; height: 6em; overflow-y: auto;\">...</div>\n";
Ins_JS+="    </div>\n";
Ins_JS+="</div>\n";
//text box
Ins_JS+="<textarea id=\"user-notes\"  style=\"width: 95%;\" rows=\"10\" placeholder=\"Enter your notes here...\"></textarea>\n"; 
Ins_JS+="<br>\n"; 
Ins_JS+="<button class=button id=\"save-button\">Save</button>\n"; 
Ins_JS+="<p>\n";
return Ins_JS;
}

void main(string page_text_encoded){

	string page_text = page_text_encoded.choiceOverrideDecodePageText();
	string [string] form_fields = form_fields();
	//Modify page_text as you will here.

	string match_text = '<a href="/inventory.php">Back to Inventory</a>';
	page_text = page_text.replace_string(match_text,MWish()+match_text);
	
	write(page_text);
}
