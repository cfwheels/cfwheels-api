<cfoutput>
	 	<label>Quick Search</label>
	 <div class="form-group">
		<div class="btn-group">
		  <input name="doc-search" id="doc-search" placeholder="Type to filter..."  type="search" class="form-control">
		  <i id="searchclear" class="fa fa-times-circle"></i>
		</div>
	  </div>
	<p id="functionlistoutput">
		<a href="" class="docreset"><i class="fa fa-eye"></i> All</a>
		<cfloop from="1" to="#arraylen(docs.functions)#" index="func">
		<cfset meta=docs.functions[func]>
			<a href="" class="functionlink"	data-section="#meta.tags.sectionClass#" data-category="#meta.tags.categoryClass#" data-function="#lcase(meta.slug)#">#meta.name#()</a>
		</cfloop>
	</p>
</cfoutput>
