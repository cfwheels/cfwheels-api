
<cfparam name="docs">
<cfoutput>

<div class="row">
	<div class="col-sm-3">

	<div id="versions">
		#includePartial("versions")#
	</div>

	 <!-- Nav tabs -->
	  <ul class="nav nav-tabs" role="tablist">
	    <li role="presentation" class="active"><a href="##functionlist" aria-controls="functionlist" role="tab" data-toggle="tab">A-Z Functions <small>(<span class="functioncount">#arraylen(docs.functions)#</span>)</small></a></li>
	    <li role="presentation"><a href="##sections" aria-controls="sections" role="tab" data-toggle="tab">Sections</a></li>
	  </ul>

	  <!-- Tab panes -->
	  <div class="tab-content">

			<!--- A-Z Functions--->
		    <div role="tabpanel" class="tab-pane active" id="functionlist">
				#includePartial("functionlist")#
		    </div><!--/col-->

			<!--- Section/category List --->
			<div role="tabpanel" class="tab-pane" id="sections">
				#includePartial("sections")#
			</div>

	  </div>

	</div><!-- /col-->

	<div class="col-sm-9">

	    <!--- Function Definition Output--->
	    <div id="main">
		<cfloop from="1" to="#arraylen(docs.functions)#" index="func">
			#includePartial("definition")#
		</cfloop>
		</div><!--/main-->

	</div><!--/col -->


</div><!--/row-->

</cfoutput>
<script>
$(document).ready(function(){

	checkForUrlHash();

	$("#searchclear").hide();

	// Version switcher
	$("#versioncontrol").on("change", function(e){
		var version=$(this).val();
		var oldHash=window.location.hash;
		window.location="/v" + version + oldHash;
	});

	$(window).on('hashchange',function(){
		filterByFunctionName(location.hash.slice(1));
	});

	$(".section").on("click", function(e){
		filterBySection($(this).data("section"));
		updateFunctionCount();
		e.preventDefault();
	});
	$(".category").on("click", function(e){
		filterByCategory($(this).data("section"), $(this).data("category"));
		updateFunctionCount();
		e.preventDefault();
	});

	$(".docreset").on("click", function(e){
		$(".functiondefinition").show();
		$(".functionlink").show();
		updateFunctionCount();
		e.preventDefault();
	});

	$(".functionlink").on("click", function(e){
		filterByFunctionName($(this).data("function"));
		$(".functionlink").removeClass("active");
		$(this).addClass("active");
		updateFunctionCount();
		e.preventDefault();
	});

	$(".filtersection").on("click", function(e){
		filterBySection($(this).closest(".functiondefinition").data("section"));
		updateFunctionCount();
		e.preventDefault();
	});

	$(".filtercategory").on("click", function(e){
		var parent=$(this).closest(".functiondefinition");
		filterByCategory(parent.data("section"),parent.data("category"));
		updateFunctionCount();
		e.preventDefault();
	});

	function filterByFunctionName(name){
		$("#main").find(".functiondefinition").hide().end()
				   .find("[data-function='" + name + "']").show().end()
				   .find("#" + name).show();
		window.location.hash="#" + name;
	}
	function filterByCategory(section, category){
		$("#functionlist").find(".functionlink").hide().end()
				   .find('[data-section="' + section + '"][data-category="' + category + '"]').show();
		$("#main").find(".functiondefinition").hide().end()
				   .find('[data-section="' + section + '"][data-category="' + category + '"]').show();
	}
	function filterBySection(section){
		$("#functionlist").find(".functionlink").hide().end()
				   .find('[data-section="' + section + '"]').show();
		$("#main").find(".functiondefinition").hide().end()
				   .find('[data-section="' + section + '"]').show();
	}
	function updateFunctionCount(){
		$(".functioncount").html($("#functionlist a.functionlink:visible").length);
	}

	function checkForUrlHash(){
		var match = location.hash.match(/^#?(.*)$/)[1];
		if (match){filterByFunctionName(match);}
	}

	$("#searchclear").click(function(){
	    $("#doc-search").val('');
	      $("#functionlist a").show();
	      updateFunctionCount();
	});

  // Write on keyup event of keyword input element
  $("#doc-search").keyup(function(){
    // When value of the input is not blank
    if( $(this).val() != "")
    {
    	$("#searchclear").show();
      // Show only matching TR, hide rest of them
      $("#functionlist a").hide();
      $("#functionlist a:contains-ci('" + $(this).val() + "')").show();
		updateFunctionCount();
    }
    else
    {
      // When there is no input or clean again, show everything back
    	$("#searchclear").hide();
        $("#functionlist a").show();
        updateFunctionCount();
    }
  });


});
// jQuery expression for case-insensitive filter
$.extend($.expr[":"],
{
    "contains-ci": function(elem, i, match, array)
  {
    return (elem.textContent || elem.innerText || $(elem).text() || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
  }
});

;!(function ($) {
    $.fn.classes = function (callback) {
        var classes = [];
        $.each(this, function (i, v) {
            var splitClassName = v.className.split(/\s+/);
            for (var j = 0; j < splitClassName.length; j++) {
                var className = splitClassName[j];
                if (-1 === classes.indexOf(className)) {
                    classes.push(className);
                }
            }
        });
        if ('function' === typeof callback) {
            for (var i in classes) {
                callback(classes[i]);
            }
        }
        return classes;
    };
})(jQuery);

</script>
