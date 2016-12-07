//var URL = "http://localhost:8080/fooddrink/";

var countTime = 1;
var groupmenuold = '';
var groupmenunew = '';
var id_deservation = '';

$(document).ready(
		function() {
			$('#datetimepickerfromfirst').datetimepicker(
					{
						format : 'LT',
						stepping : 30,
						enabledHours : [ 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
								16, 17, 18, 19, 20, 21, 22, 23, 24 ]
					});
		});

$(document).ready(
		function() {
			$('#datetimepickertofirst').datetimepicker(
					{
						format : 'LT',
						stepping : 30,
						enabledHours : [ 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
								16, 17, 18, 19, 20, 21, 22, 23, 24 ]
					});
		});

$(document).ready(
		function() {
			$('#datetimepickertoTwo').datetimepicker(
					{
						format : 'LT',
						stepping : 30,
						enabledHours : [ 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
								16, 17, 18, 19, 20, 21, 22, 23, 24 ]
					});
		});

$(document).ready(
		function() {
			$('#datetimepickerfromTwo').datetimepicker(
					{
						format : 'LT',
						stepping : 30,
						enabledHours : [ 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
								16, 17, 18, 19, 20, 21, 22, 23, 24 ]
					});
		});
$(document).ready(
		function() {
			$('#datetimepickerfromThree').datetimepicker(
					{
						format : 'LT',
						stepping : 30,
						enabledHours : [ 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
								16, 17, 18, 19, 20, 21, 22, 23, 24 ]
					});
		});
$(document).ready(
		function() {
			$('#datetimepickertoThree').datetimepicker(
					{
						format : 'LT',
						stepping : 30,
						enabledHours : [ 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
								16, 17, 18, 19, 20, 21, 22, 23, 24 ]
					});
		});

$(document).ready(
		function() {
			$('#datetimepickerfromFour').datetimepicker(
					{
						format : 'LT',
						stepping : 30,
						enabledHours : [ 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
								16, 17, 18, 19, 20, 21, 22, 23, 24 ]
					});
		});
$(document).ready(
		function() {
			$('#datetimepickertoFour').datetimepicker(
					{
						format : 'LT',
						stepping : 30,
						enabledHours : [ 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
								16, 17, 18, 19, 20, 21, 22, 23, 24 ]
					});
		});
function addTime() {
	if (countTime == 1) {
		document.getElementById("rowTimeTwo").style.display = "block";
		countTime++;
		return;
	}
	if (countTime == 2) {
		document.getElementById("rowTimeThree").style.display = "block";
		countTime++;
		return;
	}
	if (countTime == 3) {
		document.getElementById("rowTimeFour").style.display = "block";
		countTime++;
		return;
	}
	if (countTime == 4) {
		alert("Không thể thêm khung giờ nữa");
		return;
	}
}

function minusTime() {
	if (countTime == 4) {
		document.getElementById("rowTimeFour").style.display = "none";
		countTime--;
		return;
	}
	if (countTime == 3) {
		document.getElementById("rowTimeThree").style.display = "none";
		countTime--;
		return;
	}
	if (countTime == 2) {
		document.getElementById("rowTimeTwo").style.display = "none";
		countTime--;
		return;
	}
	if (countTime == 1) {
		alert("Bạn phải cập nhật khung giờ giảm giá")
		return;
	}

}

$(function() {
	$('#datetimepicker6').datetimepicker({
		format : 'YYYY-MM-DD'

	});
	$('#datetimepicker7').datetimepicker({
		format : 'YYYY-MM-DD'
	// Important! See issue #1075
	});
	$("#datetimepicker6").on("dp.change", function(e) {
		$('#datetimepicker7').data("DateTimePicker").minDate(e.date);
	});
	$("#datetimepicker7").on("dp.change", function(e) {
		$('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
	});
});

var countGroupmenu = 1;

function minusGroupmenu() {

}

function addGroupmenu() {
	if (countGroupmenu == 1) {
		document.getElementById("row_add_name_group_menu_one").style.display = "block";
		countGroupmenu++;
		return;
	}
	if (countGroupmenu == 2) {
		document.getElementById("row_add_name_group_menu_two").style.display = "block";
		countGroupmenu++;
		return;
	}
	if (countGroupmenu == 3) {
		document.getElementById("row_add_name_group_menu_three").style.display = "block";
		countGroupmenu++;
		return;
	}
	if (countGroupmenu == 4) {
		document.getElementById("row_add_name_group_menu_four").style.display = "block";
		countGroupmenu++;
		return;
	}
	if (countGroupmenu == 5) {
		document.getElementById("row_add_name_group_menu_five").style.display = "block";
		countGroupmenu++;
		return;
	}
	if (countGroupmenu == 6) {
		document.getElementById("row_add_name_group_menu_six").style.display = "block";
		countGroupmenu++;
		return;
	}
	if (countGroupmenu == 7) {
		document.getElementById("row_add_name_group_menu_seven").style.display = "block";
		countGroupmenu++;
		return;
	}
	if (countGroupmenu == 8) {
		document.getElementById("row_add_name_group_menu_eight").style.display = "block";
		countGroupmenu++;
		return;
	}
	if (countGroupmenu == 9) {
		document.getElementById("row_add_name_group_menu_nine").style.display = "block";
		countGroupmenu++;
		return;
	}
	if (countGroupmenu == 10) {
		document.getElementById("row_add_name_group_menu_ten").style.display = "block";
		countGroupmenu++;
		return;
	}
	if (countGroupmenu == 11) {
		alert("Không thể tạo thêm!")
		return;
	}
}

function minusGroupmenu() {
	if (countGroupmenu == 2) {
		document.getElementById("row_add_name_group_menu_one").style.display = "none";
		countGroupmenu--;
		return;
	}
	if (countGroupmenu == 3) {
		document.getElementById("row_add_name_group_menu_two").style.display = "none";
		countGroupmenu--;
		return;
	}
	if (countGroupmenu == 4) {
		document.getElementById("row_add_name_group_menu_three").style.display = "none";
		countGroupmenu--;
		return;
	}
	if (countGroupmenu == 5) {
		document.getElementById("row_add_name_group_menu_four").style.display = "none";
		countGroupmenu--;
		return;
	}
	if (countGroupmenu == 6) {
		document.getElementById("row_add_name_group_menu_five").style.display = "none";
		countGroupmenu--;
		return;
	}
	if (countGroupmenu == 7) {
		document.getElementById("row_add_name_group_menu_six").style.display = "none";
		countGroupmenu--;
		return;
	}
	if (countGroupmenu == 8) {
		document.getElementById("row_add_name_group_menu_seven").style.display = "none";
		countGroupmenu--;
		return;
	}
	if (countGroupmenu == 9) {
		document.getElementById("row_add_name_group_menu_eight").style.display = "none";
		countGroupmenu--;
		return;
	}
	if (countGroupmenu == 10) {
		document.getElementById("row_add_name_group_menu_nine").style.display = "none";
		countGroupmenu--;
		return;
	}
	if (countGroupmenu == 11) {
		document.getElementById("row_add_name_group_menu_ten").style.display = "none";
		countGroupmenu--;
		return;
	}
	if (countGroupmenu == 1) {
		alert("Không thể hủy!")
		return;
	}

	// ajax connection server
	function btnAddGroupMenu() {
		var data = 'status=1';

		if ('#add_name_group_menu'.val() != null) {
			data = data + '&name_group_menu=' + $('#add_name_group_menu').val();
			data = data + '&name_group_menu_one='
					+ $('#add_name_group_menu_one').val()
					+ '&name_group_menu_two='
					+ $('#add_name_group_menu_two').val()
					+ '&name_group_menu_three='
					+ $('#add_name_group_menu_three').val()
					+ '&name_group_menu_four='
					+ $('#add_name_group_menu_four').val()
					+ '&name_group_menu_five='
					+ $('#add_name_group_menu_five').val()
					+ '&name_group_menu_six='
					+ $('#add_name_group_menu_six').val()
					+ '&name_group_menu_seven='
					+ $('add_name_group_menu_seven').val()
					+ '&name_group_menu_eight='
					+ $('add_name_group_menu_eight').val()
					+ '&name_group_menu_nine='
					+ $('add_name_group_menu_nine').val()
					+ '&name_group_menu_ten='
					+ $('add_name_group_menu_ten').val()
		} else {
			alert('Vui lòng nhập đủ thông tin!');
		}

		$.ajax({
			url : "AdminRestaurant",
			type : "post",
			data : data,
			success : function(response) {
				if (response.authen == "true") {
					window.location.replace("/");
				} else {
					window.location.reload();
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				//alert(textStatus, errorThrown);
				window.location.reload();
			}
		});
	}

}

// Update sale

function updateSale() {
	var data = "timefromfirst=" + $('#timefromfirst').val() + "&timetofirst="
			+ $('#timetofirst').val();
	if (document.getElementById("rowTimeTwo").style.display != "none") {
		data = data + "&timefromtwo=" + $('#timefromtwo').val() + "&timetotwo"
				+ $('#timetotwo').val();
	}

	if (document.getElementById("rowTimeThree").style.display != "none") {
		data = data + "&timefromthree=" + $('#timefromthree').val()
				+ "&timetothree=" + $('#timetothree').val();
	}
	if (document.getElementById("rowTimeFour").style.display != "none") {
		data = data + "&timefromfour=" + $('#timefromfour').val()
				+ "&timetofour=" + $('#timetofour').val();
	}

	data = data + "&fromdate=" + $('#fromdate').val() + "&todate="
			+ $('#todate').val() + "&detailsale=" + $('#detailsale').val();

	$.ajax({
		url : "UpdateSale",
		type : "post",
		data : data,
		success : function(response) {
			if (response.result == "true") {
				//alert("Update thông tin thành công");
				window.location.reload();
			} else {
				//alert("Update thông tin KHÔNG thành công");
				window.location.reload();
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			//alert(textStatus, errorThrown);
			window.location.reload();
		}
	});
}

function editGroupMenu(id) {

	groupmenuold = groupmenuold + '{"id": "' + id + '","name": "'
			+ $('#name_group_menu').val() + '"}';

	alert(groupmenuold);
}

/**
 * 
 * @param x:
 *            this
 * @param name:
 *            id element
 */
function editGroupMenu(x, name) {
	// get id element
	var nameId = '#' + x.id;
	// Cut string: name_group_menu_ in id
	var idGroupmenu = x.id.substring(16);
	groupmenuold = groupmenuold + '{"id": "' + idGroupmenu + '","name": "'
			+ $(nameId).val() + '"},';
}

/*
 * Cập nhật nhóm món ăn cho nhà hàng
 */
function updateGroupMenu() {
	// Thêm mới nhóm món ăn
	var data;
	if (document.getElementById("row_add_name_group_menu_one").style.display != "none") {
		groupmenunew = groupmenunew + '"' + $('#add_name_group_menu_one').val()
				+ '",';
	}

	if (document.getElementById("row_add_name_group_menu_two").style.display != "none") {
		groupmenunew = groupmenunew + '"' + $('#add_name_group_menu_two').val()
				+ '",';
	}
	if (document.getElementById("row_add_name_group_menu_three").style.display != "none") {
		groupmenunew = groupmenunew + '"'
				+ $('#add_name_group_menu_three').val() + '",';
	}
	if (document.getElementById("row_add_name_group_menu_four").style.display != "none") {
		groupmenunew = groupmenunew + '"'
				+ $('#add_name_group_menu_four').val() + '",';
	}
	if (document.getElementById("row_add_name_group_menu_five").style.display != "none") {
		groupmenunew = groupmenunew + '"'
				+ $('#add_name_group_menu_five').val() + '",';
	}
	if (document.getElementById("row_add_name_group_menu_six").style.display != "none") {
		groupmenunew = groupmenunew + '"' + $('#add_name_group_menu_six').val()
				+ '",';
	}
	if (document.getElementById("row_add_name_group_menu_seven").style.display != "none") {
		groupmenunew = groupmenunew + '"'
				+ $('#add_name_group_menu_seven').val() + '",';
	}
	if (document.getElementById("row_add_name_group_menu_nine").style.display != "none") {
		groupmenunew = groupmenunew + '"'
				+ $('#add_name_group_menu_nine').val() + '",';
	}
	if (document.getElementById("row_add_name_group_menu_eight").style.display != "none") {
		groupmenunew = groupmenunew + '"'
				+ $('#add_name_group_menu_eight').val() + '",';
	}
	if (document.getElementById("row_add_name_group_menu_ten").style.display != "none") {
		groupmenunew = groupmenunew + '"' + $('#add_name_group_menu_ten').val()
				+ '",';
	}

	if ($('#add_name_group_menu').val()) {
		groupmenunew = groupmenunew + '"' + $('#add_name_group_menu').val()
				+ '"';
	}

	if (groupmenuold && 0 != groupmenuold.length) {
		// Có dữ liệu
		data = "groupmenuold=" + groupmenuold;
	}
	if (groupmenunew && 0 != groupmenunew.length) {
		// Có dữ liệu
		data = data + "&groupmenunew=" + groupmenunew;
	}
	//alert('New: ' + groupmenunew.length);
	//alert('Old: ' + groupmenuold.length);
	$.ajax({
		url : "UpdateGroupMenu",
		type : "post",
		data : data,
		success : function(response) {
			if (response.result == "true") {
				//alert("Update thông tin thành công");
				window.location.reload();
			} else {
				//alert("Update thông tin KHÔNG thành công");
				window.location.reload();
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			//alert(textStatus, errorThrown);
			window.location.reload();
		}
	});

}

/**
 * 
 */
/*
function addmenu() {
	var data = "add_name_menu=" + $('#add_name_menu').val()
			+ "&add_price_menu=" + $('#add_price_menu').val()
			+ "&add_describe_menu=" + $('#add_describe_menu').val()
			+ "&add_menu_in_group_menu="
			+ document.getElementById("add_menu_in_group_memu").value;
	$.ajax({
		url : URL + "updatemenu",
		type : "post",
		data : data,
		success : function(response) {
			if (response.result == "true") {
				//alert("Update thông tin thành công");
				window.location.reload();
			} else {
				//alert("Update thông tin KHÔNG thành công");
				window.location.reload();
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			//alert(textStatus, errorThrown);
			window.location.reload();
		}
	});

}*/
/**
 * Function edit menu
 * @param id
 */
function editmenu(id){
	alert(id);
	var data = "edit_name_menu=" + $('#edit_name_menu').val()
	+ "&edit_price_menu=" + $('#edit_price_menu').val()
	+ "&edit_describe_menu=" + $('#edit_describe_menu').val()
	+ "&edit_menu_in_group_menu="
	+ document.getElementById("edit_menu_in_group_memu").value
	+ "&id_menu=" +id;
	$.ajax({
		url : "Chinh-sua-thong-tin-mon-an",
		type : "post",
		data : data,
		success : function(response) {
			if (response.result == "true") {
				//alert("Update thông tin thành công");
				window.location.reload();
			} else {
				//alert("Update thông tin KHÔNG thành công");
				window.location.reload();
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			//alert(textStatus, errorThrown);
			window.location.reload();
		}
	});
}

function loadReservation(id) {
	//id danh sách trả về theo mảng
	$.ajax({
		url : "thong-tin-dat-ban",
		type : "post",
		data : "id_deservation=" + id,
		success : function(data) {
			if (data.result == "true") {
				debugger;
				id_deservation = data.idDeservation;
				$('#name_customer').text(data.nameCustomer);
				$('#count_people_reservation').text(data.countPeople + " người");
				$('#email_reservation').text(data.contactCustomer);
				$('#time_reservation').text(data.time + "Ngày: " + data.date);
				$('#phone_number_reservation').text(data.phone);
				if(data.status == 1){
					//Da xac nhan
					$('#status_reservation').text("Đã xác nhận");
					$('#confirm').text("Hủy xác nhận");
					$('#title_comfirm').text("Thực hiện hủy xác nhận");
					$('#recomment_comfirm').text("Bạn đang thực hiện hủy xác nhận đối với khách hàng: " + data.nameCustomer);
					$('#cancel').remove();
				}else if(data.status = -1){
					//Da xac nhan
					$('#status_reservation').text("Đã hủy đơn");
				}else{
					//Chua xac nhan
					$('#status_reservation').text("Chưa xác nhận");
					$('#confirm').text("Xác nhận");
				}
				
			} else {
				window.location.reload();
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			//alert(textStatus, errorThrown);
			window.location.reload();
		}
	});
};

/**
 * Xác nhận hoặc hủy xác nhận
 */
function confirm(){
	if(id_deservation != ''){
		debugger;
		$.ajax({
			url : "thong-tin-dat-ban",
			type : "post",
			data : "id_deservation=" + id_deservation + "&confirm=true",
			success : function(data) {
				$('#confirm_dialog').dialog("close");
				var message = data.message;
				//change view
				//close
				var result = data.result;
				
				$('#message_box').text = message;
				$("#dialog_message").modal()
			},
			error : function(jqXHR, textStatus, errorThrown) {
				//alert(textStatus, errorThrown);
				window.location.reload();
			}
		});
	}
	window.location.reload();
}
/**
 * Hủy đặt chỗ
 */
function cancel(){
	if(id_deservation != ''){
		debugger;
		$.ajax({
			url : "thong-tin-dat-ban",
			type : "post",
			data : "id_deservation=" + id_deservation + "&cancel=true",
			success : function(data) {
				var message = data.message;
				
				$('#message_box').text = message;
				$("#dialog_message").modal()
			},
			error : function(jqXHR, textStatus, errorThrown) {
				//alert(textStatus, errorThrown);
				window.location.reload();
			}
		});
	}
}