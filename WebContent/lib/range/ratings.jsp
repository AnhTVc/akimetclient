<%@page import="com.project.POJO.REST.Restaurant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#hearts {
	color: #ee8b2d;
}

#hearts-existing {
	color: #ee8b2d;
}
</style>
<%
Restaurant restaurantRESTDaya = (Restaurant) session
.getAttribute("restData");
//String URL = Constant.URL_DOMAIN + "/fooddrink/";
Restaurant restaurant= restaurantRESTDaya;
%>
</head>
<body>
<div class="row lead">
        <div id="hearts" class="starrr btn col-sm-7 " style="font-size: 26px"></div>
        <div class="col-sm-5" style="padding-top: 13px; padding-left: 5px"> 
        	<span id="count" style="font-size: 16px; font-weight: 600;">Bình thường</span> 
        </div>
	</div>
	<!-- Modal -->
	  <div class="modal fade" id="modal_rating" role="dialog">
	    <div class="modal-dialog modal-sm">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Đánh giá <%=restaurant.getName_restaurant() %></h4>
	        </div>
	        <div class="modal-body">
	          <p id="content_rating">Nội dung đánh giá bình thường</p>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	          <button type="button" class="btn btn-success" id="complete_rating">Hoàn tất</button>
	        </div>
	      </div>
	    </div>
	  </div>
<script type="text/javascript">
// Starrr plugin (https://github.com/dobtco/starrr)
var __slice = [].slice;
var data_rating;

(function($, window) {
  var Starrr;

  Starrr = (function() {
    Starrr.prototype.defaults = {
      rating: void 0,
      numStars: 5,
      change: function(e, value) {}
    };

    function Starrr($el, options) {
      var i, _, _ref,
        _this = this;

      this.options = $.extend({}, this.defaults, options);
      this.$el = $el;
      _ref = this.defaults;
      for (i in _ref) {
        _ = _ref[i];
        if (this.$el.data(i) != null) {
          this.options[i] = this.$el.data(i);
        }
      }
      this.createStars();
      this.syncRating();
      this.$el.on('mouseover.starrr', 'span', function(e) {
        return _this.syncRating(_this.$el.find('span').index(e.currentTarget) + 1);
      });
      this.$el.on('mouseout.starrr', function() {
        return _this.syncRating();
      });
      this.$el.on('click.starrr', 'span', function(e) {
        return _this.setRating(_this.$el.find('span').index(e.currentTarget) + 1);
      });
      this.$el.on('starrr:change', this.options.change);
    }

    Starrr.prototype.createStars = function() {
      var _i, _ref, _results;

      _results = [];
      for (_i = 1, _ref = this.options.numStars; 1 <= _ref ? _i <= _ref : _i >= _ref; 1 <= _ref ? _i++ : _i--) {
        _results.push(this.$el.append("<span class='glyphicon .glyphicon-star-empty'></span>"));
      }
      return _results;
    };

    Starrr.prototype.setRating = function(rating) {
      if (this.options.rating === rating) {
        rating = void 0;
      }
      this.options.rating = rating;
      this.syncRating();
      return this.$el.trigger('starrr:change', rating);
    };

    Starrr.prototype.syncRating = function(rating) {
      var i, _i, _j, _ref;

      rating || (rating = this.options.rating);
      if (rating) {
        for (i = _i = 0, _ref = rating - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
          this.$el.find('span').eq(i).removeClass('glyphicon-star-empty').addClass('glyphicon-star');
        }
      }
      if (rating && rating < 5) {
        for (i = _j = rating; rating <= 4 ? _j <= 4 : _j >= 4; i = rating <= 4 ? ++_j : --_j) {
          this.$el.find('span').eq(i).removeClass('glyphicon-star').addClass('glyphicon-star-empty');
        }
      }
      if (!rating) {
        return this.$el.find('span').removeClass('glyphicon-star').addClass('glyphicon-star-empty');
      }
    };

    return Starrr;

  })();
  return $.fn.extend({
    starrr: function() {
      var args, option;

      option = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      return this.each(function() {
        var data;

        data = $(this).data('star-rating');
        if (!data) {
          $(this).data('star-rating', (data = new Starrr($(this), option)));
        }
        if (typeof option === 'string') {
          return data[option].apply(data, args);
        }
      });
    }
  });
})(window.jQuery, window);

$(function() {
  return $(".starrr").starrr();
});

$( document ).ready(function() {
      
  $('#hearts').on('starrr:change', function(e, value){
	  //-------------------------------------------------------------//
	  //	Check null session 										 //
	  //	If session is null, must login							 //
	  //	When login, summit to server							 //
	  //-------------------------------------------------------------//
	  var id_customer = "<%=session.getAttribute("id_custommer")%>";
	  var notify;
	  if(id_customer != 'null'){
		  var message;
		  
		  if(value == 1){
			  message = "Kém";
			  notify = "Bạn thực hiện đánh giá nhà hàng là kém";
		  }else if(value == 2){
			  message = "Tạm chấp nhận được";
			  notify = "Bạn thực hiện đánh giá nhà hàng là tạm chấp nhận được";
		  }else if(value == 3){
			  message = "Bình thường";
			  notify = "Bạn thực hiện đánh giá nhà hàng là bình thường";
		  }else if(value == 4){
			  message = "Khá tốt";
			  notify = "Bạn thực hiện đánh giá nhà hàng là khá tốt";
		  }else if(value == 5){
			  message = "Tuyệt vời";
			  notify = "Bạn thực hiện đánh giá nhà hàng là tuyệt vời";
		  }
		  
	    $('#count').html(message);
	    
	    var idRestaurant = <%=restaurant.getId_restaurant()%>;
	    data_rating = 'idRestaurant=' + idRestaurant + '&rating=' + value;
	    
	    //	Open modal
	    $('#content_rating').text(notify)
	    $("#modal_rating").modal()
	    //	Send to server
	    //rating(data_rating);
	    
	  }else{
		  $("#loginModal").modal()
	  }
	  
  });
  
  $('#hearts-existing').on('starrr:change', function(e, value){
    $('#count-existing').html(value);
  });
  
  // Click complete rating
  $("#complete_rating").click(function(){
	  	$('#modal_rating').modal('hide');
	  	rating(data_rating);
	});
  
});




/**
 * Send data to server rating
 */
function rating(data){
	$.ajax({
        type:'POST',
        url: "RatingController",
        data: data,
        success:function(data){
        	
            if(data.result == 'success'){
            	alert("Hoàn thành đánh bước đánh giá")
            }else{
            	alert("Có lỗi trong quá trình thực hiện đánh giá")
            }
        },
        error: function(data){
            console.log("error");
            console.log(data);
            alert("Có lỗi trong quá trình thực hiện đánh giá")
        }
    });
}
</script>
</body>
</html>