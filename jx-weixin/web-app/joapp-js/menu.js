// using joCache here to defer creation of this
// view until we actually use it
joCache.set("menu", function() {
	// some inline data and chaining going on here,
	// dont be afraid, it'll all make sense later
	var card = new joCard([
		new joTitle("请选择..."),
		new joMenu([
			{ title: "关于", id: "about" },
			{ title: "车险之性价比之选", id: "widgets" },
			{ title: "车险之优惠之选", id: "lists" },
			{ title: "车险之质量之选", id: "tables" },
			{ title: "Popup Dialogs", id: "popups" },
			{ title: "Ajax Calls", id: "ajax" },
			{ title: "Themes and CSS", id: "themes" }
		]).selectEvent.subscribe(function(id) {
			App.stack.push(joCache.get(id));
		})
	]);
	
	// hey, you don't have to make messy chained and
	// inlined code; that's a coding style decision
	// Jo doesn't pretend it should make for you.
	card.setTitle("Jo Kitchen Sink Demo");
	
	return card;
});
