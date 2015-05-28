addRecords = ->
	url = $('.pagination .next a').attr('href')
	if url
		$.getScript url + "&add_records=true"

$(document).on 'click', '#add-records a', (event) ->
	addRecords()
	event.preventDefault()