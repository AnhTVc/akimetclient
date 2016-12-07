$(document)
		.ready(
				function() {

					$("#searchBox").autocomplete({
										source : function(request, response) {
											$.ajax({
														url : "http://localhost:8686/AutoComplete",
														dataType : 'jsonp',
														type : "GET",
														cache : false,
														data : {
															"keyword" :  $('#searchBox').val()
														},
														contentType : "application/json; charset=utf-8",
														success : function(data) {
															response($
																	.map(data,function(item) {
																				return {
																					data : item,
																					label : item.idAutoComplete
																							+ '<p></p>('
																							+ item.avatarRestaurant
																							+ ')',
																					value : item.addressRestaurant
																				}
																			}));
														},
														error : function(
																XMLHttpRequest,
																textStatus,
																errorThrown) {
															alert("XMLHttpRequest="
																	+ XMLHttpRequest.responseText
																	+ "\ntextStatus="
																	+ textStatus
																	+ "\nerrorThrown="
																	+ errorThrown);
														}
													});
										},
										minLength : 1,
										select : function(event, ui) {
											debugger;
								            return false;
										}
									}).data( "ui-autocomplete" )._renderItem = function( ul, item ) {
									var inner_html = '<a  style="min-width: 439px;"><div class="list_item_container" style="min-width: 439px;"><div class="row" style="min-width: 439px;"><div class="col-sm-1"></div><div class="col-sm-3"><img class="image_autocomplete" src="'
											+ item.data.avatarRestaurant
											+ '"></div><div class="label col-sm-6"><p style="color: #222222;">'
											+ item.data.nameRestaurant
											+ '</p><p style="color: #888888; font-size: 11px;text-align: right; right:100%">' +item.data.addressRestaurant+ '</p></div></div></div></a><hr/>';
									return $("<li style=\"min-width: 439px;\"></li>")
			
									.data("item.idAutoComplete", item).append(inner_html)
											.appendTo(ul);
					},_renderMenu = function( ul, items ) {
						debugger;
						alert(items)
					};
					$('#searchBox').on('autocompleteselect', function (e, ui) {
				        debugger;
				    });

				});

function displaySelectedItem(item) {
	alert(item.addressRestaurant);
}