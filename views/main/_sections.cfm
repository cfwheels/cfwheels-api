<cfoutput>
<cfif structKeyExists(docs, "sections")>
	<ul class="nav nav-list">
	<cfloop from="1" to="#arraylen(docs.sections)#" index="s">
		<li><a href=""	data-section="#$cssClassLink(docs.sections[s]['name'])#" class="section" data-toggle="collapse" data-target="###$cssClassLink(docs.sections[s]['name'])#"><i class="fa fa-caret-right"></i> #docs.sections[s]['name']#</a>
		<ul  class="nav nav-list collapse" id="#$cssClassLink(docs.sections[s]['name'])#">
		<cfloop from="1" to="#arraylen(docs.sections[s]['categories'])#" index="ss">
			<li><a href=""	data-section="#$cssClassLink(docs.sections[s]['name'])#"	data-category="#$cssClassLink(docs.sections[s]['categories'][ss])#" class="category">#docs.sections[s]['categories'][ss]#</a></li>
		</cfloop>
		</ul>
		</li>
	</cfloop>
	<li><a href=""	data-section=""	data-category="" class="section">Uncategorized</a></li>
	</ul>
</cfif>
</cfoutput>
