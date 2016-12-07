;
(function($) {
	$.fn.unveil = function(threshold, callback) {
		var $w = $(window), th = threshold || 0, retina = window.devicePixelRatio > 1, attrib = retina ? "data-src-retina"
				: "data-src", images = this, loaded;
		this.one("unveil", function() {
			var source = this.getAttribute(attrib);
			source = source || this.getAttribute("data-src");
			if (source) {
				this.setAttribute("src", source);
				if (typeof callback === "function")
					callback.call(this);
			}
		});
		function unveil() {
			var inview = images.filter(function() {
				var $e = $(this);
				if ($e.is(":hidden"))
					return;
				var wt = $w.scrollTop(), wb = wt + $w.height(), et = $e
						.offset().top, eb = et + $e.height();
				return eb >= wt - th && et <= wb + th;
			});
			loaded = inview.trigger("unveil");
			images = images.not(loaded);
		}
		$w.on("scroll.unveil resize.unveil lookup.unveil", unveil);
		unveil();
		return this;
	};
})(window.jQuery || window.Zepto);
jQuery(function($) {
	$(document).ready(function() {
		$('figure img').unveil();
	})
	$('#offcanvas-toggler').on('click', function(event) {
		event.preventDefault();
		$('body').addClass('offcanvas');
	});
	$('.close-offcanvas, .offcanvas-overlay').on('click', function(event) {
		event.preventDefault();
		$('body').removeClass('offcanvas');
	});
	$('.sp-megamenu-wrapper').parent().parent().css('position', 'static')
			.parent().css('position', 'relative');
	$('.sp-menu-full').each(function() {
		$(this).parent().addClass('menu-justify');
	});
	/*$('[data-toggle="tooltip"]').tooltip();*/
	$(document).on(
			'click',
			'.sp-rating .star',
			function(event) {
				event.preventDefault();
				var data = {
					'action' : 'voting',
					'user_rating' : $(this).data('number'),
					'id' : $(this).closest('.post_rating').attr('id')
				};
				var request = {
					'option' : 'com_ajax',
					'plugin' : 'helix3',
					'data' : data,
					'format' : 'json'
				};
				$.ajax({
					type : 'POST',
					data : request,
					beforeSend : function() {
						$('.post_rating .ajax-loader').show();
					},
					success : function(response) {
						var data = $.parseJSON(response.data);
						$('.post_rating .ajax-loader').hide();
						if (data.status == 'invalid') {
							$('.post_rating .voting-result').text(
									'You have already rated this entry!')
									.fadeIn('fast');
						} else if (data.status == 'false') {
							$('.post_rating .voting-result').text(
									'Somethings wrong here, try again!')
									.fadeIn('fast');
						} else if (data.status == 'true') {
							var rate = data.action;
							$('.voting-symbol').find('.star').each(function(i) {
								if (i < rate) {
									$(".star").eq(-(i + 1)).addClass('active');
								}
							});
							$('.post_rating .voting-result').text('Thank You!')
									.fadeIn('fast');
						}
					},
					error : function() {
						$('.post_rating .ajax-loader').hide();
						$('.post_rating .voting-result').text(
								'Failed to rate, try again!').fadeIn('fast');
					}
				});
			});
	$('#select-question').on('change', function(event) {
		if ($(this).val() == 'Others') {
			$('#input-subject').attr('required', '').parent().show();
		} else {
			$('#input-subject').removeAttr('required', '').parent().hide();
		}
	});
	$(document)
			.on(
					'submit',
					'.sppb-ajaxt-contact-form-advanced',
					function(event) {
						var $this = $(this);
						event.preventDefault();
						var $self = $(this);
						var value = $(this).serializeArray();
						var request = {
							'option' : 'com_sppagebuilder',
							'task' : 'ajax',
							'addon' : 'ajax_contact_advanced',
							'data' : value,
							'g-recaptcha-response' : $('#g-recaptcha-response')
									.val()
						};
						$
								.ajax({
									type : 'POST',
									data : request,
									beforeSend : function() {
										$self.find('.fa').addClass(
												'fa-spinner fa-spin');
									},
									success : function(response) {
										var data = $.parseJSON(response);
										$self.find('.fa-spin').removeClass(
												'fa-spinner fa-spin');
										if (data.status) {
											$this
													.find(
															'input[type=text], input[type=email], input[type=number], textarea')
													.val("");
										}
										$self.next('.sppb-ajax-contact-status')
												.html(data.message).fadeIn()
												.delay(5000).fadeOut(500);
										grecaptcha.reset();
									}
								});
						return false;
					});
	if ($("#sp-header").length > 0) {
		$(window).on(
				'scroll',
				function() {
					if ($(window).scrollTop() > 300) {
						$("#sp-header").addClass(
								'fixed-header animated fadeInDown');
					} else {
						$("#sp-header").removeClass(
								'fixed-header animated fadeInDown');
					}
				});
	}
});