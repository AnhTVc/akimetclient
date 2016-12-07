$(document).ready(function (){
			// Initializing arrays with district names.
			var HANOI = [ {
				display : "Quận Ba Đình",
				value : "100"
			}, {
				display : "Quận Hoàn Kiếm",
				value : "101"
			}, {
				display : "Quận Hai Bà Trưng",
				value : "102"
			}, {
				display : "Quận Đống Đa",
				value : "103"
			}, {
				display : "Quận Tây Hồ",
				value : "104"
			}, {
				display : "Quận Cầu Giấy",
				value : "105"
			}, {
				display : "Quận Thanh Xuân",
				value : "106"
			}, {
				display : "Quận Hoàng Mai",
				value : "107"
			}, {
				display : "Quận Long Biên",
				value : "108"
			}, {
				display : "Huyện Từ Liêm",
				value : "109"
			}, {
				display : "Huyện Thanh Trì",
				value : "110"
			}, {
				display : "Huyện Gia Lâm",
				value : "111"
			}, {
				display : "Huyện Đông Anh",
				value : "112"
			}, {
				display : "Huyện Sóc Sơn",
				value : "113"
			}, {
				display : "Quận Hà Đông",
				value : "114"
			}, {
				display : "Thị xã Sơn Tây",
				value : "115"
			}, {
				display : "Huyện Ba Vì",
				value : "116"
			}, {
				display : "Huyện Phúc Thọ",
				value : "117"
			}, {
				display : "Huyện Thạch Thất",
				value : "118"
			}, {
				display : "Huyện Quốc Oai",
				value : "119"
			}, {
				display : "Huyện Chương Mỹ",
				value : "120"
			}, {
				display : "Huyện Đan Phượng",
				value : "121"
			}, {
				display : "Huyện Hoài Đức",
				value : "122"
			}, {
				display : "Huyện Thanh Oai",
				value : "123"
			}, {
				display : "Huyện Mỹ Đức",
				value : "124"
			}, {
				display : "Huyện Ứng Hoà",
				value : "125"
			}, {
				display : "Huyện Thường Tín",
				value : "126"
			}, {
				display : "Huyện Phú Xuyên",
				value : "127"
			}, {
				display : "Huyện Mê Linh",
				value : "128"
			} ];

			var HCM = [ {
				display : "Quận 1",
				value : "200"
			}, {
				display : "Quận 2",
				value : "201"
			}, {
				display : "Quận 3",
				value : "202"
			}, {
				display : "Quận 4",
				value : "203"
			}, {
				display : "Quận 5",
				value : "204"
			}, {
				display : "Quận 6",
				value : "206"
			}, {
				display : "Quận 7",
				value : "206"
			}, {
				display : "Quận 8",
				value : "207"
			}, {
				display : "Quận 9",
				value : "208"
			}, {
				display : "Quận 10",
				value : "209"
			}, {
				display : "Quận 11",
				value : "210"
			}, {
				display : "Quận 12",
				value : "211"
			}, {
				display : "Quận Thủ Đức",
				value : "212"
			}, {
				display : "Quận Gò Vấp",
				value : "213"
			}, {
				display : "Quận Bình Thạnh",
				value : "214"
			}, {
				display : "Quận Tân Bình",
				value : "215"
			}, {
				display : "Quận Tân Phú",
				value : "216"
			}, {
				display : "Quận Phú Nhuận",
				value : "217"
			}, {
				display : "Quận Bình Tân",
				value : "218"
			}, {
				display : "Huyện Củ Chi",
				value : "219"
			}, {
				display : "Huyện Hóc Môn",
				value : "220"
			}, {
				display : "Huyện Bình Chánh",
				value : "221"
			}, {
				display : "	Huyện Nhà Bè",
				value : "222"
			}, {
				display : "	Huyện Cần Giờ",
				value : "223"
			} ];
			// Function executes on change of first select option field.
			$("#city").change(function() {
				var select = $("#city option:selected").val();
				switch (select) {
				case "Thành Phố HCM":
					district(HCM);
					break;
				case "Hà Nội":
					district(HANOI);
					break;
				default:
					$("#district").empty();
					$("#district").append("<option>--Select--</option>");
					break;
				}
			});
			// Function To List out Cities in Second Select tags
			function district(arr) {
				$("#district").empty(); // To reset cities
				$("#district").append("<option>--Select--</option>");
				$(arr).each(
						function(i) { // to list cities
							$("#district").append(
									"<option value=\"" + arr[i].value + "\">"
											+ arr[i].display + "</option>")
						});
			}
		});