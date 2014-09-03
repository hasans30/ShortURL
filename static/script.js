// If never been to site before then localStorage.
if (typeof localStorage.links !== 'undefined' || localStorage.links === "") {
	links = JSON.parse(localStorage.links);
} else {
	links = [];
}

function main() {
	longInput = document.getElementById('longInput');
	linksTable = document.getElementById('linksTable');
	drawLinksTable();
}

function saveLinks() {
	localStorage.links = JSON.stringify(links);
}

function drawLinksTable() {
	// draw links table using the links array of link objects
	var tableRows = "<tr><th>LongURL</th><th>ShortURL</th></tr>";
	for (var i = 0 ; i < links.length ; i++) {
		tableRows += "<tr><td><a href='" + links[i].longURL + "' target='blank'>" + links[i].longURL + "</a></td><td><input type='text' class='wide' onclick='this.select()' readonly value='" + location.href + links[i].shortURL + "'></td></tr>";
	}
	linksTable.innerHTML = tableRows;
}

function shortURL(longURL) {
	var xmlhttp;
	// Long URL cannot be empty.
	if (longURL === "" ) {
		return;
	} else {
		// A protocol must be included in a link.
		var protocolPattern = /^(https?|ftps?):\/\/.+/i;
		if (!protocolPattern.test(longURL)) {  // if there is not a URL at the beginning
			longURL = "http://" + longURL;
		}
		longURL = encodeURI(longURL);
	}
	var xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function() {
		if (xmlhttp.readyState==4 && xmlhttp.status==200) {
			// push to links array
			var newLink = { "longURL" : longURL, "shortURL" : xmlhttp.responseText };
			links.unshift(newLink);
			saveLinks();
			// redraw links table
			drawLinksTable();
			// clear the input
			longInput.value = "";
		}
	}
	xmlhttp.open("GET","api/" + longURL);
	xmlhttp.send();
}
