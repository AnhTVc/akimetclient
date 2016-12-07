function toggleVisibilityImage() {
			document.getElementById('image_restaurant').style.display = 'none';
			document.getElementById('menu_restaurant').style.display = 'none';
			document.getElementById('restaurant_intro').style.display = 'none';

			document.getElementById('image_restaurant').style.display = 'block';
		}

		function toggleVisibilityMenu() {
			document.getElementById('image_restaurant').style.display = 'none';
			document.getElementById('menu_restaurant').style.display = 'none';
			document.getElementById('restaurant_intro').style.display = 'none';

			document.getElementById('menu_restaurant').style.display = 'block';
		}

		function toggleVisibilityIntro() {
			document.getElementById('image_restaurant').style.display = 'none';
			document.getElementById('menu_restaurant').style.display = 'none';
			document.getElementById('restaurant_intro').style.display = 'none';

			document.getElementById('restaurant_intro').style.display = 'block';
		}

		
//Function đặt bàn
		$(function() {
			$('#datetimepicker').datetimepicker({
				format : 'YYYY-MM-DD'

			});
			$('#datetimepicker6').datetimepicker(
					{
						format : 'HH:mm',
						stepping : 30,
						enabledHours : [ 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
								16, 17, 18, 19, 20, 21, 22, 23, 24 ],
					});
		});
		
		
		